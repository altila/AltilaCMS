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

    // 解析URL规则
    static public function parseRule($rule,$data,$page='1'){
        $rule =  str_replace(
            array('{id}','{name}','{year}','{month}','{day}','{hour}','{page}','{cate}','{channel}','{record_id}','{module}'),
            array($data['id'],$data['name'],date('Y',$data['create_time']),date('m',$data['create_time']),date('d',$data['create_time']),date('H',$data['create_time']),$page,isset($data['cate_id'])?getCateName($data['cate_id']):'',getChannelName($data['pid']),$data['record_id'],$data['module']),
            $rule);
        return $rule;
    }

    // 获取文章的URL
    static public function getArticleUrl($id,$page=1,$article='',$site='',$preview=false){

        if(empty($article)) {
           $article   = M('Article')->field('id,cate_id,record_id,module,name,title,url_link,create_time')->find($id);
        }
        if(!$article) {
            return '';
        }
        if(!empty($article['url_link']))
        {
            return $article['url_link'];
        }

        if(empty($site)) {
            $rootId  =  M('Cate')->where('id='.$article['cate_id'])->getField('root_id');
            $site  = M('Cate')->where('id='.$rootId)->field('name,url')->find();
        }
        if($article['map_id']) { // 文档映射
            $map['id']   = $article['map_id'];
            $article   = M('Article')->where($map)->field('id,name,create_time,cate_id,content')->find();
            $article['id'] =  $id;
        }
        $rule  = C('PAGE_URL_RULE');//'{year}{month}/{id}_{page}';
        $rule  = '{cate}/{year}{month}/{id}_{page}';//'{year}{month}/{id}_{page}';

        $name   = self::parseRule($rule,$article,$page);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            //return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
            return 'http://www.'.C('DOMAIN').'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取首页URL
    static public function getIndexUrl($id,$site='',$preview=false){
        if(empty($site)) {
            $site  = M('Cate')->where('level=1 AND id='.(int)$id)->field('name,url')->find();
        }
        if(!$site) {
            return '';
        }
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/index'.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/index'.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取频道页URL
    static public function getChannelUrl($id,$channel='',$site='',$preview=false){
        if(empty($channel)) {
           $channel   = M('Cate')->field('id,url,pid,name,root_id')->find($id);
        }
        if(!$channel) {
            return '';
        }
        // 检查外链
        if(!empty($channel['url'])) {
            return $channel['url'];
        }
        if(empty($site)) {
            $site  = M('Cate')->where('id='.$channel['root_id'])->field('name,url')->find();
        }
        $rule =  C('CHANNEL_URL_RULE');//'{name}/index';
        $name   = self::parseRule($rule,$channel);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取频道列表URL
    static public function getChannelListUrl($id,$page=1,$channel='',$site='',$preview=false){
        if(empty($channel)) {
           $channel   = M('Cate')->field('id,url,pid,name,root_id')->find($id);
        }
        if(!$channel) {
            return '';
        }
        // 检查外链
        if(!empty($channel['url'])) {
            return $channel['url'];
        }
        if(empty($site)) {
            $site  = M('Cate')->where('id='.$channel['root_id'])->field('name,url')->find();
        }
        $rule =  C('CHANNEL_LIST_RULE');
        $name   = self::parseRule($rule,$channel,$page);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取分类首页URL
    static public function getCateIndexUrl($id,$cate='',$site='',$preview=false){
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
        if(empty($site)) {
            $site  = M('Cate')->where('id='.$cate['root_id'])->field('name,url')->find();
        }
        $rule =  C('CATE_HOME_RULE');//'{pcate}/{name}/index';
        $name   = self::parseRule($rule,$cate);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取分类列表页URL
    static public function getCateListUrl($id,$page=1,$cate='',$site='',$preview=false){
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
        if(empty($site)) {
            $site  = M('Cate')->where('id='.$cate['root_id'])->field('name,url')->find();
        }
        $rule =  C('CATE_LIST_RULE');//'{name}/{id}_{page}';
        $name   = self::parseRule($rule,$cate,$page);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取公共页面URL
    static public function getPublicPageUrl($id,$article='',$site='',$preview=false){
        if(empty($article)) {
           $article   = M('Article')->field('id,cate_id,record_id,module,name,title,url_link,create_time')->find($id);
        }
        if(!$article) {
            return '';
        }
        if(!empty($article['url_link'])) {
          if (strpos($article['url_link'],'1jiaju.com')==FALSE)
            {
                 return __APP__.'/Api/linkread/id/'.$article['id'];
            }else{
                return $article['url_link'];
            }
        }
        if(empty($site)) {
            $rootId  =  M('Cate')->where('id='.$article['cate_id'])->getField('root_id');
            $site  = M('Cate')->where('id='.$rootId)->field('name,url')->find();
        }
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/public/'.$article['name'].C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/public/'.$article['name'].C('HTML_FILE_SUFFIX');
        }
    }

    // 获取图片的URL地址
    static public function getPicUrl($id,$article='',$cateId=8,$site='',$preview=false){
        if(empty($article)) {
           $article   = M('Article')->field('id,record_id,module,name,title,url_link,create_time')->find($id);
        }
        if(!$article) {
            return '';
        }
        if(!empty($article['url_link'])) {
          if (strpos($article['url_link'],'1jiaju.com')==FALSE)
            {
                 return __APP__.'/Api/linkread/id/'.$article['id'];
            }else{
                return $article['url_link'];
            }
        }
        $article['cate_id']  =  $cateId; // 图片库
        if(empty($site)) {
            $rootId  =  M('Cate')->where('id='.$article['cate_id'])->getField('root_id');
            $site  = M('Cate')->where('id='.$rootId)->field('name,url')->find();
        }
        $rule  = C('PAGE_URL_RULE');
        $name   = self::parseRule($rule,$article);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取子记录的URL地址
    static public function getRecordUrl($id,$article='',$site='',$preview=false){
        if(empty($article)) {
           $article   = M('Article')->field('id,record_id,module,name,title,url_link,create_time')->find($id);
        }
        if(!$article) {
            return '';
        }
        if(!empty($article['url_link'])) {
          if (strpos($article['url_link'],'1jiaju.com')==FALSE)
            {
                 return __APP__.'/Api/linkread/id/'.$article['id'];
            }else{
                return $article['url_link'];
            }
        }
       // 查询父文档所在的分类
       $article['cate_id']   = M('Article')->where('id='.$article['record_id'])->getField('cate_id');
        if(empty($site)) {
            $rootId  =  M('Cate')->where('id='.$article['cate_id'])->getField('root_id');
            $site  = M('Cate')->where('id='.$rootId)->field('name,url')->find();
        }
        if($article['map_id']) { // 文档映射
            $map['id']   = $article['map_id'];
            $article   = M('Article')->where($map)->field('id,name,create_time,cate_id,content')->find();
            $article['id'] =  $id;
        }
        $rule  = C('RECORD_URL_RULE');//'{year}{month}/{id}_{page}';
        $name   = self::parseRule($rule,$article,$page);
        if($preview || C('PREVIEW_MODE')) {
            return $site['url'].'/preview.php/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }else{
            return $site['url'].'/'.$site['name'].'/'.$name.C('HTML_FILE_SUFFIX');
        }
    }

    // 获取静态URL地址 $type 0 首页 1 频道页 2 栏目列表页 3 内容页 4 栏目首页
    // 已经废除
    static public function getUrl($type,$id,$page=1){
        switch($type) {
            case 0:  return self::getIndexUrl($id);
            case 1:  return self::getChannelUrl($id);
            case 2:  return self::getCateListUrl($id,$page);
            case 3:  return self::getArticleUrl($id,$page);
            case 4:  return self::getCateIndexUrl($id);
            case 5:  return self::getPublicPageUrl($id);
            case 6:  return self::getPicUrl($id);
        }
    }
}
?>