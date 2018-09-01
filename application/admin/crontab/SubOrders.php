<?php

namespace app\admin\crontab;
use think\console\Command;
use think\console\Input;
use think\console\Output;
use think\Db;
class SubOrders extends Command
{
     private $channel = 'orderChannel';
    // 配置定时器的信息
    protected function configure()
    {
       $this->setName('SubOrders')->setDescription('订阅秒杀订单消息');;
    }
    protected function execute(Input $input, Output $output)
    {
        $redis = new \Redis();
        $redis->pconnect('127.0.0.1', 6379, 0);
        $redis->subscribe(array($this->channel), array($this, 'callback'));       
    }

    // 回调函数,这里写处理逻辑
    public function callback($redis, $channelName, $message)
    {
        echo $channelName, "==>", $message, PHP_EOL;
    }    
}