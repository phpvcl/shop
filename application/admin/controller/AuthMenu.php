<?php

/**
 * 后台菜单管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AuthMenu as MyModel;

class AuthMenu extends Purview
{

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $model = new MyModel();
        $list = $model->order('order')->paginate(10);
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
        $id = $this->request->param('id/d');

        if ($id > 0)
        {
            $model = MyModel::get($id);
            if ($model && $model->delete())
            {
                //解除权限项的关联
                $model->authItems()->update(['menu_id'=>0], ['menu_id'=>$id]);
                return $this->success('操作成功', '/admin/AuthMenu/index');
            }
        }
        return $this->error('出错了，记录不存在', '/admin/AuthMenu/index');
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
            $model = new MyModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);


                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/AuthMenu/index');
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
            $data = $this->request->post('AuthMenu');

            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/AuthMenu/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AuthMenu/edit/id/' . $id);
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
        $data = $this->request->post('AuthMenu');

        $model = new MyModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/AuthMenu/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AuthMenu/add');
        }
    }

}
