<?php

namespace app\admin\controller;

class demo
{
    //消息频道
    private $channel = 'orderChannel';

    public function index()
    {

        $redis = new \Redis();
        $redis->connect('127.0.0.1', '6379');
        $price = 100;
        //$userId = session('user_id');
        $userId = rand(1, 100);

        $goodsId = 111;

        if ($userId && $redis->decr('amount') > -1)
        {
            //构造16位md5字符串
            $orderNo = date('YmdHis') . $userId;
            if ($redis->hMset($orderNo, ['user_id' => $userId, 'goods_id' => $goodsId, 'price' => $price]))
            {
                //加入队列
                $redis->lPush("orders:$goodsId", $orderNo);
                //发布一条消息
                $redis->publish($this->channel, $orderNo);
            }
        }
        else
        {
            echo '出错了';
        }
        exit;
    }
    //支付回调接口
    public function payNotify()
    {
        //回调处理
    }

    public function setAmount()
    {

        $redis = new \Redis();
        $redis->connect('127.0.0.1', '6379');
        $redis->set('amount', 20);
    }

    public function flush()
    {
        $redis = new \Redis();
        $redis->connect('127.0.0.1', '6379');
        $redis->flushDB();
    }

}
