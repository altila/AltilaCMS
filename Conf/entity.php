<?php  

  
  function get_db_by_model($modelname){
    
   $bg_model_list=array( 
   
       'malldb'=>array(
			  'admin.Api'=>array('table_prefix'=>'think','tables'=>''),
			  'admin.Article'=>array(),
			  'admin.Attribute'=>array(),
			  'admin.Auth'=>array(),
			  'admin.Blog'=>array(),
			  'admin.Cart'=>array(),
			  'admin.Cate'=>array(),
			  'admin.Channel'=>array(),
			  'admin.Comment'=>array(),
			  'admin.Common'=>array(),
			  'admin.Config'=>array(),
			  'admin.Cron'=>array(),
			  'admin.Fitment'=>array(),
			  'admin.Group'=>array(),
			  'admin.Link'=>array(),
			  'admin.Login'=>array(),
			  'admin.Member'=>array(),
			  'admin.Model'=>array(),
			  'admin.Node'=>array(),
			  'admin.PlateContent'=>array(),
			  'admin.Plate'=>array(),
			  'admin.Question'=>array(),
			  'admin.Role'=>array(),
			  'admin.SiteCategory'=>array(),
			  'admin.SiteColumn'=>array(),
			  'admin.Site'=>array(),
			  'admin.Url'=>array(),
			  'admin.User'=>array(),
			  'admin.Vote'=>array(),
			  'home.Ad'=>array(),
			  'home.Goods'=>array(),
			  'home.Site'=>array(),
			  'home.System'=>array(),
			  'home.Collocation'=>array(),
			  'home.Category'=>array(),
			  'home.Cate'=>array(),
			  'home.Promotion'=>array(),
			  'home.Search'=>array(),
			  'home.Theme'=>array(),
			  'home.PlateContent'=>array(),
			  'home.ProductLibCategory'=>array(),
			  'home.New'=>array(),
			  'home.MallComment'=>array(), 
	   ),
   
        'userdb'=>array(
			'home.Message'=>array(),
			'home.Member'=>array(),
			'home.CompanyStaff'=>array(),
			'home.Friend'=>array(),
			'home.User'=>array(),
			'home.Sms'=>array(),
			'home.Task'=> array(),
		),
		'carddb'=>array(
		    'home.Card'=>array(),
		) ,
		'orderdb'=>array(
		    'home.Order'=>array(),
		),
   ) ; 
      $result=array();
       foreach ($bg_model_list as $key=>$dbobj){
       	$dbobj=$key;
	       	 foreach ($dbobj as $n_node=>$model){
	       	 	if($n_node==$modelname){
		       	 	    $result['db']		   =$dbobj;
		       	 	    $result['table_prefix']=$model['table_prefix'];
		       	 	    $result['tables']=$model['tables'];
	       	 	     break;      
	       	 	} 
	       	 }
       	 if(!empty($result)) break;
       	  
       }
       if(empty($result))  $result=array('db'=>'malldb','table_prefix'=>'','tables'=>''); 
       return $result;    
  }
  
  function get_db($db_id,$all=false){
   $bg_db_list=array( 
		'malldb'=>array(
			'DB_TYPE'=>"pdo" ,
			'DB_HOST'=>"192.168.149.52,192.168.149.54",
			'DB_PORT'=>"3306",
			'DB_USER'=>"admin",
			'DB_PWD'=>"admin" ,
			'DB_NAME'=>"bgmalldb" ,
			'DB_CHARSET'=>"utf8",
			'DB_PREFIX'=>"think_" ,
			'DB_SUFFIX'=>"" ,
			'DB_FIELDTYPE_CHECK'=>"false",
			'DB_FIELDS_CACHE'=>"true",
			'DB_DEPLOY_TYPE'=>1,
			'DB_RW_SEPARAT'=>"true" ,			
			'DB_RW_TABLE'=>"",
			'DB_DETAULT'=>1
			) ,
		'userdb'=>array(
			'DB_TYPE'=>"pdo" ,
			'DB_HOST'=>"192.168.149.52,192.168.149.54",
			'DB_PORT'=>"3306",
			'DB_USER'=>"admin",
			'DB_PWD'=>"admin" ,
			'DB_NAME'=>"bguserdb" ,
			'DB_CHARSET'=>"utf8",
			'DB_PREFIX'=>"think_" ,
			'DB_SUFFIX'=>"" ,
			'DB_FIELDTYPE_CHECK'=>"false",
			'DB_FIELDS_CACHE'=>"true",
			 'DB_DEPLOY_TYPE'=>1,
			'DB_RW_SEPARAT'=>"true" ,
			'DB_RW_TABLE'=>"",
			) , 
		 'carddb'=>array(
			'DB_TYPE'=>"pdo" ,
			'DB_HOST'=>"192.168.149.52,192.168.149.54",
			'DB_PORT'=>"3306",
			'DB_USER'=>"admin",
			'DB_PWD'=>"admin" ,
			'DB_NAME'=>"bgcarddb" ,
			'DB_CHARSET'=>"utf8",
			'DB_PREFIX'=>"think_" ,
			'DB_SUFFIX'=>"" ,
			'DB_FIELDTYPE_CHECK'=>"false",
			'DB_FIELDS_CACHE'=>"true",
			 'DB_DEPLOY_TYPE'=>1,
			'DB_RW_SEPARAT'=>"true" ,
			'DB_RW_TABLE'=>"",
			) ,
			
		 'orderdb'=>array(
			'DB_TYPE'=>"pdo" ,
			'DB_HOST'=>"192.168.149.52,192.168.149.54",
			'DB_PORT'=>"3306",
			'DB_USER'=>"admin",
			'DB_PWD'=>"admin" ,
			'DB_NAME'=>"openshop_v2" ,
			'DB_CHARSET'=>"utf8",
			'DB_PREFIX'=>"think_" ,
			'DB_SUFFIX'=>"" ,
			'DB_FIELDTYPE_CHECK'=>"false",
			'DB_FIELDS_CACHE'=>"true",
			 'DB_DEPLOY_TYPE'=>1,
			'DB_RW_SEPARAT'=>"true" ,
			'DB_RW_TABLE'=>"",
			)  
	
	) ; 
     
    if($all===false){
  	return ($bg_db_list[$db_id])?$bg_db_list[$db_id]:$bg_db_list['malldb']; 
    }else{
     return $bg_db_list;
    }
  }
   
?>