<?php
namespace app\admin\controller;

use app\common\BaseController;
use service\ArticleService;
use think\Request;

class Article extends BaseController
{
    public function index()
    {
        return view("article/index");
    }

    public function add()
    {
        return view("article/add");
    }

    public function edit($id)
    {
        $data = array();
        $articleService = new ArticleService();
        $data['article'] = $articleService->getArticleById($id);
        return view("article/edit",$data);
    }

    /**
     * 查询文章
     * @param Request $request
     * @return mixed
     */
    public function query(Request $request){
        $queryParam = $this->buildSearchParam($request);
        $articleService = new ArticleService();
        $result = $articleService->queryArticle($queryParam);
        return $this->showPageResult($result);
    }

    /**
     * 保存文章
     * @param Request $request
     * @return mixed
     */
    public function save(Request $request){
        $articleService = new ArticleService();
        $articleService->insertArticle($request->param());
        return $this->showJsonResult(true, '保存成功', null);
    }

    /**
     * 更新文章
     * @param Request $request
     * @return mixed
     */
    public function update(Request $request){
        $articleService = new ArticleService();
        $articleService->updateArticle($request->param());
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 删除文章
     * @param $id
     * @return mixed
     */
    public function delete($id){
        $articleService = new ArticleService();
        $articleService->deleteArticle($id);
        return $this->showJsonResult(true, '删除成功', null);
    }

    /**
     * 更新置顶状态
     * @param $id
     * @param $status
     * @return mixed
     */
    public function updateIsTopStatus($id,$status){
        $articleService = new ArticleService();
        $articleService->updateIsTopStatus($id,$status);
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 更新评论状态
     * @param $id
     * @param $status
     * @return mixed
     */
    public function updateCommentStatus($id,$status){
        $articleService = new ArticleService();
        $articleService->updateCommentStatus($id,$status);
        return $this->showJsonResult(true, '更新成功', null);
    }

    /**
     * 更新可见状态
     * @param $id
     * @param $status
     * @return mixed
     */
    public function updateVisibilityStatus($id,$status){
        $articleService = new ArticleService();
        $articleService->updateVisibilityStatus($id,$status);
        return $this->showJsonResult(true, '更新成功', null);
    }

}
