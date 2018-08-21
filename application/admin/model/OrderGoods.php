<?php

/**
 * OrderGoods模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class OrderGoods extends ValidateModel
{

    //验证规则
    public $_rules = [
    ];

    public function goods()
    {
        return $this->belongsTo('Goods', 'goods_id');
    }

    public function goodsImages()
    {
        return $this->belongsTo('GoodsImages', 'goods_id', 'goods_id');
    }

}
