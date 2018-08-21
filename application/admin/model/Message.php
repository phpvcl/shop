<?php

/**
 * Message模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\model;

use app\admin\common\ValidateModel;

class Message extends ValidateModel
{

    //验证规则
    public $_rules = [
        'title|标题' => 'required',
        'content|内容' => 'required'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['title', 'content'],
        'doAdd' => ['title', 'content']
    ];

}
