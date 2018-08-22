<?php

namespace app\admin\controller;
use app\admin\common\Purview;
class demo extends Purview
{

    public function index()
    {
       
        $redis = new \Redis();
        $redis->connect('127.0.0.1', '6379');
     //   $array =  ['test'=>'sdfsdsd', 'name'=> 'hong', 'age'=>34];
       // $redis->mset($array);
    }
    public function shows()
    {
        
        $redis = new \Redis();
        $redis->connect('127.0.0.1', '6379');
      echo  $redis->TTL('admin');
      //  echo $redis->get('admin');
    }
    public function test()
    {
        $test = $this->request->param('test/s');
        echo $test;
    }
    
}
