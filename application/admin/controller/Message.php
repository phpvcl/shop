<?php

/**
 * 站内消息管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Message as myModel;

class Message extends Purview
{

    protected $statusItems = ['0' => '未读', '1' => '已读'];

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {

        $model = new myModel();
        $list = $model->paginate(10);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('statusItems', $this->statusItems);

        return $this->fetch();
    }

    /**
     * 执行删除
     * 
     * @return string
     */
    public function del()
    {
        $id = input('id/d');

        if ($id > 0)
        {
            $model = myModel::get($id);
            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/Message/index');
            }
        }
        return $this->error('出错了，记录不存在');
    }

    /**
     * 编辑页面
     * 
     * @return string
     */
    public function edit()
    {
        $id = input('id/d');

        if ($id > 0)
        {
            $model = new myModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);

                $this->assign('statusItems', $this->statusItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Message/index');
    }

    /**
     * 执行编辑
     * 
     * @return string
     */
    public function doEdit()
    {
        $id = input('id/d');
        if ($id > 0)
        {
            $data = $this->request->post('Message');

            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Message/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Message/edit/id/' . $id);
                }
            }
        }
        return $this->error('操作失败，记录不存在');
    }

    /**
     * 新增页面
     * 
     * @return string
     */
    public function add()
    {
        $this->assign('statusItems', $this->statusItems);
        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Message');

        $model = new myModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Message/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Message/add');
        }
    }

}
