<?php

/**
 * Payment模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Payment extends ValidateModel
{

    //验证规则
    public $_rules = [
        'pay_name|支付名称' => 'required',
        'fee|费用' => 'number',
        'checkcode|校验码' => 'required',
        'username|商号' => 'required',
        'password|密钥' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['pay_name', 'fee', 'checkcode', 'username', 'password'],
        'doAdd' => ['pay_name', 'fee', 'checkcode', 'username', 'password']
    ];

}
