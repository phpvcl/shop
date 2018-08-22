<?php

/**
 * 角色管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AuthRole as myModel;
use app\admin\common\Tree;

class AuthRole extends Purview
{

    protected $statusItems = ['0' => '禁止', '1' => '开启'];

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
     * 获取树结构json数据
     * 
     * @return string
     */
    public function getTree()
    {
        $id = $this->request->param('id/d');
        $model = new myModel();
        $data = $model->authItems()->getAllByKey();
        $result = ['code' => 1, 'msg' => 'error', 'data' => []];
        if ($data)
        {

            if ($id)
            {
                $key = 0;
                $model->id = $id;
                $myModel = $model->authItems()->select();
                $relation = $myModel->toArray();
                if ($relation)
                {
                    foreach ($relation as $item)
                    {
                        $key = $item['id'];
                        if (isset($data[$key]))
                        {
                            $data[$key]['checked'] = 'checked';
                        }
                    }
                }
            }

            $tree = new Tree();
            $list = $tree->getTree($data);
            $result = ['code' => 0, 'msg' => 'ok', 'data' => $list];
        }
        return json($result);
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
                $model->authItems()->detach();
                return $this->success('操作成功', '/admin/AuthRole/index');
            }
        }
        return $this->error('出错了，记录不存在', '/admin/AuthRole/index');
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

                $this->assign('statusItems', $this->statusItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/AuthRole/index');
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
            $data = $this->request->post('AuthRole');
            $items = $this->request->post('items');

            if (!$items)
            {
                return $this->error('操作失败，还没有选择权限');
            }

            $model = new myModel();
            $myModel = $model->get($id, 'AuthItems');

            if ($myModel)
            {
                $delete = [];
                $add = [];
                //关联表
                $oldItems = $myModel->authItems->toArray();
                $rs = $myModel->save($data);
                if ($oldItems)
                {
                    $oldId = [];
                    foreach ($oldItems as $item)
                    {
                        $oldId[$item['id']] = $item['id'];
                    }
                    //要删除的列表
                    $delete = array_diff($oldId, $items);
                    //要新增的列表
                    $add = array_diff($items, $oldId);
                }
                else
                {
                    $add = $items;
                }
                if ($add)
                {
                    $add = array_values($add);
                    $rs = $myModel->authItems()->attach($add) || $rs;
                }
                if ($delete)
                {
                    $delete = array_values($delete);
                    $rs = $myModel->authItems()->detach($delete) || $rs;
                }


                if ($rs)
                {
                    return $this->success('操作成功', '/admin/AuthRole/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AuthRole/edit/id/' . $id);
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
        $data = $this->request->post('AuthRole');
        $items = $this->request->post('items');
        if (!$items)
        {
            return $this->error('操作失败，还没有选择权限');
        }
        else
        {
            $items = array_values($items);
        }
        $model = new myModel();

        if ($model->save($data) && $model->authItems()->attach($items))
        {
            return $this->success('操作成功', '/admin/AuthRole/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AuthRole/add');
        }
    }

}
