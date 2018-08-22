<?php

/**
 * 后台登陆
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use think\Controller;
use app\admin\model\AuthAdmin;

class Login extends Controller
{

    /**
     * 登陆页面
     * 
     * @return string
     */
    public function index()
    {
        return $this->fetch('Login/index');
    }

    /**
     * 管理员登陆
     * 
     * @return string
     */
    public function doLogin()
    {
        $data = $this->request->post();

        $rules = [
            'username|用户名' => 'require|min:5',
            'password|密码' => 'require|length:6,12',
            'verify|验证码' => 'require|captcha'
        ];
        $res = $this->validate($data, $rules);

        if (1 == $res)
        {
            $model = new AuthAdmin();

            $myAdmin = $model->where(['username' => $data['username'], 'password' => md5($data['password'])])->find();

            if ($myAdmin)
            {
                //允许访问的队列
                $allowItems = [];
                //不是超级管理员才取权限列表
                if (!$myAdmin->is_super_admin)
                {
                    //千山万水取权限列表
                    $items = $myAdmin->authRole()->withAuthItems()->find()->AuthItems;

                    if ($items)
                    {
                        //构造以路径为索引的数组,isset比in_array快太多了
                        foreach ($items as $item)
                        {
                            if ($item['path'])
                            {
                                $allowItems[$item['path']] = $item['pid'];
                            }
                            if ($item['relation_path'])
                            {
                                //如果存在，对多个关联地址处理
                                if (false !== strpos($item['relation_path'], ','))
                                {
                                    $relation = explode(',', $item['relation_path']);
                                    foreach ($relation as $path)
                                    {
                                        if (trim($path))
                                        {
                                            $allowItems[trim($path)] = $item['pid'];
                                        }
                                    }
                                }
                                else
                                {
                                    $allowItems[$item['relation_path']] = $item['pid'];
                                }
                            }
                        }
                    }
                }
                //更新最后登陆时间
                $myAdmin->save(['last_login_time' => time()]);

                session('admin_id', $myAdmin->id);
                session('admin_name', $myAdmin->username);
                session('is_super_admin', $myAdmin->is_super_admin);
                session('allow_items', array_change_key_case($allowItems));
                return $this->redirect('/admin/Index/index');
            }
            else
            {
                return $this->error('登陆失败！');
            }
        }
        else
        {
            return $this->error('登陆失败！' . $res);
        }
    }

    /*
     * 注销
     * 
     * @return string
     */

    public function logout()
    {
        session('admin_id', null);
        session('admin_name', null);
        session('is_super_admin', null);
        session('allow_items', null);
        return $this->redirect('/admin/Login/index');
    }

}
