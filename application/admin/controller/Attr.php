<?php
/**
 * 商品属性管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Attr as MyModel;

class Attr extends Purview
{

    protected $valueTypeItems = ['1' => '选项', '2' => '文本'];
    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $model = new MyModel();
        $list = $model->paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('value_typeItems', $this->valueTypeItems);

        return $this->fetch();
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
            $model = MyModel::get($id);

            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/Attr/index');
            }
        }
        return $this->error('出错了', '/admin/Attr/index');
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
                $this->assign('AttrGroup', $model->attrGroup()->all());
                $this->assign('value_typeItems', $this->valueTypeItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Attr/index');
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
            $data = $this->request->post('Attr');

            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Attr/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Attr/edit/id/' . $id);
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
        $model = new MyModel();
        $this->assign('AttrGroup', $model->attrGroup()->all());
        $this->assign('value_typeItems', $this->valueTypeItems);

        return $this->fetch();
    }
    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Attr');

        $model = new MyModel();

        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Attr/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Attr/add');
        }
    }

}
