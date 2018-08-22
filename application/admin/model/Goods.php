<?php

/**
 * Goods模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Goods extends ValidateModel
{

    //验证规则
    public $_rules = [
        'goods_name|商品名称' => 'required',
        'goods_number|库存数量' => 'required|number',
        'shop_price|商城价格' => 'number|>:0',
        'content|商品详情' => 'required',
        'reference_price|参考价格'=> 'number|>:0',
        'is_on_sale' => 'default:0',
        'is_integral' => 'default:0'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['goods_name', 'goods_number', 'shop_price','reference_price', 'content', 'is_on_sale', 'is_integral'],
        'doAdd' => ['goods_name', 'goods_number', 'shop_price','reference_price', 'content']
    ];

    public function attrGroup()
    {
        return $this->belongsTo('AttrGroup');
    }

    public function goodsImages()
    {
        return $this->hasMany('GoodsImages', 'goods_id');
    }

    public function goodsCat()
    {
        return $this->belongsTo('GoodsCat');
    }


}
