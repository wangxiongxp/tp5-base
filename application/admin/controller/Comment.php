<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\CommentService;
use think\Request;

class Comment extends BaseController
{
    public function index()
    {
        return view("comment/index");
    }

    /**
     * 查询评论
     * @param Request $request
     * @return mixed
     */
    public function query(Request $request){
        $queryParam = $this->buildSearchParam($request);
        $commentService = new CommentService();
        $result = $commentService->queryComment($queryParam);
        return $this->showPageResult($result);
    }

    /**
     * 新增评论
     */
    public function add(){
        return view('comment/add');
    }

    /**
     * 保存评论
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $commentService = new CommentService();
        $commentService->insertComment($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 查看评论
     * @param $id
     * @return \think\response\View
     */
    public function view($id){
        $data = array();
        $commentService = new CommentService();
        $comment = $commentService->getCommentById($id);
        $data['comment'] = $comment ;
        return view('comment/view',$data);
    }

    /**
     * 编辑评论
     * @param $id
     * @return \think\response\View
     */
    public function edit($id){
        $data = array();
        $commentService = new CommentService();
        $comment = $commentService->getCommentById($id);
        $data['comment'] = $comment ;
        return view('comment/edit',$data);
    }

    /**
     * 更新评论
     * @param Request $request
     * @return mixed
     */
    public function update(Request $request){
        $commentService = new CommentService();
        $commentService->updateComment($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 更新评论状态
     * @param Request $request
     * @return mixed
     */
    public function updateStatus(Request $request){
        $commentService = new CommentService();
        $commentService->updateStatus($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 删除评论
     * @param $id
     * @return mixed
     */
    public function delete($id){
        $commentService = new CommentService();
        $commentService->deleteComment($id);
        return $this->showJsonResult(true, '删除成功', null);
    }

}
