<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\RoleMemberService;
use think\Request;

class RoleMember extends BaseController
{
    public function index()
    {
        return view("roleMember/index");
    }

    /**
     * 查询角色成员
     * @param Request $request
     * @return mixed
     */
    public function query(Request $request){
        $queryParam = $this->buildSearchParam($request);
        if(null != $request->param('s_role_id')){
            $queryParam['s_role_id'] = $request->param('s_role_id') ;
        }
        $roleMemberService = new RoleMemberService();
        $result = $roleMemberService->query($queryParam);
        return $this->showPageResult($result);
    }

    /**
     * 新增角色成员
     */
    public function add(){
        return view('roleMember/selectAccount');
    }

    /**
     * 保存角色成员
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $roleMemberService = new RoleMemberService();
        $roleMemberService->insertRoleMember($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 删除角色成员
     * @param $s_role_id
     * @param $user_id
     * @return mixed
     */
    public function delete($s_role_id,$user_id){
        $roleMemberService = new RoleMemberService();
        $roleMemberService->deleteRoleMember($s_role_id, $user_id);
        return $this->showJsonResult(true, '删除成功', null);
    }

}
