<?php

/**
 * Users模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Users extends ValidateModel
{

    //验证规则
    public $_rules = [
        'username|用户名' => 'required|unique',
        'password|密码' => 'required|compare:repassword|md5'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => [],
        'modifyPassword' => ['password'],
        'doAdd' => ['username', 'password']
    ];

}
