<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\CatalogService;
use think\Request;

class Catalog extends BaseController
{
    public function index()
    {
        $data = array();
        $catalogService = new CatalogService();
        $data['catalogs'] = $catalogService->getCatalogTree(0);
        return view("catalog/index",$data);
    }

    public function add()
    {
        return view('catalog/add');
    }

    public function edit($id)
    {
        $data = array();
        $catalogService = new CatalogService();
        $catalog = $catalogService->getCatalogById($id);
        $data['catalog'] = $catalog ;
        return view('catalog/edit',$data);
    }

    /**
     * 保存文章分类
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $catalogService = new CatalogService();
        $catalogService->insertCatalog($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 更新文章分类
     * @param Request $request
     * @return mixed
     */
    public function update(Request $request){
        $catalogService = new CatalogService();
        $catalogService->updateCatalog($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 删除文章分类
     * @param $id
     * @return mixed
     */
    public function delete($id){
        $catalogService = new CatalogService();
        $catalogService->deleteCatalog($id);
        return $this->showJsonResult(true, '删除成功', null);
    }

    /**
     * 通过父id查找分类
     * @param $id
     * @return mixed
     */
    public function getByParent($id){
        $catalogService = new CatalogService();
        $result = $catalogService->getCatalogByParent($id);
        return $this->showJsonResult(true, '查询成功', $result);
    }

}
