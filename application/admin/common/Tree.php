<?php
/**
 * 无限分类，树结构处理类
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\common;

class Tree
{
    /**
     * 认祖归宗，对数组父子关系处理
     * @access public
     * @param  array  $items     数组
     * @param  bool $spread 是否展开
     * @return array
     */       
    public function getTree($items, $spread = false)
    {
        $tree = [];
        foreach ($items as $item)
        {
            if (isset($items[$item['pid']]))
            {
                if ($spread)
                {
                    $items[$item['pid']]['spread'] = true;
                }
                $items[$item['pid']]['children'][] = &$items[$item['id']];
            }
            else
            {
                $tree[] = &$items[$item['id']];
            }
        }
        return $tree;
    }
    /**
     * 获取子树
     * @access public
     * @param  array  $items     数组
     * @param  integer $id 
     * @return array
     */    
    public  function getChildrenTree($items, $id)
    {

        foreach ($items as $item)
        {
            if (isset($items[$item['pid']]))
            {
                $items[$item['pid']]['children'][] = &$items[$item['id']];
            }
        }
        $tree = [];
        if (isset($items[$id]))
        {
            $tree = $items[$id];
        }
        return $tree;
    }
    /**
     * 获取子树的id
     * @access public
     * @param  array  $list     数组
     * @return string
     */   
    public  function getChildrenIds($list)
    {
        return substr($this->_getChildrenIds($list), 0, -1);
    }
    /**
     * 获取子树的id
     * @access public
     * @param  array  $list     数组
     * @return string
     */  
    protected function _getChildrenIds($list)
    {
        $ids = '';
        if (isset($list['id']))
        {
            $ids = $list['id'] . ',';
            if (isset($list['children'][0]))
            {
                foreach ($list['children'] as $children)
                {
                    $ids .= $this->_getChildrenIds($children);
                }
            }
        }
        return $ids;
    }

}
