<?php
/**
 * 模型数据验证公共类
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\common;

use think\Model;
use app\admin\common\Validate;

class ValidateModel extends Model
{

    //规则数组，元素形式如： 'email' => 'require|email',
    protected $_rules = [];
    //场景，元素形式如： 'edit' => ['email', 'copyright']
    protected $_scene = [];
    //用户自定义的错误提示
    protected $_customMsg = [];
    protected $error = '无数据更新';
    //活动的场景
    protected $ativeScene = '';


    /**
     * 保存当前数据对象
     * create update save等都调用了save方法，因此拦截save方法进行验证
     * 
     * @access public
     * @param  array  $data     数据
     * @param  array  $where    更新条件
     * @param  string $sequence 自增序列名
     * @return bool
     */
    public function save($data = array(), $where = array(), $sequence = null)
    {
        if (!empty($this->_rules) && !empty($data))
        {
            //合并前面通过属性修改的数据
            $data = array_merge($this->getChangedData(), $data);

            $this->ativeScene = $this->ativeScene ? $this->ativeScene : request()->action(true);
            $validate = new Validate($this);
            $validate->ativeScene = $this->ativeScene;
            $validate->scene = $this->_scene;
            $validate->customMsg = $this->_customMsg;
            $code = $validate->check($data, $this->_rules);

            if(!$code){

                $this->error = $validate->getError();
                return $code;
            }
        }
        
        return parent::save($data, $where, $sequence);
    }

    /**
     * 返回以主键为索引的数组
     *
     * @return array
     */      
    public function getAllByKey()
    {
        $result = [];
        $list = $this->select()->toArray();
        $key = $this->getPk();
        //至少存在包含主键的一条记录
        if (isset($list[0][$key]))
        {
            foreach ($list as $item)
            {
                $result[$item[$key]] = $item;
            }
        }
        return $result;
    }

}
