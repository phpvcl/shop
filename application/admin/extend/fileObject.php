<?PHP
/**
 * 文件操作
 * 
 * @author: honglinzi
 * @version: 1.0
 */
namespace app\admin\extend;

class fileObject
{

    /**
     * 建立文件夹
     *
     * @param   string $aimUrl
     * @return  viod
     */
    public function mkDir($aimUrl)
    {

        $aimUrl = str_replace('\\', '/', $aimUrl);
        $aimDir = '';
        $arr = explode('/', $aimUrl);
        foreach ($arr as $str)
        {
            if ($str != "")
            {
                $aimDir .= $str . '/';
                if (!$this->isExists($aimDir))
                {
                    mkdir($aimDir);
                }
            }
        }
    }

    /**
     * 建立文件
     *
     * @param   string $aimUrl
     * @param   boolean    $overWrite 该参数控制是否覆盖原文件
     * @return  boolean
     */
    public function touch($aimUrl, $overWrite = false)
    {

        if ($this->isExists($aimUrl) && $overWrite == false)
        {
            return false;
        }
        elseif ($this->isExists($aimUrl) && $overWrite == true)
        {
            $this->rmFile($aimUrl);
        }
        $aimDir = dirname($aimUrl);
        if (!$this->isExists($aimDir))
        {
            $this->mkDir($aimDir);
        }
        touch($aimUrl);
        return true;
    }

    /**
     * 移动文件(或文件夹)
     *
     * @param string $filePath
     * @param string $aimPath
     * @param boolean $overWrite
     * @return boolean
     */
    public function mv($filePath, $aimPath, $overWrite = false)
    {

        if ($this->isDir($filePath))
        {
            return $this->mvDir($filePath, $aimPath, $overWrite);
        }
        else
        {
            return $this->mvFile($filePath, $aimPath, $overWrite);
        }
    }

    /**
     * 复制文件(或文件夹)
     *
     * @param string $filePath
     * @param string $aimPath
     * @param boolean $overWrite
     * @return boolean
     */
    public function cp($filePath, $aimPath, $overWrite = false)
    {

        if ($this->isDir($filePath))
        {
            return $this->cpDir($filePath, $aimPath, $overWrite);
        }
        else
        {
            return $this->cpFile($filePath, $aimPath, $overWrite);
        }
    }

    /**
     * 删除文件(或文件夹)
     *
     * @param string $filePath
     * @return boolean
     */
    public function rm($filePath)
    {

        if ($this->isDir($filePath))
        {
            return $this->rmDir($filePath);
        }
        else
        {
            return $this->rmFile($filePath);
        }
    }

    /**
     * 判断当前文件是否是一个文件夹
     *
     * @param string $path
     * @return boolean
     */
    public function isDir($path)
    {

        return @is_dir($path);
    }

    /**
     * 判断当前文件是否存在
     *
     * @param string $path
     * @return boolean
     */
    public function isExists($path)
    {

        return @file_exists($path);
    }

    /**
     * 将数据写入(或追加入)文件
     *
     * @param string $file
     * @param string $content
     * @param string $type 0-存在不写 1-覆盖 2-追加
     * @return boolean
     */
    public function write($file, $content, $type = 0)
    {
        if ($type == 0 && $this->isExists($file))
        {
            return false;
        }
        else
        {
            if (!$this->isExists(dirname($file)))
            {
                $this->mkDir(dirname($file));
            }
        }
        $mode = ($type == 1) ? 'wb' : 'ab';

        // 如果无法写入文件，则记录错误
        if (!$fp = @fopen($file, $mode))
        {
            return false;
        }
        @flock($fp, LOCK_EX); // 独占锁定
        $ok = @fwrite($fp, $content); // 写入
        @flock($fp, LOCK_UN); // 解锁
        @fclose($fp); // 关闭
        return $ok;
    }

     /**
     * 读取文件列表信息
     *
     * @param string $filePath 路径
     * @return array
     */   
    public function getFileList($filePath)
    {
        $fileList = [];
        if ($handle = @opendir($filePath))
        {
            while (( $file = readdir($handle) ) !== false)
            {
                if ($file != ".." && $file != ".")
                {
                    $fileList[] = array(
                        "file" => $file,
                        "size" => intval(filesize($filePath . $file) / 1024),
                        "time" => date('Y-m-d H:i:s', filectime($filePath . $file))
                    );
                }
            }
            closedir($handle);
        }
        return $fileList;
    }

    /**
     * 读取文件中的一行数据
     *
     * @param string $file
     * @param string $size
     * @return string
     */
    public function readLine($file, $size = 4096)
    {

        static $fileArr = array();

        if (!$fileArr[$file])
        {
            $fileArr[$file] = @fopen($file, "r");
        }
        $fp = $fileArr[$file];

        if ($fp && !feof($fp))
        {
            return fgets($fp, $size);
        }
        fclose($fp);
        unset($fileArr[$file]);
        return false;
    }

    /**
     * 读取文件中的所有数据
     *
     * @param string $file
     * @param string $size
     * @return string
     */
    public function readAll($file)
    {
        if ($this->isExists($file))
        {
            return file_get_contents($file);
        }
        return false;
    }

    /**
     * 移动文件夹
     *
     * @param   string $oldDir
     * @param   string $aimDir
     * @param   boolean    $overWrite 该参数控制是否覆盖原文件
     * @return  boolean
     */
    private function mvDir($oldDir, $aimDir, $overWrite)
    {

        $aimDir = str_replace('\\', '/', $aimDir);
        $aimDir = substr($aimDir, -1) == '/' ? $aimDir : $aimDir . '/';
        $oldDir = str_replace('\\', '/', $oldDir);
        $oldDir = substr($oldDir, -1) == '/' ? $oldDir : $oldDir . '/';
        if (!is_dir($oldDir))
        {
            return false;
        }
        if (!$this->isExists($aimDir))
        {
            $this->mkDir($aimDir);
        }
        @$dirHandle = opendir($oldDir);
        if (!$dirHandle)
        {
            return false;
        }
        while (false !== ($file = readdir($dirHandle)))
        {
            if ($file == '.' || $file == '..')
            {
                continue;
            }
            if (!is_dir($oldDir . $file))
            {
                $this->mvFile($oldDir . $file, $aimDir . $file, $overWrite);
            }
            else
            {
                $this->mvDir($oldDir . $file, $aimDir . $file, $overWrite);
            }
        }
        closedir($dirHandle);
        return rmdir($oldDir);
    }

    /**
     * 移动文件
     *
     * @param   string $fileUrl
     * @param   string $aimUrl
     * @param   boolean    $overWrite 该参数控制是否覆盖原文件
     * @return  boolean
     */
    private function mvFile($fileUrl, $aimUrl, $overWrite)
    {

        if (!$this->isExists($fileUrl))
        {
            return false;
        }
        if ($this->isExists($aimUrl) && $overWrite = false)
        {
            return false;
        }
        elseif ($this->isExists($aimUrl) && $overWrite = true)
        {
            $this->rmFile($aimUrl);
        }
        $aimDir = dirname($aimUrl);
        $this->mkDir($aimDir);
        rename($fileUrl, $aimUrl);
        return true;
    }

    /**
     * 删除文件夹
     *
     * @param   string $aimDir
     * @return  boolean
     */
    private function rmDir($aimDir)
    {

        $aimDir = str_replace('\\', '/', $aimDir);
        $aimDir = substr($aimDir, -1) == '/' ? $aimDir : $aimDir . '/';
        if (!is_dir($aimDir))
        {
            return false;
        }
        $dirHandle = opendir($aimDir);
        while (false !== ($file = readdir($dirHandle)))
        {
            if ($file == '.' || $file == '..')
            {
                continue;
            }
            if (!is_dir($aimDir . $file))
            {
                $this->rmFile($aimDir . $file);
            }
            else
            {
                $this->rmDir($aimDir . $file);
            }
        }
        closedir($dirHandle);
        return rmdir($aimDir);
    }

    /**
     * 删除文件
     *
     * @param   string $aimUrl
     * @return  boolean
     */
    public function rmFile($aimUrl)
    {

        if ($this->isExists($aimUrl))
        {
            unlink($aimUrl);
            return true;
        }
        else
        {
            return false;
        }
    }


    /**
     * 复制文件夹
     *
     * @param   string $oldDir
     * @param   string $aimDir
     * @param   boolean    $overWrite 该参数控制是否覆盖原文件
     * @return  boolean
     */
    private function cpDir($oldDir, $aimDir, $overWrite)
    {

        $aimDir = str_replace('\\', '/', $aimDir);
        $aimDir = substr($aimDir, -1) == '/' ? $aimDir : $aimDir . '/';
        $oldDir = str_replace('\\', '/', $oldDir);
        $oldDir = substr($oldDir, -1) == '/' ? $oldDir : $oldDir . '/';
        if (!is_dir($oldDir))
        {
            return false;
        }
        if (!$this->isExists($aimDir))
        {
            $this->mkDir($aimDir);
        }
        $dirHandle = opendir($oldDir);
        while (false !== ($file = readdir($dirHandle)))
        {
            if ($file == '.' || $file == '..')
            {
                continue;
            }
            if (!is_dir($oldDir . $file))
            {
                $this->cpFile($oldDir . $file, $aimDir . $file, $overWrite);
            }
            else
            {
                $this->cpDir($oldDir . $file, $aimDir . $file, $overWrite);
            }
        }
        return closedir($dirHandle);
    }

    /**
     * 复制文件
     *
     * @param   string $fileUrl
     * @param   string $aimUrl
     * @param   boolean    $overWrite 该参数控制是否覆盖原文件
     * @return  boolean
     */
    private function cpFile($fileUrl, $aimUrl, $overWrite)
    {

        if (!$this->isExists($fileUrl))
        {
            return false;
        }
        if ($this->isExists($aimUrl) && $overWrite == false)
        {
            return false;
        }
        elseif ($this->isExists($aimUrl) && $overWrite == true)
        {
            $this->rmFile($aimUrl);
        }
        $aimDir = dirname($aimUrl);
        $this->mkDir($aimDir);
        copy($fileUrl, $aimUrl);
        return true;
    }

}
