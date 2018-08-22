<?php

/**
 * 支付方式管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Payment as myModel;

class Payment extends Purview
{

    protected $isOnlineItems = ['0' => '否', '1' => '是'];

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
        $this->assign('is_onlineItems', $this->isOnlineItems);

        return $this->fetch();
    }

    /**
     * 执行删除
     * 
     * @return string
     */
    public function del()
    {
        $id = $this->request->param('id/d');

        if ($id > 0)
        {
            $model = myModel::get($id);
            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/Payment/index');
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
        $id = $this->request->param('id/d');

        if ($id > 0)
        {
            $model = new myModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);

                $this->assign('is_onlineItems', $this->isOnlineItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Payment/index');
    }

    /**
     * 执行编辑
     * 
     * @return string
     */
    public function doEdit()
    {
        $id = $this->request->param('id/d');
        if ($id > 0)
        {
            $data = $this->request->post('Payment');
            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Payment/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Payment/edit/id/' . $id);
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
        $this->assign('is_onlineItems', $this->isOnlineItems);

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Payment');

        $model = new myModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Payment/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Payment/add');
        }
    }

}
