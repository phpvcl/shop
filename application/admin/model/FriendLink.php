<?php

/**
 * FriendLink模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class FriendLink extends ValidateModel
{

    //验证规则
    public $_rules = [
        'name|链接名称' => 'required',
        'url|链接地址' => 'required|url',
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['name', 'url'],
        'doAdd' => ['name', 'url']
    ];

}
