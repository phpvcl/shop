<?php

/**
 * Order模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Order extends ValidateModel
{

    //验证规则
    public $_rules = [
    ];

    public function users()
    {
        return $this->belongsTo('Users');
    }

    public function delivery()
    {
        return $this->belongsTo('Delivery', 'delivery_type');
    }

    public function payment()
    {
        return $this->belongsTo('Payment', 'pay_type');
    }

    public function orderGoods()
    {
        return $this->hasMany('OrderGoods', 'order_no', 'order_no');
    }

}
