<?php

/**
 * ArticleCat模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class ArticleCat extends ValidateModel
{

    protected $pk = 'cid';
    //验证规则
    public $_rules = [
        'type_name|分类名' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['type_name'],
        'doAdd' => ['type_name']
    ];

    public function article()
    {
        return $this->hasMany('Article');
    }

}
