<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\LogService;
use service\RoleMemberService;
use service\RoleService;
use think\Db;

class Login extends BaseController
{
    /**
     * 控制器初始化
     */
    public function _initialize()
    {
        if (session('user') && $this->request->action() !== 'logout') {
            $this->redirect('@admin');
        }
    }

    /**
     * 用户登录
     * @return string
     */
    public function index()
    {
        if ($this->request->isGet()) {
            return $this->fetch('auth/login', ['title' => '用户登录']);
        }

        // 输入数据效验
        $username = $this->request->post('username', '', 'trim');
        $password = $this->request->post('password', '', 'trim');
        strlen($username) < 4 && $this->error('登录账号长度不能少于4位有效字符!');
        strlen($password) < 4 && $this->error('登录密码长度不能少于4位有效字符!');

        // 用户信息验证
        $user = Db::table('system_user')->where('username', $username)->find();
        empty($user) && $this->error('登录账号不存在，请重新输入!');
        ($user['password'] !== md5($password)) && $this->error('登录密码与账号不匹配，请重新输入!');
        empty($user['status']) && $this->error('账号已经被禁用，请联系管理!');
        // 更新登录信息
        $data = ['login_at' => ['exp', 'now()'], 'login_num' => ['exp', 'login_num+1']];
        Db::table('system_user')->where(['id' => $user['id']])->update($data);
        session('user', $user);

        //将所有当前帐号所有角色写入session
        $roleMemberService = new RoleMemberService();
        $roles = $roleMemberService->getUserRoles($user['id']);
        session('roles', $roles);

        if ($roles && count($roles)>0){
            //当前选中角色写入Session
            session('curRole', $roles[0]);

            //获取当前角色的菜单权限
            $s_role_id = $roles[0]['s_role_id'];
            $roleService = new RoleService();
            $menus = $roleService->GetMenuTreeOfRole(0, $s_role_id);
            if ($menus){
                //当菜单写入Session
                session('menus', $menus);
            }
        }

////        !empty($user['authorize']) && NodeService::applyAuthNode();
        LogService::write('系统管理', '用户登录系统成功');
        $this->success('登录成功，正在进入系统...', '/admin');

    }

    /**
     * 退出登录
     */
    public function logout()
    {
        if (session('user')) {
            LogService::write('系统管理', '用户退出系统成功');
        }
        session('user', null);
        session_destroy();
        $this->success('退出登录成功！', '/admin/login');
    }

}
