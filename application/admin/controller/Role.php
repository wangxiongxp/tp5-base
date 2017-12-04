<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\RoleService;
use think\Request;

class Role extends BaseController
{

    /**
     * 角色列表
     */
    public function index(){
        return view('role/index');
    }

    /**
     * 查询角色
     * @param Request $request
     * @return mixed
     */
    public function query(Request $request){
        $roleService = new RoleService();
        $queryParam = $this->buildSearchParam($request);
        $result = $roleService->query($queryParam);
        return $this->showPageResult($result);
    }

    /**
     * 新增角色
     */
    public function add(){
        return view('role/add');
    }

    /**
     * 保存角色
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $roleService = new RoleService();
        $roleService->insertRole($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 编辑角色
     * @param $id
     * @return \think\response\View
     */
    public function edit($id){
        $data = array();
        $roleService = new RoleService();
        $role = $roleService->getRoleById($id);
        $data['role'] = $role ;
        return view('role/edit',$data);
    }

    /**
     * 更新角色
     * @param Request $request
     * @return mixed
     */
    public function update(Request $request){
        $roleService = new RoleService();
        $roleService->updateRole($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 删除角色
     * @param $id
     * @return mixed
     */
    public function delete($id){
        $roleService = new RoleService();
        $roleService->deleteRole($id);
        return $this->showJsonResult(true, '删除成功', null);
    }

    /**
     * 查询角色树
     * @return mixed
     */
    public function getRoleTree(){
        $roleService = new RoleService();
        $model = $roleService->getRoleTree();
        return json($model);
    }

    /**
     * 角色菜单
     * @param $id
     * @return \think\response\View
     */
    public function selectMenus($id){
        $data  = array();
        $roleService = new RoleService();
        $menus = $roleService->getCheckedMenus($id,0);
        $data['s_role_id'] = $id ;
        $data['menus'] = $menus ;
        return view('role/selectMenus',$data);
    }

    /**
     * 保存角色菜单
     * @param Request $request
     * @return mixed
     */
    public function saveMenus(Request $request){
        $roleService = new RoleService();
        $roleService->saveMenus($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

}
