<?php
/**
 * 属性分组管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AttrGroup as myModel;

class AttrGroup extends Purview
{

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $model = new myModel();
        $list = $model->paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);

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
            $model = myModel::get($id, 'Attr');
            if ($model && $model->together('attr')->delete())
            {
                return $this->success('操作成功', '/admin/AttrGroup/index');
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
                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/AttrGroup/index');
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
            $data = $this->request->post('AttrGroup');
            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/AttrGroup/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AttrGroup/edit/id/' . $id);
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
        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('AttrGroup');

        $model = new myModel();

        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/AttrGroup/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AttrGroup/add');
        }
    }

}
