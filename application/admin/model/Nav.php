<?php

/**
 * Nav模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Nav extends ValidateModel
{

    //验证规则
    public $_rules = [
        'nav_name|导航名称' => 'required',
        'nav_url|导航地址' => 'required',
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['nav_name', 'nav_url'],
        'doAdd' => ['nav_name', 'nav_url']
    ];

}
