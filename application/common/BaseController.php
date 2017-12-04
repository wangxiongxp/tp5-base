<?php
namespace app\common;

use think\Controller;
use think\Response;

class BaseController extends Controller
{
    function buildSearchParam($request){

        //获取客户端需要那一列排序
        $orderColumn = $request->param["order"][0]["column"] ;
        $orderColumn = $request->param["columns"][$orderColumn]["name"] ;
        //获取排序方式 默认为asc
        $orderDir    = $request->param["order"][0]["dir"];
        //获取查询关键字
        $keyword     = $request->param["keyword"];
        $draw        = $request->param["draw"];

        //每页显示数量
        $length   = $request->param["length"] ? $request->param["length"] : 10;
        //第几条开始
        $start    = $request->param["start"] ? $request->param["start"] : 0;

        $result = array();
        $result['draw']     = $draw ;
        $result['length']   = $length ;
        $result['start']    = $start ;
        $result['keyword']  = $keyword ;
        if(!empty($orderColumn)){
            $result["orderBy"] = $orderColumn . "." . $orderDir ;
        }
        return $result;
    }

    function showPageResult($data){
        return json($data);
    }

    function showJsonResult($code, $msg , $data = array()){
        $result = array();
        $result['code']	= $code ? 1 : 0 ;
        $result['msg']  = $msg ;
        $result['data']	= $data ;
        return json($result) ;
    }

}
