<?php

/**
 * GoodsCat模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class GoodsCat extends ValidateModel
{

    //验证规则
    public $_rules = [
        'name|分类名' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['name'],
        'doAdd' => ['name']
    ];

    public function goods()
    {
        return $this->hasMany('Goods');
    }

}
