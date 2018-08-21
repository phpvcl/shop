<?php

/**
 * Delivery模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Delivery extends ValidateModel
{

    //验证规则
    public $_rules = [
        'delivery_name|配送名称' => 'required',
        'first_price|首件运费' => 'required|number',
        'other_price|加件运费' => 'required|number'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['delivery_name', 'first_price', 'other_price'],
        'doAdd' => ['delivery_name', 'first_price', 'other_price']
    ];

}
