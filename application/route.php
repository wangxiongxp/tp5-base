<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

//后台登录成功页面
Route::group('admin' , function() {

//    Route::get('', 'admin/Index/index');

    Route::any('login', 'admin/Login/index');
    Route::get('logout', 'admin/Login/logout');

    //用户管理
    Route::get('user', 'admin/User/index');
    Route::post('user/query', 'admin/User/query');
    Route::get('user/add', 'admin/User/add');
    Route::post('user/save', 'admin/User/save');
    Route::get('user/edit/:id', 'admin/User/edit');
    Route::post('user/update', 'admin/User/update');
    Route::get('user/delete/:id', 'admin/User/delete');
    Route::get('user/resetPassword/:id', 'admin/User/showResetPassword');
    Route::post('user/resetPassword', 'admin/User/resetPassword');

    //菜单管理
    Route::get('menu', 'admin/Menu/index');
    Route::get('menu/add', 'admin/Menu/add');
    Route::post('menu/save', 'admin/Menu/save');
    Route::get('menu/edit/:id', 'admin/Menu/edit');
    Route::post('menu/update', 'admin/Menu/update');
    Route::get('menu/delete/:id', 'admin/Menu/delete');
    Route::get('menu/getFirstMenu', 'admin/Menu/getFirstMenu');
    Route::get('menu/getMenuTree', 'admin/Menu/getMenuTree');

    //角色管理
    Route::get('role', 'admin/Role/index');
    Route::post('role/query', 'admin/Role/query');
    Route::get('role/add', 'admin/Role/add');
    Route::post('role/save', 'admin/Role/save');
    Route::get('role/edit/:id', 'admin/Role/edit');
    Route::post('role/update', 'admin/Role/update');
    Route::get('role/delete/:id', 'admin/Role/delete');
    Route::get('role/getRoleTree', 'admin/Role/getRoleTree');
    Route::get('role/selectMenus/:id', 'admin/Role/selectMenus');
    Route::post('role/saveMenus', 'admin/Role/saveMenus');

    //角色成员管理
    Route::get('roleMember', 'admin/RoleMember/index');
    Route::post('roleMember/query', 'admin/RoleMember/query');
    Route::get('roleMember/add', 'admin/RoleMember/add');
    Route::post('roleMember/save', 'admin/RoleMember/save');
    Route::get('roleMember/delete/:s_role_id/:user_id', 'admin/RoleMember/delete');

    //内容管理===栏目
    Route::get('catalog', 'admin/Catalog/index');
    Route::get('catalog/add', 'admin/Catalog/add');
    Route::post('catalog/save', 'admin/Catalog/save');
    Route::get('catalog/edit/:id', 'admin/Catalog/edit');
    Route::post('catalog/update', 'admin/Catalog/update');
    Route::get('catalog/delete/:id', 'admin/Catalog/delete');
    Route::get('catalog/getByParent/:id', 'admin/Catalog/getByParent');

    //内容管理===文章
    Route::get('article', 'admin/Article/index');
    Route::post('article/query', 'admin/Article/query');
    Route::get('article/add', 'admin/Article/add');
    Route::post('article/save', 'admin/Article/save');
    Route::get('article/edit/:id', 'admin/Article/edit');
    Route::post('article/update', 'admin/Article/update');
    Route::get('article/delete/:id', 'admin/Article/delete');
    Route::get('article/updateIsTopStatus/:id/:status', 'admin/Article/updateIsTopStatus');
    Route::get('article/updateCommentStatus/:id/:status', 'admin/Article/updateCommentStatus');
    Route::get('article/updateVisibilityStatus/:id/:status', 'admin/Article/updateVisibilityStatus');

    //内容管理===评论
    Route::get('comment', 'admin/Comment/index');
    Route::post('comment/query', 'admin/Comment/query');
    Route::get('comment/delete/:id', 'admin/Comment/delete');
    Route::get('comment/view/:id', 'admin/Comment/view');
    Route::get('comment/edit/:id', 'admin/Comment/edit');
    Route::post('comment/update', 'admin/Comment/update');
    Route::post('comment/updateStatus', 'admin/Comment/updateStatus');

});


