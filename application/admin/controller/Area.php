<?php
/**
 * 地区管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Area as MyModel;
use app\admin\common\Tree;

class Area extends Purview
{
    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {

        return $this->fetch();
    }
    /**
     * 获取树结构json数据
     * 
     * @return string
     */
    public function getTree()
    {
        $model = new MyModel();
        $data = $model->all()->toArray();
        $tree = ['code' => 0, 'msg' => 'ok', 'data' => $data];
        return json($tree);
    }
    /**
     * 执行删除
     * 
     * @return string
     */
    public function del()
    {
        $id = $this->request->param('id/d');
        
        if ($id > 0)
        {
            $model = new MyModel();
            $myModel = $model->get($id);
            if ($model)
            {
                $list = $myModel->getAllByKey();
                $tree = new Tree();
                $children = $tree->getChildrenTree($list, $id);
                $ids = $tree->getChildrenIds($children);
                if ($model->where('id', 'in', $ids)->delete())
                {
                    return $this->success('操作成功', '/admin/Area/index');
                }
            }
        }
        return $this->error('出错了，记录不存在');
    }
    /**
     * 编辑页面
     * 
     * @return string
     */
    public function edit()
    {
        $id = $this->request->param('id/d');

        if ($id > 0)
        {
            $model = new MyModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);
                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Area/index');
    }
    /**
     * 执行编辑
     * 
     * @return string
     */
    public function doEdit()
    {
        $id = $this->request->param('id/d');
        if ($id > 0)
        {
            $data = $this->request->post('Area');

            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Area/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Area/edit/id/' . $id);
                }
            }
        }
        return $this->error('操作失败，记录不存在');
    }
    /**
     * 新增页面
     * 
     * @return string
     */
    public function add()
    {
        $pid = $this->request->param('pid');
        $this->assign('pid', $pid);
        return $this->fetch();
    }
    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Area');

        $model = new MyModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Area/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Area/add');
        }
    }

}
