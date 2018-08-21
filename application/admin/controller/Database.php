<?php

/**
 * 数据库管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\extend\fileObject;
use think\Db;

class Database extends Purview
{

    //备份文件路径
    protected $backupPath = '../database/backup/';
    //限制备份表记录的最大值，防止数据大表崩溃
    protected $limit = 3000;

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {
        $fileObj = new fileObject();
        $list = $fileObj->getFileList($this->backupPath);

        $this->assign('list', $list);

        return $this->fetch();
    }

    /**
     * 数据库查询页面
     * 
     * @return string
     */
    public function query()
    {

        return $this->fetch();
    }

    /**
     * 执行sql语句
     * 
     * @return string
     */
    public function doQuery()
    {

        $sql = $this->request->post('SQL');

        if (preg_match("/^(?:UPDATE|DELETE|TRUNCATE|ALTER|DROP|FLUSH|INSERT|REPLACE|SET|CREATE)\\s+/i", $sql))
        {
            $rs = Db::query($sql);
            if ($rs)
            {
                return $this->success('执行成功');
            }
        }
        else
        {

            return $this->error('执行失败，不被允许的语句');
        }
    }

    /**
     * 删除备份文件
     * 
     * @return string
     */
    public function del()
    {
        $file = $this->request->param('file');

        $filePath = $this->backupPath . $file;
        $fileObj = new fileObject();
        if (!empty($file) && $fileObj->isExists($filePath))
        {
            $rs = $fileObj->rm($filePath);
            if ($rs)
            {
                return $this->success('删除成功了');
            }
            else
            {
                return $this->success('删除失败');
            }
        }
        else
        {
            return $this->error('备份文件不存在');
        }
    }

    /**
     * 备份页面
     * 
     * @return string
     */
    public function backup()
    {

        return $this->fetch();
    }

    /**
     * 执行备份
     * 
     * @return string
     */
    public function doBackup()
    {

        $tableList = Db::query('show tables');
        if ($tableList)
        {

            $mysql = '';
            $error = '';
            foreach ($tableList as $v)
            {
                $thisTable = current($v);

                $table = Db::query("show create table `$thisTable`");
                $mysql .= "DROP TABLE IF EXISTS `" . $thisTable . "`" . ";\r\n";
                $mysql .= $table[0]['Create Table'] . ";\r\n";
                $count = Db::table($thisTable)->count();
                if ($count > $this->limit)
                {
                    $error .= "，但表[$thisTable]超出了最大记录限制数{$this->limit}，该表数据备份不完整";
                }
                $records = Db::query("select * from `$thisTable` limit {$this->limit}");

                if ($records)
                {
                    foreach ($records as $data)
                    {
                        $keys = array_map('addslashes', array_keys($data));
                        $keys = join('`,`', $keys);
                        $keys = "`" . $keys . "`";
                        $vals = array_map('addslashes', array_values($data));
                        $vals = join("','", $vals);
                        $vals = "'" . $vals . "'";
                        $mysql .= "insert into `$thisTable`($keys) values($vals);\r\n";
                    }
                }
                $mysql .= "\r\n";
            }
            $fileObj = new fileObject();
            $backupPath = $this->backupPath . md5(date('YmjHi')) . ".sql";
            if (!$fileObj->write($backupPath, $mysql))
            {
                return $this->error('备份失败，备份文件已存在', '/admin/Database/backup');
            }
            else
            {
                return $this->success('备份成功' . $error, '/admin/Database/backup', '', 10);
            }
        }
        else
        {
            return $this->success('出错了，数据库为空', '/admin/Database/backup');
        }
    }

}
