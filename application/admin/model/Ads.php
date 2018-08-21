<?php
/**
 * Ads模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\model;
use app\admin\common\ValidateModel;

class Ads extends ValidateModel
{

    //验证规则
    public $_rules = [
        'title|广告标题' => 'required',
        'url|广告地址' => 'required|url',
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doEdit' => ['title', 'url'],
        'doAdd' => ['title', 'url']
    ];

}
