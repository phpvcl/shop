<?php

/**
 * 商品分类管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\GoodsCat as MyModel;

class GoodsCat extends Purview
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
            $model = MyModel::get($id, 'Goods');

            if ($model && $model->together('goods')->delete())
            {
                return $this->success('操作成功', '/admin/GoodsCat/index');
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
        return $this->error('出错了', '/admin/GoodsCat/index');
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
            $data = $this->request->post('GoodsCat');

            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/GoodsCat/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/GoodsCat/edit/id/' . $id);
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
        $data = $this->request->post('GoodsCat');

        $model = new MyModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/GoodsCat/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/GoodsCat/add');
        }
    }

}
