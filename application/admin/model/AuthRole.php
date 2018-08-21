<?php

/**
 * AuthRole模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class AuthRole extends ValidateModel
{

    //验证规则
    public $_rules = [
    ];

    public function authItems()
    {
        return $this->belongsToMany('AuthItems', 'AuthRoleItems', 'items_id', 'role_id');
    }
    public function withAuthItems()
    {
        return $this->with('AuthItems');
    }   
}
