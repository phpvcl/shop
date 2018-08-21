<?php

/**
 * AttrGroup模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class AttrGroup extends ValidateModel
{

    //验证规则
    public $_rules = [
        'group_name|分组名' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['group_name'],
        'doAdd' => ['group_name']
    ];

    public function attr()
    {
        return $this->hasMany('Attr');
    }

}
