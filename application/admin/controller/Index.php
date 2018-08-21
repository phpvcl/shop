<?php

/**
 * 后台首页
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\AuthMenu;
use app\admin\model\AdminMessage;
use app\admin\model\Goods;
use app\admin\model\Article;
use app\admin\model\Users;
use app\admin\model\FriendLink;
use app\admin\model\Order;
use app\admin\model\Statistics;

class Index extends Purview
{

    /**
     * 后台首页
     * 
     * @return string
     */
    public function index()
    {

        $model = new AuthMenu();
        $myMenu = $model->withAuthItems()->order('order')->select();
        //超级管理员全部显示
        if ($myMenu && !session('is_super_admin'))
        {
            $allowItems = session('allow_items');
            $path = '';
            foreach ($myMenu as $key => $menu)
            {

                foreach ($menu->authItems as $sonKey => $son)
                {
                    $path = strtolower($son['path']);
                    //判断是否存在允许访问的列表中
                    if (!isset($allowItems[$path]))
                    {
                        unset($myMenu[$key]->authItems[$sonKey]);
                    }
                }
                //子菜单为0，则删除父菜单
                if (count($menu->authItems) < 1)
                {
                    unset($myMenu[$key]);
                }
            }
        }
        //查找是否有管理员留言
        $message = new AdminMessage();
        $myMessage = $message->where('receiver_id', session('admin_id'))->where('is_readed', 0)->find();
        $this->assign('message', $myMessage);
        $this->assign('menu', $myMenu);
        $this->assign('dataid', 1);
        return $this->fetch();
    }
    /**
     * 欢迎页面
     * 
     * @return string
     */
    public function welcome()
    {

        if (!cookie('count'))
        {
            
            cookie('count', [
                'goods' => Goods::count(),
                'article' => Article::count(),
                'users' => Users::count(),
                'order' => Order::count(),
                'income' => Order::where('pay_status', 1)->sum('price'),
                'friendlink' => FriendLink::count()
                    ], 600);
        }
        //营业额
        $turnover = [];
        //会员数
        $users = [];
        //x轴坐标显示日期
        $showDays = [];
        //显示前N天
        $limit = 10;
        //取到N天前的时间戮
        $startTime = strtotime("-$limit days");
        $year = date('Y', $startTime);
        $month = date('m', $startTime);
        $day = date('d', $startTime);
        $model = new Statistics();
        $statistics = $model->where([['year', '>=', $year], ['month', '>=', $month], ['day', '>=', $day]])
                ->limit($limit)
                ->select();
        if ($statistics)
        {
            foreach ($statistics as $data)
            {
                $users[] = $data['users'];
                $turnover[] = $data['turnover'];
                $showDays[] = $data['month'] . '/' . $data['day'];
            }
        }

        $this->assign('users', json_encode($users));
        $this->assign('turnover', json_encode($turnover));
        $this->assign('showDays', json_encode($showDays));
        $this->assign('count', cookie('count'));
        return $this->fetch();
    }
}
