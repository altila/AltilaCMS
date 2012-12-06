<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class Page extends Think {
    // 起始行数
    protected $firstRow	;
    // 列表每页显示行数
    protected $listRows	;
    // 页数跳转时要带的参数
    protected $parameter  ;
    // 分页总页面数
    protected $totalPages  ;
    // 总行数
    protected $totalRows  ;
    // 当前页数
    protected $nowPage    ;
    // 分页的栏的总页数
    protected $coolPages   ;
    // 分页栏每页显示的页数
    protected $rollPage   ;
    protected $current;
	// 分页显示定制
    //protected $config  =	array('header'=>'条记录','prev'=>'上一页','next'=>'下一页','first'=>'第一页','last'=>'最后一页','theme'=>' %totalRow% %header% %nowPage%/%totalPage% 页 %upPage% %downPage% %first%  %prePage%  %linkPage%  %nextPage% %end%');

    protected $config  =	array('header'=>'条记录','prev'=>'&nbsp;','next'=>'&nbsp;','first'=>'第一页','last'=>'最后一页','theme'=>'<span class="Lmr10">共有%totalPage%页/%totalRow%%header%</span><span class="links">%upPage% %linkPage% %downPage%</span>%inputPage%');
    //protected $config  =	array('header'=>'条记录','prev'=>'&nbsp;','next'=>'&nbsp;','first'=>'&nbsp;','last'=>'&nbsp;','theme'=>'<span class="Lmr10">共有%totalPage%页/%totalRow%%header%</span><span class="linksf"> %linkPage% </span><span class="Lmr10">到第 <input type="text" class="input1" name="" id=""> 页 </span><span class="Lmr20"><a class="btn_go Lovv" href="#">&nbsp;</a></span>');

    /**
     +----------------------------------------------------------
     * 架构函数
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array $totalRows  总的记录数
     * @param array $listRows  每页显示记录数
     * @param array $parameter  分页跳转的参数
     +----------------------------------------------------------
     */
    public function __construct($totalRows,$listRows,$parameter='') {
        $this->totalRows = $totalRows;
        $this->parameter = $parameter;
        $this->rollPage = C('PAGE_ROLLPAGE');
        $this->listRows = !empty($listRows)?$listRows:C('PAGE_LISTROWS');
        $this->totalPages = ceil($this->totalRows/$this->listRows);     //总页数
        $this->coolPages  = ceil($this->totalPages/$this->rollPage);
        $this->nowPage  = intval($_GET[C('VAR_PAGE')]);
        if(empty($this->nowPage) || $this->nowPage < 1) {
            $this->nowPage = 1;
        }
        if(!empty($this->totalPages) && $this->nowPage>$this->totalPages) {
            $this->nowPage = $this->totalPages;
        }
        $this->firstRow = $this->listRows*($this->nowPage-1);
    }

    public function setConfig($name,$value) {
        if(isset($this->config[$name])) {
            $this->config[$name]    =   $value;
        }
    }

    /**
     +----------------------------------------------------------
     * 分页显示输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function show() {
        if(0 == $this->totalRows) return '';
        $p = C('VAR_PAGE');
        $nowCoolPage      = ceil($this->nowPage/$this->rollPage);
        $url  =  $_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'],'?')?'':"?").'&'.$this->parameter;
        $parse = parse_url($url);
        if(isset($parse['query'])) {
            parse_str($parse['query'],$params);
            unset($params[$p]);
            $url   =  $parse['path'].'?'.http_build_query($params);
        }
        //上下翻页字符串
        $upRow   = $this->nowPage-1;
        $downRow = $this->nowPage+1;
        if ($upRow>0){
            $upPage="<a href='".$url."&".$p."=$upRow' class='prev'>".$this->config['prev']."</a>";
        }else{
            $upPage='<a href="javascript://" class="lockprev">&nbsp;</a>';
        }

        if ($downRow <= $this->totalPages){
            $downPage="<a href='".$url."&".$p."=$downRow' class='next'>".$this->config['next']."</a>";
        }else{
            $downPage='<a href="javascript://" class="next locknext">&nbsp;</a>';
        }
        // << < > >>
        if($nowCoolPage == 1){
            $theFirst = "";
            $prePage = "";
        }else{
            $preRow =  $this->nowPage-$this->rollPage;
            $prePage = "<a href='".$url."&".$p."=$preRow' >上".$this->rollPage."页</a>";
            $theFirst = "<a href='".$url."&".$p."=1' >1 ...</a>";
        }
        if($nowCoolPage == $this->coolPages){
            $nextPage = "";
            $theEnd="";
        }else{
            $nextRow = $this->nowPage+$this->rollPage;
            $theEndRow = $this->totalPages;
            $nextPage = "<a href='".$url."&".$p."=$nextRow' >下".$this->rollPage."页</a>";
            $theEnd = "<a href='".$url."&".$p."=$theEndRow' >... ".$theEndRow."</a>";
        }
        // 1 2 3 4 5
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page=($nowCoolPage-1)*$this->rollPage+$i;
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= "<a href='".$url."&".$p."=$page'>".$page."</a>";
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= "<a class='cstyle' href='".$url."&".$p."=$page'>{$page}</a>";
                }
            }
        }


        //input输入框
        $inputPage='<span class="Ldib"><form action="'.$url.'" method="get" id="pageform">到第 <input type="text" class="input1" name="p" id="p"> 页 <span class="Lmr20"><a class="btn_go Lovv" onclick="document.getElementById(\'pageform\').submit()">&nbsp;</a></span></form></span>';

        $pageStr	 =	 str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%','%inputPage%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd,$inputPage),$this->config['theme']);
            return $pageStr;

    }
   /**
     +----------------------------------------------------------
     * 分页显示输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function searchShow() {
        if(0 == $this->totalRows) return '';
        $p = C('VAR_PAGE');
        $nowCoolPage      = ceil($this->nowPage/$this->rollPage);
        $url  =  $_SERVER['REQUEST_URI'].(strpos($_SERVER['REQUEST_URI'],'?')?'':"?").'&'.$this->parameter;
        $parse = parse_url($url);
        if(isset($parse['query'])) {
            parse_str($parse['query'],$params);
            unset($params[$p]);
            $url   =  $parse['path'].'?'.http_build_query($params);
        }
        //上下翻页字符串
        $upRow   = $this->nowPage-1;
        $downRow = $this->nowPage+1;
        if ($upRow>0){
            $upPage="<a href='".$url."&".$p."=$upRow' class='prev'>".$this->config['prev']."</a>";
        }else{
            $upPage="";
        }

        if ($downRow <= $this->totalPages){
            $downPage="<a href='".$url."&".$p."=$downRow'>".$this->config['next']."</a>";
        }else{
            $downPage="";
        }
        // << < > >>
        if($nowCoolPage == 1){
            $theFirst = "";
            $prePage = "";
        }else{
            $preRow =  $this->nowPage-$this->rollPage;
            $prePage = "<a href='".$url."&".$p."=$preRow' >上".$this->rollPage."页</a>";
            $theFirst = "<a href='".$url."&".$p."=1' >1 ...</a>";
        }
        if($nowCoolPage == $this->coolPages){
            $nextPage = "";
            $theEnd="";
        }else{
            $nextRow = $this->nowPage+$this->rollPage;
            $theEndRow = $this->totalPages;
            $nextPage = "<a href='".$url."&".$p."=$nextRow' >下".$this->rollPage."页</a>";
            $theEnd = "<a href='".$url."&".$p."=$theEndRow' >... ".$theEndRow."</a>";
        }
        // 1 2 3 4 5
        $linkPage = "";
        for($i=1;$i<=$this->rollPage;$i++){
            $page=($nowCoolPage-1)*$this->rollPage+$i;
            if($page!=$this->nowPage){
                if($page<=$this->totalPages){
                    $linkPage .= "<a clas='pageNum' href='".$url."&".$p."=$page'>".$page."</a>";
                }else{
                    break;
                }
            }else{
                if($this->totalPages != 1){
                    $linkPage .= "<a class='cstyle' href='".$url."&".$p."=$page'>{$page}</strong></a>";
                }
            }
        }
        $pageStr	 =	 str_replace(
            array('%header%','%nowPage%','%totalRow%','%totalPage%','%upPage%','%downPage%','%first%','%prePage%','%linkPage%','%nextPage%','%end%'),
            array($this->config['header'],$this->nowPage,$this->totalRows,$this->totalPages,$upPage,$downPage,$theFirst,$prePage,$linkPage,$nextPage,$theEnd),$this->config['theme']);
        return $pageStr;
    }
}
?>
