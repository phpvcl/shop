<?php

/**
 * 数据统计管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Statistics as myModel;

class Statistics extends Purview
{

    //限制显示的天数
    private $limit = 60;


    /**
     * 营业额走势图页面
     * 
     * @return string
     */    
    public function turnover()
    {

        $startDate = $this->request->get('startDate');
        $endDate = $this->request->get('endDate');
        if ($startDate && $endDate)
        {
            //显示前N天
            $limit = (strtotime($endDate) - strtotime($startDate)) / (24 * 60 * 60);
            if ($limit > $this->limit)
            {
                return $this->error('对不起，最多只能查询60天内的走势图');
            }
        }
        else
        {
            $limit = 10;
        }


        $showData = [];
        //x轴坐标显示日期
        $showDays = [];
        //取到N天前的时间戮
        $startTime = strtotime("-$limit days");
        $year = date('Y', $startTime);
        $month = date('m', $startTime);
        $day = date('d', $startTime);
        $model = new myModel();
        $statistics = $model->where([['year', '>=', $year], ['month', '>=', $month], ['day', '>=', $day]])
                ->limit($limit)
                ->select();
        if ($statistics)
        {
            foreach ($statistics as $data)
            {
                $showData[] = $data['turnover'];
                $showDays[] = $data['month'] . '/' . $data['day'];
            }
        }
        $this->assign('data', json_encode($showData));
        $this->assign('showDays', json_encode($showDays));

        return $this->fetch();
    }

    /**
     * 用户数走势图页面
     * 
     * @return string
     */     
    public function users()
    {

        $startDate = $this->request->get('startDate');
        $endDate = $this->request->get('endDate');
        if ($startDate && $endDate)
        {
            //显示前N天
            $limit = (strtotime($endDate) - strtotime($startDate)) / (24 * 60 * 60);
            if ($limit > $this->limit)
            {
                return $this->error('对不起，最多只能查询60天内的走势图');
            }
        }
        else
        {
            $limit = 10;
        }


        $showData = [];
        //x轴坐标显示日期
        $showDays = [];
        //取到N天前的时间戮
        $startTime = strtotime("-$limit days");
        $year = date('Y', $startTime);
        $month = date('m', $startTime);
        $day = date('d', $startTime);
        $model = new myModel();
        $statistics = $model->where([['year', '>=', $year], ['month', '>=', $month], ['day', '>=', $day]])
                ->limit($limit)
                ->select();
        if ($statistics)
        {
            foreach ($statistics as $data)
            {
                $showData[] = $data['users'];
                $showDays[] = $data['month'] . '/' . $data['day'];
            }
        }
        $this->assign('data', json_encode($showData));
        $this->assign('showDays', json_encode($showDays));

        return $this->fetch();
    }

    /**
     * 订单数走势图页面
     * 
     * @return string
     */      
    public function order()
    {

        $startDate = $this->request->get('startDate');
        $endDate = $this->request->get('endDate');
        if ($startDate && $endDate)
        {
            //显示前N天
            $limit = (strtotime($endDate) - strtotime($startDate)) / (24 * 60 * 60);
            if ($limit > $this->limit)
            {
                return $this->error('对不起，最多只能查询60天内的走势图');
            }
        }
        else
        {
            $limit = 10;
        }


        $showData = [];
        //x轴坐标显示日期
        $showDays = [];
        //取到N天前的时间戮
        $startTime = strtotime("-$limit days");
        $year = date('Y', $startTime);
        $month = date('m', $startTime);
        $day = date('d', $startTime);
        $model = new myModel();
        $statistics = $model->where([['year', '>=', $year], ['month', '>=', $month], ['day', '>=', $day]])
                ->limit($limit)
                ->select();
        if ($statistics)
        {
            foreach ($statistics as $data)
            {
                $showData[] = $data['order'];
                $showDays[] = $data['month'] . '/' . $data['day'];
            }
        }
        $this->assign('data', json_encode($showData));
        $this->assign('showDays', json_encode($showDays));

        return $this->fetch();
    }

    /**
     * 访客数走势图页面
     * 
     * @return string
     */        
    public function visitor()
    {

        $startDate = $this->request->get('startDate');
        $endDate = $this->request->get('endDate');
        if ($startDate && $endDate)
        {
            //显示前N天
            $limit = (strtotime($endDate) - strtotime($startDate)) / (24 * 60 * 60);
            if ($limit > $this->limit)
            {
                return $this->error('对不起，最多只能查询60天内的走势图');
            }
        }
        else
        {
            $limit = 10;
        }


        $showData = [];
        //x轴坐标显示日期
        $showDays = [];
        //取到N天前的时间戮
        $startTime = strtotime("-$limit days");
        $year = date('Y', $startTime);
        $month = date('m', $startTime);
        $day = date('d', $startTime);
        $model = new myModel();
        $statistics = $model->where([['year', '>=', $year], ['month', '>=', $month], ['day', '>=', $day]])
                ->limit($limit)
                ->select();
        if ($statistics)
        {
            foreach ($statistics as $data)
            {
                $showData[] = $data['visitor'];
                $showDays[] = $data['month'] . '/' . $data['day'];
            }
        }
        $this->assign('data', json_encode($showData));
        $this->assign('showDays', json_encode($showDays));

        return $this->fetch();
    }

    /*
      //手工生成统计数据
      public function inputData()
      {

      $array = [];
      $day = -30;
      for ($i = 0; $i < 300; $i++)
      {
      $day++;
      $thatTime = strtotime("$day days");
      $array[] = [
      'year' => date('Y', $thatTime),
      'month' => date('m', $thatTime),
      'day' => date('d', $thatTime),
      'users' => rand(10, 1000),
      'turnover' => rand(1000, 1000000),
      'order' => rand(10, 10000),
      'visitor' => rand(100, 100000),
      ];
      }
      $model = new myModel();
      $model->saveAll($array);
      }
     */
}
