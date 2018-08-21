<?php

/**
 * Attr模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Attr extends ValidateModel
{

    //验证规则
    public $_rules = [
        'attr_group_id|属性组' => 'required|number',
        'attr_name|属性名' => 'required',
        'attr_value|属性值' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['attr_group_id', 'attr_name', 'attr_value'],
        'doAdd' => ['attr_group_id', 'attr_name', 'attr_value']
    ];

    public function attrGroup()
    {
        return $this->belongsTo('AttrGroup');
    }

}
