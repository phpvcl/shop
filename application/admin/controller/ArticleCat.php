<?php
/**
 * 文章分类管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\ArticleCat as myModel;


class ArticleCat extends Purview
{
    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $list = myModel::paginate(20);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);

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
            $model = myModel::get($id, 'Article');

            //together注意是大小写,因为get里面取到的数组索引被转成小写了
            if ($model && $model->together('article')->delete())
            {
                return $this->success('操作成功');
            }
        }
        return $this->error('出错了,记录不存在');
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
            $model = new myModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);
                return $this->fetch();
            }
        }
        return $this->error('出错了，记录不存在');
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
            $data = $this->request->post('ArticleCat');

            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                $rs = $myModel->save($data);
                if (1 == $rs)
                {
                    return $this->success('操作成功', '/admin/ArticleCat/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/ArticleCat/edit/id/' . $id);
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
        return $this->fetch();
    }
    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('ArticleCat');

        $model = new myModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/ArticleCat/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/ArticleCat/add');
        }
    }

}
