<?php

/**
 * 用户管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Users as MyModel;

class Users extends Purview
{

    protected $sexItems = ['1' => '男', '2' => '女'];
    protected $checkedItems = ['1' => '未审', '2' => '已审'];

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        // 查询状态为1的用户数据 并且每页显示10条数据

        $keywords = $this->request->get('keywords');
        $checked = $this->request->param('checked/d');

        $query = [];
        $model = new MyModel();
        if ($keywords)
        {
            $model = $model->where('username', 'like', $keywords . '%');
            $query['keywords'] = $keywords;
        }
        if ($checked > 0)
        {
            $model = $model->where('checked', '=', $checked);
            $query['checked'] = $checked;
        }

        $list = $model->order('id', 'desc')->paginate(10, false, ['query' => $query]);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('keywords', $keywords);
        $this->assign('checked', $checked);
        $this->assign('sexItems', $this->sexItems);
        $this->assign('checkedItems', $this->checkedItems);

        return $this->fetch();
    }

    /**
     * 执行批量删除
     * 
     * @return string
     */
    public function batchDel()
    {
        $idArray = $this->request->post('id');

        if (isset($idArray[0]))
        {
            $model = new MyModel();
            $rs = $model->where('id', 'in', $idArray)->delete();
            if ($rs)
            {
                return $this->success('操作成功', '/admin/Users/index');
            }
        }
        return $this->error('出错了', '/admin/Users/index');
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
                return $this->success('操作成功', '/admin/Users/index');
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
            $model = new MyModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);

                $this->assign('sexItems', $this->sexItems);
                $this->assign('checkedItems', $this->checkedItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Users/index');
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
            $data = $this->request->post('Users');
            $model = new MyModel();
            $model->startTrans();
            //加锁
            $myModel = $model->lock(true)->find($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                { 
                    $model->commit();
                    return $this->success('操作成功', '/admin/Users/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Users/edit/id/' . $id);
                }
            }
        }
        return $this->error('操作失败，记录不存在');
    }

    /**
     * 执行修改密码
     * 
     * @return string
     */
    public function modifyPassword()
    {
        $id = $this->request->param('id/d');
        if ($id > 0)
        {
            $data = $this->request->post('Users');
            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->allowField('password')->save($data))
                {
                    return $this->success('操作成功', '/admin/Users/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Users/edit/id/' . $id . '#tab=modifyPassword');
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
        $this->assign('sexItems', $this->sexItems);
        $this->assign('checkedItems', $this->checkedItems);

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Users');

        $model = new MyModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Users/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Users/add');
        }
    }

}
