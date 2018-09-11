<?php

/**
 * 权限管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AuthItems as MyModel;

class AuthItems extends Purview
{

    protected $statusItems = ['0' => '禁用', '1' => '开启'];

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
            $model = MyModel::get($id);

            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/AuthItems/index');
            }
        }
        return $this->error('出错了');
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
                $this->assign('AuthMenu', $model->authMenu()->all());
               // $this->assign('statusItems', $this->statusItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/AuthItems/index');
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
            $data = $this->request->post('AuthItems');

            $model = new MyModel();
            $myModel = $model->get($id);
            if ($myModel)
            {

                if ($myModel->save($data))
                {
                    return $this->success('操作成功，非超管要重新登陆才生效', '/admin/AuthItems/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/AuthItems/edit/id/' . $id);
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
        $model = new MyModel();

        $this->assign('pid', $pid);
        $this->assign('AuthMenu', $model->authMenu()->all());
       // $this->assign('statusItems', $this->statusItems);

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('AuthItems');

        $model = new MyModel();
        if ($model->save($data))
        {
            return $this->success('操作成功, 非超管要重新登陆才生效', '/admin/AuthItems/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AuthItems/add');
        }
    }

    /*
      public function inputAction()
      {
      $config = \think\facade\Config::pull('menu_1');

      foreach ($config as $key => $menu)
      {
      $path = '';
      $relationPath = '';
      if (false !== strpos($menu['path'], ','))
      {
      list($path, $relationPath) = explode(',', $menu['path']);
      }
      else
      {
      $path = $menu['path'];
      }

      $item = ['pid' => 0, 'name' => $key, 'path'=> trim($path), 'relation_path'=> trim($relationPath),'status' => 1];
      $model = new MyModel;
      $id = $model->save($item);
      $model->isUpdate(false);
      $items = [];
      if ($id && isset($menu['son']) && is_array($menu['son']))
      {
      foreach ($menu['son'] as $sonKey => $son)
      {
      $path = '';
      $relationPath = '';
      if (false !== strpos($son, ','))
      {
      list($path, $relationPath) = explode(',', $son);
      }
      else
      {
      $path = $son;
      }
      $items[] = ['pid' => $model->id, 'name' => $sonKey, 'path' => trim($path), 'relation_path' => trim($relationPath), 'status' => 1];
      }
      $model->saveAll($items);
      }
      }
      echo '成功了';
      }
     */
}
