<?php

/**
 * 后台图片上传接口
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use think\Image;

class Api extends Purview
{

    protected $path = './uploads/';
    //图片大小
    protected $limit = 1000 * 1024;
    //允许上传的图片类型
    protected $allowExt = 'jpeg,jpg,png,gif';
    /**
     * 处理普通上传，如文章页的上传
     * 
     * @return string
     */
    public function upload()
    {
        $path = $this->path . 'article/';
        $file = request()->file('file');

        $rs = ['code' => 1, 'msg' => '上传失败', 'data' => ['src' => '']];
        $info = $file->validate(['size' => $this->limit, 'ext' => $this->allowExt])->move($path);
        if ($info)
        {
            $rs['code'] = 0;
            $rs['msg'] = '上传成功';
            $rs['data']['src'] = substr($info->getPathName(), 1);
        }
        else
        {
            $rs['msg'] = $file->getError();
        }
        return json($rs);
    }
    /**
     * 处理编辑器的上传
     * 
     * @return string
     */
    public function editor()
    {
        $path = $this->path . 'other/';
        $file = request()->file('file');

        $rs = ['code' => 1, 'msg' => '上传失败', 'data' => ['src' => '']];
        $info = $file->validate(['size' => $this->limit, 'ext' => $this->allowExt])->move($path);
        if ($info)
        {
            $rs['code'] = 0;
            $rs['msg'] = '上传成功';
            $rs['data']['src'] = substr($info->getPathName(), 1);
        }
        else
        {
            $rs['msg'] = $file->getError();
        }
        return json($rs);
    }
    /**
     * 处理多文件的上传并生成缩略图，如商城页的上传
     * 
     * @return string
     */
    public function multiUpload()
    {

        $path = $this->path . 'goods/';
        $file = request()->file('file');

        $rs = ['code' => 1, 'msg' => '上传失败', 'data' => ['src' => '']];
        $info = $file->validate(['size' => $this->limit, 'ext' => $this->allowExt])->move($path);
        if ($info)
        {
            $thumbPath = preg_replace('/\.([a-zA-Z]+)/i', '_thumb.\\1', $info->getPathName());
            $image = Image::open($info->getPathName());
            if ($image)
            {
                //生成缩略图
                $image->thumb(150, 150)->save($thumbPath);
            }
            $rs['code'] = 0;
            $rs['msg'] = '上传成功';
            $rs['data']['src'] = substr($info->getPathName(), 1);
            $rs['data']['thumb_src'] = substr($thumbPath, 1);
        }
        else
        {
            $rs['msg'] = $file->getError();
        }
        return json($rs);
    }

}
