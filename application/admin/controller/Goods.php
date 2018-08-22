<?php

/**
 * 商品管理
 * 
 * @author: honglinzi
 * @version: 1.0
 */

namespace app\admin\controller;

use app\admin\common\Purview;
use app\admin\model\Goods as myModel;
use app\admin\common\Tree;

class Goods extends Purview
{

    protected $isOnSaleItems = ['1' => '是', '0' => '否'];
    protected $isIntegralItems = ['1' => '是', '0' => '否'];

    /**
     * 列表页面
     * 
     * @return string
     */
    public function index()
    {

        $keywords = $this->request->get('keywords');
        $onSale = $this->request->param('onSale/d');
        $isIntegral = $this->request->param('isIntegral/d');
        $model = new myModel();
        // $model = $model->withGoodsCat();
        $query = [];
        if ($keywords)
        {
            $model = $model->where('goods_name', 'like', $keywords . '%');
            $query['keywords'] = $keywords;
        }
        if ($onSale > 0)
        {
            $model = $model->where('is_on_sale', '=', $onSale);
            $query['onSale'] = $onSale;
        }
        if ($isIntegral > 0)
        {
            $model = $model->where('is_integral', '=', $isIntegral);
            $query['isIntegral'] = $isIntegral;
        }
        $list = $model->order('id', 'desc')->paginate(10, false, ['query' => $query]);
        $page = $list->render();
        $this->assign('keywords', $keywords);
        $this->assign('onSale', $onSale);
        $this->assign('isIntegral', $isIntegral);
        $this->assign('list', $list);
        $this->assign('page', $page);
        $this->assign('is_on_saleItems', $this->isOnSaleItems);
        $this->assign('is_integralItems', $this->isIntegralItems);

        return $this->fetch();
    }
    /**
     * 执行批量删除
     * 
     * @return string
     */
    public function batchDel()
    {
        $idArray = $this->request->post('id');

        if (isset($idArray[0]))
        {
            foreach ($idArray as $id)
            {
                $rs = $this->togetherDelete($id);
            }
            if ($rs)
            {
                return $this->success('操作成功', '/admin/Goods/index');
            }
        }
        return $this->error('出错了，记录不存在');
    }

    /**
     * 执行删除
     * 
     * @return string
     */
    public function del()
    {
        $id = $this->request->param('id/d');
        if ($this->togetherDelete($id))
        {
            return $this->success('操作成功', '/admin/Goods/index');
        }
        else
        {
            return $this->error('出错了，记录不存在');
        }
    }
    /**
     * 删除数据记录及图片什么的都一起打包删除
     * 
     * @access private
     * @param integer $id
     * @return bool
     */
    private function togetherDelete($id)
    {
        $model = myModel::get($id);
        if ($model && $model->delete())
        {
            $model = $model->goodsImages()->select();
            if ($model)
            {
                foreach ($model as $imageModel)
                {
                    if ($imageModel->delete())
                    {
                        //删除大图片
                        if ($imageModel->goods_pic)
                        {
                            $pic = '.' . $imageModel->goods_pic;
                            if (file_exists($pic))
                            {
                                unlink($pic);
                            }
                        }
                        //删除缩略图
                        if ($imageModel->goods_thumb_pic)
                        {
                            $pic = '.' . $imageModel->goods_thumb_pic;
                            if (file_exists($pic))
                            {
                                unlink($pic);
                            }
                        }
                    }
                }
            }
            return true;
        }
        return false;
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
                $tree = new Tree();
                $this->assign('records', $records);
                $list = $model->goodsCat()->getAllByKey();
                $this->assign('GoodsCat', $list);
                $this->assign('GoodsCatTree', json_encode($tree->getTree($list, 1)));
                $this->assign('AttrGroup', $model->AttrGroup()->all());
                $this->assign('is_on_saleItems', $this->isOnSaleItems);
                $this->assign('is_integralItems', $this->isIntegralItems);

                return $this->fetch();
            }
        }
        return $this->error('出错了', '/admin/Goods/index');
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
            $data = $this->request->post('Goods');
            $images = $this->request->post('goods_img');
            $imagesDelete = $this->request->post('goods_img_del');
            $newUploadButDel = $this->request->post('new_but_del');

            $model = new myModel();
            $myModel = $model->get($id);
            if ($myModel)
            {
                if ($myModel->save($data))
                {
                    //处理新增图片
                    if (isset($images[0]))
                    {
                        $imagesArray = [];
                        foreach ($images as $image)
                        {
                            $imagesArray[] = ['goods_pic' => $image, 'goods_thumb_pic' => strtr($image, ["." => "_thumb."])];
                        }
                        $myModel->goodsImages()->saveAll($imagesArray);
                    }
                    //执行删除图片
                    if (isset($imagesDelete[0]))
                    {

                        foreach ($imagesDelete as $id)
                        {
                            $info = $myModel->goodsImages()->find($id);
                            if ($info)
                            {
                                $picture = '.' . $info['goods_pic'];
                                $thumb = '.' . $info['goods_thumb_pic'];
                                if ($info->delete())
                                {
                                    if (file_exists($picture))
                                    {
                                        unlink($picture);
                                    }
                                    if (file_exists($thumb))
                                    {
                                        unlink($thumb);
                                    }
                                }
                            }
                        }
                    }
                    //处理新上传但是又删除的列表
                    if (isset($newUploadButDel[0]))
                    {
                        foreach ($newUploadButDel as $pic)
                        {
                            $picture = '.' . $pic;
                            if (file_exists($picture))
                            {
                                unlink($picture);
                            }
                        }
                    }
                    return $this->success('操作成功', '/admin/Goods/index');
                }
                else
                {
                    return $this->error($myModel->getError(), '/admin/Goods/edit/id/' . $id);
                }
            }
        }

        return $this->error('操作失败，记录不存在');
    }

    /**
     * 新增页面
     * 
     * @return string
     */
    public function add()
    {
        $model = new myModel();
        $tree = new Tree();
        $list = $model->goodsCat()->getAllByKey();
        $this->assign('GoodsCatTree', json_encode($tree->getTree($list, 1)));
        $this->assign('AttrGroup', $model->AttrGroup()->all());
        $this->assign('is_on_saleItems', $this->isOnSaleItems);
        $this->assign('is_integralItems', $this->isIntegralItems);

        return $this->fetch();
    }

    /**
     * 执行新增
     * 
     * @return string
     */
    public function doAdd()
    {
        $data = $this->request->post('Goods');
        $images = $this->request->post('goods_img');
        $newUploadButDel = $this->request->post('new_but_del');
        $imagesArray = [];
        $model = new myModel();

        if ($model->save($data))
        {
            if (isset($images[0]))
            {
                foreach ($images as $image)
                {
                    $imagesArray[] = ['goods_pic' => $image, 'goods_thumb_pic' => strtr($image, ["." => "_thumb."])];
                }
                $model->goodsImages()->saveAll($imagesArray);
            }
            //处理新上传但是又删除的列表
            if (isset($newUploadButDel[0]))
            {
                foreach ($newUploadButDel as $pic)
                {
                    $picture = '.' . $pic;
                    if (file_exists($picture))
                    {
                        unlink($picture);
                    }
                }
            }
            return $this->success('操作成功', '/admin/Goods/index');
        }
        else
        {
            return $this->error($model->getError(), '/admin/Goods/add');
        }
    }

}
