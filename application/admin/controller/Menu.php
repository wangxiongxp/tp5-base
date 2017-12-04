<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\MenuService;
use think\Request;

class Menu extends BaseController
{
    public function index()
    {
        $data = array();
        $menuService = new MenuService();
        $data['menus'] = $menuService->GetMenuTree(0);
        return view("menu/index",$data);
    }

    /**
     * 新增菜单
     */
    public function add(){
        return view('menu/add');
    }

    /**
     * 编辑菜单
     * @param $id
     * @return \think\response\View
     */
    public function edit($id){
        $data = array();
        $menuService = new MenuService();
        $menu = $menuService->getMenuById($id);
        $data['menu'] = $menu ;
        return view('menu/edit',$data);
    }

    /**
     * 查询一级菜单
     * @return mixed
     */
    public function getFirstMenu(){
        $menuService = new MenuService();
        $result = $menuService->getFirstMenu();
        return $this->showJsonResult(true, '查询成功', $result);
    }

    /**
     * 保存菜单
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $menuService = new MenuService();
        $menuService->insertMenu($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 更新菜单
     * @param Request $request
     * @return mixed
     */
    public function update(Request $request){
        $menuService = new MenuService();
        $menuService->updateMenu($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 删除菜单
     * @param $id
     * @return mixed
     */
    public function delete($id){
        $menuService = new MenuService();
        $menuService->deleteMenu($id);
        return $this->showJsonResult(true, '删除成功', null);
    }

}
