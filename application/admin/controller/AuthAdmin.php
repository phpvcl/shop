<?php
/**
 * 管理员管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AuthAdmin as myModel;

class AuthAdmin extends Purview
{

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
            
            $model = myModel::where('is_super_admin', '<', 1)->find($id);

            if ($model && $model->delete())
            {
                $model->authRole()->detach();
                return $this->success('操作成功', '/admin/AuthAdmin/index');
            }
        }
        return $this->error('出错了，记录不存在');
    }

    /**
     * 记事本页面
     * 
     * @return string
     */
    public function notebook()
    {
        $id = session('admin_id');
        $model = new myModel();
        $records = $model->get($id);
        if ($records)
        {
            $this->assign('records', $records);
            return $this->fetch();
        }
        else
        {
            return $this->error('出错了，记录不存在');
        }
    }
    /**
     * 执行编辑记事本
     * 
     * @return string
     */
    public function doEditNoteBook()
    {
        $id = session('admin_id');
        $data = $this->request->post('AuthAdmin');
        $model = new myModel();
        $records = $model->get($id);
        if ($records && $records->save($data))
        {
            return $this->success('操作成功');
        }
        else
        {
            return $this->error('出错了，记录不存在');
        }
    }

    /**
     * 个人设置页面
     * 
     * @return string
     */
    public function adminInfo()
    {
        $id = session('admin_id');
        $model = new myModel();
        $records = $model->get($id);
        if ($records)
        {
            $this->assign('records', $records);
            return $this->fetch();
        }
        else
        {
            return $this->error('出错了，记录不存在');
        }
    }

    /**
     * 执行个人设置
     * 
     * @return string
     */
    public function doEditAdminInfo()
    {
        $id = session('admin_id');
        $data = $this->request->post('AuthAdmin');
        $model = new myModel();
        $records = $model->get($id);
        if ($records && isset($data['oldpassword']) && $records->password == md5($data['oldpassword']))
        {
            if ($records->save($data))
            {
                return $this->success('操作成功');
            }
            else
            {
                return $this->error($records->getError());
            }
        }
        else
        {
            return $this->error('出错了，旧密码不正确');
        }
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
            $records = $model->where('is_super_admin', '<', 1)->find($id, 'AuthRole');
            if ($records)
            {

                $allRoles = $model->authRole()->getAllByKey();
                $selectRoles = $records->auth_role->toArray();
                if ($allRoles && $selectRoles)
                {
                    foreach ($selectRoles as $role)
                    {
                        if (isset($allRoles[$role['id']]))
                        {
                            $allRoles[$role['id']]['checked'] = 'checked';
                        }
                    }
                }
                $this->assign('records', $records);
                $this->assign('AuthRole', $allRoles);

                return $this->fetch();
            }
        }
        return $this->error('出错了，记录不存在');
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
            $data = $this->request->post('AuthAdmin');
            $roles = $this->request->post('role_id');
            if (!$roles)
            {
                return $this->error('操作失败，还没有选择角色');
            }
            else
            {
                $roles = array_values($roles);
            }

            $model = new myModel();
            $myModel = $model->where('is_super_admin', '<', 1)->find($id, 'AuthRole');
            if ($myModel)
            {
                $delete = [];
                $add = [];
                //关联表
                $oldRoles = $myModel->AuthRole->toArray();
                $rs = $myModel->save($data);
                if ($oldRoles)
                {
                    $oldId = [];
                    foreach ($oldRoles as $role)
                    {
                        $oldId[$role['id']] = $role['id'];
                    }
                    //要删除的列表
                    $delete = array_diff($oldId, $roles);
                    //要新增的列表
                    $add = array_diff($roles, $oldId);
                }
                else
                {
                    $add = $roles;
                }
                if ($add)
                {
                    $add = array_values($add);
                    $rs = $myModel->authRole()->attach($add) || $rs;
                }
                if ($delete)
                {
                    $delete = array_values($delete);
                    $rs = $myModel->authRole()->detach($delete) || $rs;
                }
                if ($rs)
                {
                    return $this->success('操作成功', '/admin/AuthAdmin/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AuthAdmin/edit/id/' . $id);
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
        $id = input('id/d');
        if ($id > 0)
        {
            $data = $this->request->post('AuthAdmin');

            $model = new myModel();

            $myModel = $model->where('is_super_admin', '<', 1)->find($id);
            if ($myModel)
            {
                if ($myModel->allowField('password')->save($data))
                {
                    return $this->success('操作成功', '/admin/AuthAdmin/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AuthAdmin/edit/id/' . $id . '#tab=modifyPassword');
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
        $model = new myModel();
        $this->assign('AuthRole', $model->authRole()->all());

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('AuthAdmin');
        $roles = $this->request->post('role_id');
        if (!$roles)
        {
            return $this->error('操作失败，还没有选择角色');
        }
        else
        {
            $roles = array_values($roles);
        }
        $model = new myModel();

        if ($model->save($data) && $model->authRole()->attach($roles))
        {
            return $this->success('操作成功', '/admin/AuthAdmin/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AuthAdmin/add');
        }
    }

}
