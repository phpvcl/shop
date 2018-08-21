<?php
/**
 * 数据验证
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\common;

class Validate
{
    //规则数组，元素形式如： ['email' => 'require|email'],
    public $rules = [];
    //要检验的数据
    public $data = [];
    //场景，元素形式如： ['edit' => ['email', 'copyright']]
    public $scene = [];
    //活动的场景
    public $ativeScene = '';
    //用户设置的提示，格式如[[user.required]=>'用户名不能为空']
    public $customMsg = [];
    //回调函数的类对象，该对象决定回调函数写在什么地方
    public $modelObj = null;
    //错误信息
    protected $error = '';
    protected $tempKey = '';
    protected $tempField = '';
    protected $fieldRemark = '';
    //关键字与函数的映射
    protected $keywords = [
        'required' => 'required',
        'compare' => 'compare',
        'unique' => 'unique',
        'regex' => 'regex',
        'email' => 'regex',
        'url' => 'regex',
        'mobie' => 'regex',
        'length' => 'length',
        'max' => 'length',
        'min' => 'length',
        //以什么值开头
        'begin' => 'strPosition',
        'has' => 'strPosition',
        '>' => 'compareValue',
        '>=' => 'compareValue',
        '<' => 'compareValue',
        '<=' => 'compareValue',
        '==' => 'compareValue',
        'in' => 'inArray',
        'integer' => 'is_numeric',
        'boolean' => 'is_boolean',
        'number' => 'is_numeric',
        'string' => 'is_string',
        'array' => 'is_array',
        'float' => 'is_float',
        'date' => 'strtotime',
        'trim' => 'trim',
        'md5' => 'setValue',
        'after' => 'after',
        'before' => 'before',
        'captcha' => 'captcha_check'
    ];
    //错误信息类型
    protected $messageType = [
        '|required|' => '[{attr}]为必填项',
        '|compare|' => '[{attr}]前后二次填写不一致',
        '|unique|' => '已存在值为{value}的[{attr}]',
        '|regex|' => '[{attr}]格式出错了',
        '|has|' => '[{attr}]必须包含{param}',
        '|begin|' => '[{attr}]必须以[{param}]开头',
        '|captcha|' => '验证码出错了',
        '|integer|boolean|number|string|array|float|date|' => '[{attr}]必须是一个{key}类型的值',
        '|email|url|mobile|' => '[{attr}]不是一个有效的{key}',
        '|in|' => '[{attr]}取值范围为：[{param}]',
        '|>|>=|<|<=|=|' => '[{attr}] 取值必须 {key}{param}',
        '|captcha|' => '验证码出错了',
        '|length|max|min|' => '[{attr}]的长度范围{key}{param}',
        '|after|' => '[{attr}]的日期必须在{param}之后',
        '|before|' => '[{attr}]的日期必须在{param}之前'
    ];
    //常用正则
    protected $match = [
        'email' => '#\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*#',
        'url' => '#^(http|https):\/\/[\w]+(\.[\w-]+)+([\S]+)?$#',
        'mobile' => '#1[3-9][0-9]\d{8}#'
    ];

    public function __construct($obj = null)
    {
        $this->modelObj = is_object($obj) ? $obj : $this;
    }

    /**
     * 对字段属性值进行验证
     * @access public
     * @param  array  $data     数据
     * @return bool
     */
    public function check(&$data, $rules)
    {
        $this->data = &$data;
        $this->rules = $rules;
        if ($rules)
        {
            $activeRules = $this->getActiveRules();

            if ($activeRules)
            {
                $rs = 0;
                foreach ($activeRules as $field => $itemRule)
                {
                    //分割取出字段名
                    if (false !== strpos($field, '|'))
                    {
                        list($field, $this->fieldRemark) = explode('|', $field);
                    }
                    else
                    {
                        $this->fieldRemark = $field;
                    }
                    $item = $this->parseItem($itemRule);

                    $rs = $this->checkItem($field, $item);
                    if (!$rs)
                    {
                        return $rs;
                    }
                }
                return $rs;
            }
        }
        return 1;
        // die;
    }

    /**
     * 取活动的规则列表
     * @access public
     * @param  string  $active     活动场景
     * @return array
     */
    protected function getActiveRules()
    {

        $ruleList = $this->ativeScene ? $this->rules : [];
        //如果场景中没有设置全局或指定场景，则将全部规则都返回
        $scenceList = isset($this->scene['global']) ? $this->scene['global'] : [];


        if (isset($this->scene[$this->ativeScene]))
        {
            //合并全局规则，与设定的场景规则
            $scenceList = array_merge($scenceList, $this->scene[$this->ativeScene]);
        }
        //判断必须是数组且至少含有一个元素
        if (isset($scenceList[0]))
        {

            $ruleList = [];
            foreach ($this->rules as $key => $value)
            {
                $keys = explode('|', $key);
                if (isset($keys[0]) && in_array($keys[0], $scenceList))
                {
                    $ruleList[$key] = $value;
                }
            }
        }

        return $ruleList;
    }


    /**
     * 对单条属性值验证
     * @access public
     * @param  string  $field    字段
     * @param  array  $item     字段规则
     * @return bool
     */
    protected function checkItem($field, $item)
    {

        $this->tempField = $field;
        if (isset($this->data[$field]))
        {
            $value = $this->data[$field];
            foreach ($item as $key => $param)
            {
                $rs = ($key == 'default');
                $this->tempKey = $key;

                //对关键字映射表处理
                if (isset($this->keywords[$key]))
                {
                    $function = $this->keywords[$key];

                    if (method_exists($this, $this->keywords[$key]))
                    {
                        $rs = call_user_func([$this, $function], $value, $param);
                    }
                    else
                    {
                        $rs = call_user_func($function, $value);
                    }
                }
                else
                {

                    //非关键字尝试自定义函数
                    if (method_exists($this->modelObj, $key))
                    {
                        $rs = call_user_func([$this->modelObj, $key], $value, $param);
                    }
                }
                if (!$rs)
                {
                    $this->setError($field, $key, $value, $param);
                    return $rs;
                }
            }
            return $rs;
        }//修改默认值
        elseif (isset($item['default']))
        {
            $this->data[$field] = ($item['default'] == 'time') ? time() : $item['default'];
            return 1;
        }
        elseif (isset($item['session']))
        {
            $this->data[$field] = session($item['session']);
            return 1;
        }
        else
        {
            //数据中没有这个字段，不必理他
            return 1;
        }
    }

    /**
     * 返回错误信息
     * 
     * @return bool
     */    
    public function getError()
    {
        return $this->error;
    }
    /**
     * 设置错误信息
     * @access protected
     * @param  string  $field    字段
     * @param  string  $key     关键字
     * @param  string  $value     字段值
     * @param  string  $param     参数
     * @return bool
     */    
    protected function setError($field, $key, $value = '', $param = '')
    {

        if (isset($this->customMsg[$field . '.' . $key]))
        {
            $this->error = $this->customMsg[$field . '.' . $key];
        }
        else
        {
            foreach ($this->messageType as $msgKey => $message)
            {
                if (false !== strpos($msgKey, '|' . $key . '|'))
                {
                    $this->error = str_replace(['{attr}', '{key}', '{value}', '{param}'], [$this->fieldRemark, $key, $value, $param], $message);
                }
            }
            $this->error = $this->error ? $this->error : '未知关键字：' . $key;
        }
    }

    /**
     * 解析字段规则
     * @access protected
     * @param  string  $itemRule    
     * @return array
     */
    protected function parseItem($itemRule)
    {
        $result = [];
        $funcList = [];
        if (is_string($itemRule))
        {
            $funcList = explode('|', $itemRule);
            //至少存在一个元素才能进行下一步
            if (isset($funcList[0]))
            {
                foreach ($funcList as $func)
                {
                    $funParam = '';
                    $funcName = '';
                    if (false !== strpos($func, ':'))
                    {
                        list($funcName, $funParam) = explode(':', $func);
                        $result[trim($funcName)] = trim($funParam);
                    }
                    else
                    {
                        $funcName = trim($func);
                        $result[$funcName] = '';
                    }
                }
            }
        }
        return $result;
    }

    /**
     * 判断字符串的位置
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */       
    protected function strPosition($value, $param)
    {
        $rs = 0;
        if ($param)
        {
            if ($this->tempKey == 'begin')
            {
                $rs = (0 === strpos($value, $param));
            }
            elseif ($this->tempKey == 'has')
            {
                $rs = (false !== strpos($value, $param));
            }
        }
        return $rs;
    }

    /**
     * 判断字符串长度
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */       
    protected function length($value, $param)
    {
        $rs = 0;

        if ($this->tempKey == 'length')
        {
            if (false !== strpos($param, ','))
            {
                //两个参数length:2, 10
                list($start, $end) = explode(',', $param);
                $rs = ( mb_strlen($value) >= intval($start)) && (mb_strlen($value) <= intval($end));
            }
            else
            {
                //只有一个参数 length:10
                $rs = (mb_strlen($value) == intval($param));
            }
        }
        elseif ($this->tempKey == 'max')
        {
            $rs = mb_strlen($value) <= intval($param);
        }
        elseif ($this->tempKey == 'min')
        {
            $rs = mb_strlen($value) >= intval($param);
        }
        return $rs;
    }

    /**
     * 比较值大小
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */      
    protected function compareValue($value, $param)
    {
        $rs = 0;
        switch ($this->tempKey)
        {
            case '>':$rs = ($value > $param);
                break;
            case '>=':$rs = ($value >= $param);
                break;
            case '<': $rs = ($value < $param);
                break;
            case '<=': $rs = ($value <= $param);
                break;
            case '==':$rs = ($value == $param);
        }
        return $rs;
    }

    /**
     * 是否在指定的范围内
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */      
    protected function inArray($value, $param)
    {
        $param = (false != strpos($param, ',')) ? explode(',', $param) : [$param];
        return in_array($value, $param);
    }

    /**
     * 必填项
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */      
    protected function required($value, $param = '')
    {
        return !empty($value) || '0' == $value;
    }

    /**
     * 对比字段
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */    
    protected function compare($value, $param = '')
    {
        $value1 = isset($this->data[$param]) ? $this->data[$param] : '';
        return ($value == $value1) ? 1 : 0;
    }
    /**
     * 正则处理
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */
    protected function regex($value, $param = '')
    {
        if (isset($this->match[$this->tempKey]))
        {
            $param = $this->match[$this->tempKey];
        }
        return preg_match($param, $value);
    }

    /**
     * 验证日期
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */
    protected function after($value, $param)
    {
        return strtotime($value) >= strtotime($param);
    }

    /**
     * 验证日期
     * @access protected
     * @param  mixed     $value  字段值
     * @param  mixed     $param  参数
     * @return bool
     */
    protected function before($value, $param)
    {
        return strtotime($value) <= strtotime($param);
    }

    //设置值
    protected function setValue($value, $param)
    {
        $this->data[$this->tempField] = md5($value);
        return 1;
    }

    /**
     * 验证是否唯一
     * @access public
     * @param  mixed     $value  字段值
     * @param  mixed     $param   参数
     * @return bool
     */
    protected function unique($value, $param)
    {
        $pk = $this->modelObj->getPk();
        if (isset($this->modelObj->$pk))
        {
            $map[] = [$this->modelObj->getPk(), '<>', $this->modelObj->$pk];
        }
        $map[] = [$this->tempField, '=', $value];
        if ($param)
        {
            $fields = explode(',', $param);
            foreach ($fields as $key)
            {
                if (isset($this->data[$key]))
                {
                    $map[] = [$key, '=', $this->data[$key]];
                }
            }
        }
        if ($this->modelObj->where($map)->find())
        {
            return false;
        }

        return true;
    }

}
