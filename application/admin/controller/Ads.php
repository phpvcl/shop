<?php
/**
 * 广告管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Ads as myModel;

class Ads extends Purview
{

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $model = new myModel();
        $list = $model->paginate(20);
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
            $model = myModel::get($id);
            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/Ads/index');
            }
        }
        return $this->error('出错了，记录不存在', '/admin/Ads/index');
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
        return $this->error('出错了，记录不存在', '/admin/Ads/index');
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
            $data = $this->request->post('Ads');

            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Ads/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Ads/edit/id/' . $id);
                }
            }
        }
        return $this->error('操作失败, 记录不存在');
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
        $data = $this->request->post('Ads');
        $model = new myModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/Ads/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Ads/add');
        }
    }

}
