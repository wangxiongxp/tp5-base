<?php
namespace app\admin\controller;

use app\common\BaseController;

class Index extends BaseController
{
    public function index()
    {
        return view("index/index");
    }
}
