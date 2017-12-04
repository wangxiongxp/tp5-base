<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\UserService;
use think\Request;

class User extends BaseController
{
    public function index()
    {
        return view("user/index");
    }

    /**
     * 新增页面
     */
    public function add()
    {
        return view("user/add");
    }

    /**
     * 编辑页面
     * @param $id
     * @return \think\response\View
     */
    public function edit($id)
    {
        $data = array();
        $userService = new UserService();
        $user = $userService->getUserById($id);
        $data['user'] = $user ;
        return view("user/edit",$data);
    }

    /**
     * 查询
     * @param Request $request
     * @return mixed
     */
    public function query(Request $request){
        $queryParam = $this->buildSearchParam($request);
        $userService = new UserService();
        $result = $userService->query($queryParam);
        return $this->showPageResult($result);
    }

    /**
     * 保存
     * @param Request $request
     * @return \think\response\Json
     */
    public function save(Request $request){
        $userService = new UserService();
        $return = $userService->insertUser($request->param());
        if($return){
            return $this->showJsonResult(true, '保存成功', null);
        }else{
            return $this->showJsonResult(false, '保存失败', null);
        }
    }

    /**
     * 更新
     * @param Request $request
     * @return \think\response\Json
     */
    public function update(Request $request){
        $userService = new UserService();
        $return = $userService->updateUser($request->param());
        if($return){
            return $this->showJsonResult(true, '更新成功', null);
        }else{
            return $this->showJsonResult(false, '更新失败', null);
        }
    }

    /**
     * 删除
     * @param $id
     * @return \think\response\Json
     */
    public function delete($id){
        $userService = new UserService();
        $return = $userService->deleteUser($id);
        if($return){
            return $this->showJsonResult(true, '删除成功', null);
        }else{
            return $this->showJsonResult(false, '删除失败', null);
        }
    }

    /**
     * 重置密码页面
     */
    public function showResetPassword(){
        $user = session('user') ;
        return view('user/password',$user);
    }

    /**
     * 重置密码操作
     */
    public function resetPassword(){
        $id = request()->param('id');
        $userService = new UserService();
        $password = md5(request()->param('password')) ;
        $userService->updateUserPassword($id,$password);
        return $this->showJsonResult(true, '更新成功', null);
    }

}
