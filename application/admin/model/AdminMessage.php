<?php
/**
 * AdminMessage模型
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\model;
use app\admin\common\ValidateModel;

class AdminMessage extends ValidateModel
{
    //验证规则
    public $_rules = [
        'sender_id' => 'session:admin_id',
        'receiver_id|接收人' => 'required',
        'title|标题' => 'required',
        'message|留言' => 'required',
        'send_time' => 'default:time'
    ];
    //预设场景
    public $_scene = [
        'global' => [],
        'doAdd' => ['sender_id','receiver_id', 'title', 'message', 'send_time']
    ];    
        
    public function authAdmin()
    {
       return $this->belongsTo('AuthAdmin', 'receiver_id');
    }
    public function authAdminSender()
    {
       return $this->belongsTo('AuthAdmin', 'sender_id');
    }    
    
}
