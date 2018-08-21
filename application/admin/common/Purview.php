<?php
/**
 * 权限验证公共类
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\common;

use think\Controller;
class Purview extends Controller
{
    public function __construct()
    {
        parent::__construct();
        $code = $this->_checkLogin();

        if ($code == 401)
        {
            $this->error('请重新登陆！', '/admin/Login/index');
        }
        elseif ($code == 403)
        {
            $this->message('对不起，你无权限访问本页面！');
        }
    }
    /**
     * 检测登陆状态
     * @access protected
     * @return integer 登陆状态码
     */
    private function _checkLogin()
    {
        //未登陆
        if (!session('admin_name'))
        {
            return 401;
        }
        //超级管理员
        elseif (session('is_super_admin') == 1)
        {
            return 200;
        }//其他管理员，要校验是否有访问当前路径的权限
        else
        {
            $allowItems = session('allow_items');

            if ($allowItems)
            {
                $path = strtolower('/' . request()->module() . '/' . request()->controller() . '/' . request()->action());
                if (isset($allowItems[$path]))
                {
                    return 200;
                }
            }
        }
        return 403;
    }
    /**
     * 弹出提示信息，不跳转
     * @access protected
     * @param  mixed     $msg 提示信息
     * @return void
     */
    protected function message($msg)
    {
        $this->error($msg, '', 'notice');
    }
    /**
     * 重载fetch方法，使用原生大小写的控制器及方法名作为模板
     * @access public
     * @param  string    $template 模板文件名或者内容
     * @param  array     $vars     模板输出变量
     * @param  array     $config     模板参数
     * @return string
     * @throws \Exception
     */
    public function fetch($template = '', $vars = [], $config = [])
    {
        $template = !$template ? $this->request->controller() . '/' . $this->request->action(true) : $template;
        return $this->view->fetch($template, $vars, $config);
    }

}
