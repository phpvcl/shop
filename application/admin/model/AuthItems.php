<?php

/**
 * AuthItems模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class AuthItems extends ValidateModel
{

    //验证规则
    public $_rules = [
    ];

    public function authMenu()
    {
        return $this->belongsTo('AuthMenu');
    }

}
