<?php

/**
 * 配置管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Config as myModel;

class Config extends Purview
{
    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {

        $myconfig = new myModel();
        $config = $myconfig->get(1)->toArray();
        $this->assign('config', $config);
        return $this->fetch();
    }
    /**
     * 执行编辑网站设置
     * 
     * @return string
     */
    public function setConfig()
    {
        $data = $this->request->post('config');

        $myconfig = new myModel();
        $obj = $myconfig->find();
        if ($obj->save($data))
        {
            return $this->success('修改成功', 'admin/Config/index#tab=config');
        }
        else
        {
            return $this->error($obj->getError(), 'admin/Config/index#tab=config');
        }
    }
    /**
     * 执行编辑邮箱设置
     * 
     * @return string
     */
    public function setEmailConfig()
    {
        $data = $this->request->post('config');

        $myconfig = new myModel();
        $obj = $myconfig->find();

        if ( $obj->save($data))
        {
            return $this->success('修改成功', 'admin/Config/index#tab=emailConfig');
        }
        else
        {
            return $this->error($obj->getError(), 'admin/Config/index#tab=emailConfig');
        }
    }
    /**
     * 执行编辑积分规则
     * 
     * @return string
     */
    public function setRules()
    {

        $data = $this->request->post('config');

        $myconfig = new myModel();
        $obj = $myconfig->find();

        if ($obj->save($data))
        {
            return $this->success('修改成功', 'admin/Config/index#tab=rules');
        }
        else
        {
            return $this->error($obj->getError(), 'admin/Config/index#tab=rules');
        }
    }

}
