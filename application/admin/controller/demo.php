<?php

namespace app\admin\controller;

class demo
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
        $str = 'http://www.gzftx.com/result.php?id=628&did=686';
        $param = '/^http:\/\/[\w]+(\.[\w-]+)+([\w&?=.\/]+)?$/';
        echo preg_match($param, $str);
    }
    
}
