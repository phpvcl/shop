<?php

/**
 * AuthMenu模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class AuthMenu extends ValidateModel
{

    //验证规则
    public $_rules = [
    ];

    public function authItems()
    {
        return $this->hasMany('AuthItems', 'menu_id');
    }
    public function withAuthItems()
    {
        return $this->with('AuthItems');
    }    

}
