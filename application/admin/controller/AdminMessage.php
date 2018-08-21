<?php
/**
 * 管理员留言管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AdminMessage as myModel;

class AdminMessage extends Purview
{

    protected $isReadedItems = ['0' => '否', '1' => '是'];

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $model = new myModel();
        $sender = ['sender_id', '=', session('admin_id')];
        $receiver = ['receiver_id', '=', session('admin_id')];
        $list = $model->whereOr([$sender, $receiver])->order('id', 'desc')->paginate(10);
        $page = $list->render();
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('is_readedItems', $this->isReadedItems);

        return $this->fetch();
    }

    /**
     * 执行删除
     * 
     * @return string
     */
    public function del()
    {
        $id = input('id/d');

        if ($id > 0)
        {
            $model = myModel::get($id);
            if ($model && $model->delete())
            {
                return $this->success('操作成功', '/admin/AdminMessage/index');
            }
        }
        return $this->error('出错了，记录不存在');
    }

    /**
     * 查看页面
     * 
     * @return string
     */
    public function read()
    {
        $id = input('id/d');

        if ($id > 0)
        {
            $model = new myModel();
            $records = $model->get($id);
            if ($records)
            {
                if ($records->is_readed == 0 && $records->receiver_id == session('admin_id'))
                {
                    $records->where('id', $records->id)->update(['is_readed' => 1]);
                }
                $this->assign('records', $records);
                return $this->fetch();
            }
        }
        return $this->error('出错了，找不到记录');
    }

    /**
     * 新增页面
     * 
     * @return string
     */
    public function add()
    {
        $model = new myModel();
        $this->assign('AuthAdmin', $model->authAdmin()->where('id', '<>', session('admin_id'))->select());

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('AdminMessage');

        $model = new myModel();
        if ($model->save($data))
        {
            return $this->success('操作成功', '/admin/AdminMessage/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/AdminMessage/add');
        }
    }

}
