<?php

/**
 * config模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Config extends ValidateModel
{

    //验证规则
    public $_rules = [
        'email|邮箱' => 'required|email',
        'domain|域名' => 'required|url',
        'tel' => 'required|number',
        'order_prex' => 'required',
        'smtp_user' => 'required',
        'smtp_pwd' => 'required',
        'smtp_server' => 'required',
        'smtp_port|SMTP端口' => 'required|integer',
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'setConfig' => ['email', 'domain'],
        'setEmailconfig' => [],
        'setRules' => []
    ];
    //设置提示错误信息
    public $_errorMsg = [
        'email.email' => '邮箱出错了'
    ];

}
