<?php

/**
 * 订单管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Order as myModel;

class Order extends Purview
{

    protected $statusItems = ['1' => '未发货', '2' => '发货中', '3' => '已发货', '4' => '退货'];
    protected $payStatusItems = ['0' => '未付款', '1' => '已付款', '2' => '退款'];
    protected $tradeStatusItems = ['0' => '未完成', '1' => '交易完成', '2' => '交易关闭'];

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        // 查询状态为1的用户数据 并且每页显示10条数据

        $keywords = $this->request->get('keywords');
        $status = $this->request->param('status');
        $model = new myModel();

        $query = [];
        if ($keywords)
        {
            $model = $model->where('order_no', 'like', $keywords . '%');
            $query['keywords'] = $keywords;
        }
        if ($status > 0)
        {
            $model = $model->where([['trade_status', '=', 0],['status', '=', $status]]);
            $query['status'] = $status;
        }
        $list = $model->order('id', 'desc')->paginate(5, false, ['query' => $query]);
        $page = $list->render();
        $this->assign('keywords', $keywords);
        $this->assign('status', $status);
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('statusItems', $this->statusItems);
        $this->assign('pay_statusItems', $this->payStatusItems);
        $this->assign('trade_statusItems', $this->tradeStatusItems);

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
                return $this->success('操作成功', '/admin/Order/index');
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
            $model = new myModel();
            $records = $model->get($id);
            if ($records)
            {
                $this->assign('records', $records);
                $this->assign('trade_statusItems', $this->tradeStatusItems);
                $this->assign('statusItems', $this->statusItems);
                $this->assign('pay_statusItems', $this->payStatusItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Order/index');
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
            $data = $this->request->post('Order');
            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    return $this->success('操作成功', '/admin/Order/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Order/edit/id/' . $id);
                }
            }
        }

        return $this->error('操作失败，记录不存在');
    }

}
