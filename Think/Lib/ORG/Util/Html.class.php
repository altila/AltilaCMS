<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

//  Html地址解析和获取类
class Html extends Think{

    static $siteUrl  =  '';
    static $siteName  =  '';

    // 解析URL规则
    static public function parseRule($rule,$data,$page='1'){
        $rule =  str_replace(
            array('{id}','{name}','{year}','{month}','{day}','{hour}','{page}','{cate}','{channel}','{record_id}','{relation_id}','{map_id}','{module}'),
            array(
            $data['id'],
            $data['name'],
            date('Y',$data['create_time']),
            date('m',$data['create_time']),
            date('d',$data['create_time']),
            date('H',$data['create_time']),
            $page,
            isset($data['cate_id'])?getCateName($data['cate_id']):'',getChannelName($data['pid']),
            $data['record_id'],
            $data['relation_id'],
            $data['map_id'],
            $data['module']
            ),$rule);
        return $rule;
    }

    // 获取文档的URL
    static public function getArticleUrl($model,$id,$page=1,$cateId=0,$mode=0){
        $article   = D('Base')->get($model,$id);
        if(!$article) return '';  //  文章不存在返回空
        if(!empty($article['url_link'])) { // 定义外链则返回外链地址
            return $article['url_link'];
        }
        if($cateId) { // 指定分类 用于分类映射等特殊情况
           $article['cate_id']  =  $cateId; 
           $rule  = C('PAGE_URL_RULE');
        }elseif($article['map_id']) { // 映射文档
           $article['cate_id']   = M('Article')->where('id='.$article['map_id'])->getField('cate_id');
            $rule  = C('PAGE_URL_RULE');
        }elseif($article['record_id']){ // 子记录
           $article['cate_id']   = M('Article')->where('id='.$article['record_id'])->getField('cate_id');
           $rule  = C('RECORD_URL_RULE');
        }else{
            // 获取页面URL规则
            $rule  = C('PAGE_URL_RULE');
        }
        // 分析URL地址
        $name   = self::parseRule($rule,$article,$page);
        return self::getUrl($name,$mode);
    }

    // 获取首页URL
    static public function getIndexUrl($id,$mode=0){
        $rule =  C('HOME_URL_RULE');
        $name   = self::parseRule($rule,$site);
        return self::getUrl($name,$mode);
    }

    // 获取频道首页URL
    static public function getChannelUrl($id,$channel='',$mode=0){
        if(empty($channel)) {
           $channel   = M('Cate')->field('id,url,pid,name,root_id')->find($id);
        }
        if(!$channel) {
            return '';
        }
        if(!empty($channel['url'])) {        // 检查外链
            return $channel['url'];
        }
        $rule =  C('CHANNEL_URL_RULE');
        $name   = self::parseRule($rule,$channel);
        return self::getUrl($name,$mode);
    }

    // 获取频道列表URL
    static public function getChannelListUrl($id,$page=1,$channel='',$preview=false){
        if(empty($channel)) {
           $channel   = M('Cate')->field('id,url,pid,name,root_id')->find($id);
        }
        if(!$channel) {
            return '';
        }
        if(!empty($channel['url'])) {        // 检查外链
            return $channel['url'];
        }
        $rule =  C('CHANNEL_LIST_RULE');
        $name   = self::parseRule($rule,$channel,$page);
        return self::getUrl($name,$mode);
    }

    // 获取分类首页URL
    static public function getCateIndexUrl($id,$cate='',$mode=0){
        if(empty($cate)) {
           $cate   = M('Cate')->field('id,pid,name,url,root_id')->find($id);
        }
        if(!$cate) {
            return '';
        }
        // 检查外链
        if(!empty($cate['url'])) {
            return $cate['url'];
        }
        $rule =  C('CATE_HOME_RULE');//'{pcate}/{name}/index';
        $name   = self::parseRule($rule,$cate);
        return self::getUrl($name,$mode);
    }

    // 获取分类列表页URL
    static public function getCateListUrl($id,$page=1,$cate='',$mode=0){
        if(empty($cate)) {
           $cate   = M('Cate')->field('id,name,pid,url,root_id')->find($id);
        }
        if(!$cate) {
            return '';
        }
        // 检查外链
        if(!empty($cate['url'])) {
            return $cate['url'];
        }
        $rule =  C('CATE_LIST_RULE');
        $name   = self::parseRule($rule,$cate,$page);
        return self::getUrl($name,$mode);
    }
    
    // 获取最终的URL地址
    static public function getUrl($name,$mode=0){
        if($mode==1 || C('PREVIEW_MODE')) { // 预览模式
            return self::$siteUrl.'/preview.php/'.self::$siteName.'/'.$name.C('HTML_FILE_SUFFIX');
        }elseif($mode==2 || C('PUBLISH_MODE')) {// 发布模式
            return './'.self::$siteName.'/'.$name.C('HTML_FILE_SUFFIX');
        }else{ // 正常模式
            return self::$siteUrl.'/'.self::$siteName.'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }
}
?>