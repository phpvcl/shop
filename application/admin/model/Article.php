<?php

/**
 * Article模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Article extends ValidateModel
{

    //验证规则
    public $_rules = [
        'title|文章标题' => 'required',
        'content|文章内容' => 'required',
        'article_cat_id|文章分类' => 'required|number',
        'is_hot' => 'default:0',
        'is_top' => 'default:0'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['title', 'content', 'article_cat_id', 'is_hot', 'is_top'],
        'doAdd' => ['title', 'content', 'article_cat_id']
    ];

    public function articleCat()
    {
        return $this->belongsTo('ArticleCat');
    }

}
