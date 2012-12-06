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

if(!function_exists('image_type_to_extension'))
{
   function image_type_to_extension($imagetype,$include_dot=true)
   {
       if(empty($imagetype)) return false;
       $dot = $include_dot ? '.' : '';
       switch($imagetype)
       {
           case IMAGETYPE_GIF    : return $dot.'gif';
           case IMAGETYPE_JPEG    : return $dot.'jpg';
           case IMAGETYPE_PNG    : return $dot.'png';
           case IMAGETYPE_SWF    : return $dot.'swf';
           case IMAGETYPE_PSD    : return $dot.'psd';
           case IMAGETYPE_WBMP    : return $dot.'wbmp';
           case IMAGETYPE_XBM    : return $dot.'xbm';
           case IMAGETYPE_TIFF_II : return $dot.'tiff';
           case IMAGETYPE_TIFF_MM : return $dot.'tiff';
           case IMAGETYPE_IFF    : return $dot.'aiff';
           case IMAGETYPE_JB2    : return $dot.'jb2';
           case IMAGETYPE_JPC    : return $dot.'jpc';
           case IMAGETYPE_JP2    : return $dot.'jp2';
           case IMAGETYPE_JPX    : return $dot.'jpf';
           case IMAGETYPE_SWC    : return $dot.'swc';
           default                : return false;
       }
   }
}

/**
 +------------------------------------------------------------------------------
 * 图像操作类库
 +------------------------------------------------------------------------------
 * @category   ORG
 * @package  ORG
 * @subpackage  Util
 * @author    liu21st <liu21st@gmail.com>
 * @version   $Id$
 +------------------------------------------------------------------------------
 */
class Image extends Think
{//类定义开始

    /**
     +----------------------------------------------------------
     * 取得图像信息
     *
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $image 图像文件名
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    static function getImageInfo($img) {
        $imageInfo = getimagesize($img);
        if( $imageInfo!== false) {
            $imageType = strtolower(substr(image_type_to_extension($imageInfo[2]),1));
            $imageSize = filesize($img);
            $info = array(
                "width"=>$imageInfo[0],
                "height"=>$imageInfo[1],
                "type"=>$imageType,
                "size"=>$imageSize,
                "mime"=>$imageInfo['mime']
            );
            return $info;
        }else {
            return false;
        }
    }

    /**
     +----------------------------------------------------------
     * 显示服务器图像文件
     * 支持URL方式
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $imgFile 图像文件名
     * @param string $text 文字字符串
     * @param string $width 图像宽度
     * @param string $height 图像高度
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    static function showImg($imgFile,$text='',$width=80,$height=30) {
        //获取图像文件信息
        $info = Image::getImageInfo($imgFile);
        if($info !== false) {
            $createFun  =   str_replace('/','createfrom',$info['mime']);
            $im = $createFun($imgFile);
            if($im) {
                $ImageFun= str_replace('/','',$info['mime']);
                if(!empty($text)) {
                    $tc  = imagecolorallocate($im, 0, 0, 0);
                    imagestring($im, 3, 5, 5, $text, $tc);
                }
                if($info['type']=='png' || $info['type']=='gif') {
                imagealphablending($im, false);//取消默认的混色模式
                imagesavealpha($im,true);//设定保存完整的 alpha 通道信息
                }
                header("Content-type: ".$info['mime']);
                $ImageFun($im);
                imagedestroy($im);
                return ;
            }
        }
        //获取或者创建图像文件失败则生成空白PNG图片
        $im  = imagecreatetruecolor($width, $height);
        $bgc = imagecolorallocate($im, 255, 255, 255);
        $tc  = imagecolorallocate($im, 0, 0, 0);
        imagefilledrectangle($im, 0, 0, 150, 30, $bgc);
        imagestring($im, 4, 5, 5, "NO PIC", $tc);
        Image::output($im);
        return ;
    }

    /**
     +----------------------------------------------------------
     * 生成缩略图
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $image  原图
     * @param string $type 图像格式
     * @param string $thumbname 缩略图文件名
     * @param string $maxWidth  宽度
     * @param string $maxHeight  高度
     * @param string $position 缩略图保存目录
     * @param boolean $interlace 启用隔行扫描
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    static function thumb($image,$thumbname,$type='',$maxWidth=200,$maxHeight=50,$interlace=true)
    {
        // 获取原图信息
        $info  = Image::getImageInfo($image);
         if($info !== false) {
            $srcWidth  = $info['width'];
            $srcHeight = $info['height'];
            $type = empty($type)?$info['type']:$type;
			$type = strtolower($type);
            $interlace  =  $interlace? 1:0;
            unset($info);
            $scale = min($maxWidth/$srcWidth, $maxHeight/$srcHeight); // 计算缩放比例
            if($scale>=1) {
                // 超过原图大小不再缩略
                $width   =  $srcWidth;
                $height  =  $srcHeight;
            }else{
                // 缩略图尺寸
                $width  = (int)($srcWidth*$scale);
                $height = (int)($srcHeight*$scale);
            }

            // 载入原图
            $createFun = 'ImageCreateFrom'.($type=='jpg'?'jpeg':$type);
            $srcImg     = $createFun($image);

            //创建缩略图
            if($type!='gif' && function_exists('imagecreatetruecolor'))
                $thumbImg = imagecreatetruecolor($width, $height);
            else
                $thumbImg = imagecreate($width, $height);

            // 复制图片
            if(function_exists("ImageCopyResampled"))
                imagecopyresampled($thumbImg, $srcImg, 0, 0, 0, 0, $width, $height, $srcWidth,$srcHeight);
            else
                imagecopyresized($thumbImg, $srcImg, 0, 0, 0, 0, $width, $height,  $srcWidth,$srcHeight);
            if('gif'==$type || 'png'==$type) {
                //imagealphablending($thumbImg, false);//取消默认的混色模式
                //imagesavealpha($thumbImg,true);//设定保存完整的 alpha 通道信息
                $background_color  =  imagecolorallocate($thumbImg,  0,255,0);  //  指派一个绿色
				imagecolortransparent($thumbImg,$background_color);  //  设置为透明色，若注释掉该行则输出绿色的图
            }

            // 对jpeg图形设置隔行扫描
            if('jpg'==$type || 'jpeg'==$type) 	imageinterlace($thumbImg,$interlace);

            //$gray=ImageColorAllocate($thumbImg,255,0,0);
            //ImageString($thumbImg,2,5,5,"TOPThink",$gray);
            // 生成图片
            $imageFun = 'image'.($type=='jpg'?'jpeg':$type);
            $imageFun($thumbImg,$thumbname);
            imagedestroy($thumbImg);
            imagedestroy($srcImg);
            return $thumbname;
         }
         return false;
    }

    /**
     +----------------------------------------------------------
     * 根据给定的字符串生成图像
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $string  字符串
     * @param string $size  图像大小 width,height 或者 array(width,height)
     * @param string $font  字体信息 fontface,fontsize 或者 array(fontface,fontsize)
     * @param string $type 图像格式 默认PNG
     * @param integer $disturb 是否干扰 1 点干扰 2 线干扰 3 复合干扰 0 无干扰
	 * @param bool $border  是否加边框 array(color)
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
	static function buildString($string,$rgb=array(),$filename='',$type='png',$disturb=1,$border=true) {
		if(is_string($size))		$size	=	explode(',',$size);
		$width	=	$size[0];
		$height	=	$size[1];
		if(is_string($font))		$font	=	explode(',',$font);
		$fontface	=	$font[0];
		$fontsize	 	=	$font[1];
		$length		=	strlen($string);
        $width = ($length*9+10)>$width?$length*9+10:$width;
		$height	=	22;
        if ( $type!='gif' && function_exists('imagecreatetruecolor')) {
            $im = @imagecreatetruecolor($width,$height);
        }else {
            $im = @imagecreate($width,$height);
        }
		if(empty($rgb)) {
			$color = imagecolorallocate($im, 102, 104, 104);
		}else{
			$color = imagecolorallocate($im, $rgb[0], $rgb[1], $rgb[2]);
		}
        $backColor = imagecolorallocate($im, 255,255,255);    //背景色（随机）
		$borderColor = imagecolorallocate($im, 100, 100, 100);                    //边框色
        $pointColor = imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));                 //点颜色

        @imagefilledrectangle($im, 0, 0, $width - 1, $height - 1, $backColor);
        @imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor);
        @imagestring($im, 5, 5, 3, $string, $color);
		if(!empty($disturb)) {
			// 添加干扰
			if($disturb=1 || $disturb=3) {
				for($i=0;$i<25;$i++){
					imagesetpixel($im,mt_rand(0,$width),mt_rand(0,$height),$pointColor);
				}
			}elseif($disturb=2 || $disturb=3){
				for($i=0;$i<10;$i++){
					imagearc($im,mt_rand(-10,$width),mt_rand(-10,$height),mt_rand(30,300),mt_rand(20,200),55,44,$pointColor);
				}
			}
		}
        Image::output($im,$type,$filename);
	}

    /**
     +----------------------------------------------------------
     * 生成图像验证码
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $length  位数
     * @param string $mode  类型
     * @param string $type 图像格式
     * @param string $width  宽度
     * @param string $height  高度
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    static function buildImageGroup($length=6,$mode=1,$type='png',$width=48,$height=20,$verifyName='verify')
    {
		import('ORG.Util.String');
        $randval = String::rand_string($length,$mode);
        $_SESSION[$verifyName]= md5(strtolower($randval));
        $width = ($length*10+10)>$width?$length*10+10:$width;
        if ( $type!='gif' && function_exists('imagecreatetruecolor')) {
            $im = @imagecreatetruecolor($width,$height);
        }else {
            $im = @imagecreate($width,$height);
        }
        $r = Array(225,255,255,223);
        $g = Array(225,236,237,255);
        $b = Array(225,236,166,125);
        $key = mt_rand(0,3);

        $backColor = imagecolorallocate($im, $r[$key],$g[$key],$b[$key]);    //背景色（随机）
		$borderColor = imagecolorallocate($im, 100, 100, 100);                    //边框色
        $pointColor = imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));                 //点颜色

        @imagefilledrectangle($im, 0, 0, $width - 1, $height - 1, $backColor);
        @imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor);
        $stringColor = imagecolorallocate($im,mt_rand(0,200),mt_rand(0,120),mt_rand(0,120));
		// 干扰
		for($i=0;$i<10;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagearc($im,mt_rand(-10,$width),mt_rand(-10,$height),mt_rand(30,300),mt_rand(20,200),55,44,$fontcolor);
		}
		for($i=0;$i<25;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagesetpixel($im,mt_rand(0,$width),mt_rand(0,$height),$pointColor);
		}
		for($i=0;$i<$length;$i++) {
			imagestring($im,5,$i*10+5,mt_rand(1,8),$randval{$i}, $stringColor);
		}
        @imagestring($im, 5, 5, 3, $randval, $stringColor);
        Image::output($im,$type);
    }
        static function buildImageVerify($length=4,$mode=1,$type='png',$width=48,$height=22,$verifyName='verify')
    {
		import('ORG.Util.String');
        $randval = String::rand_string($length,$mode);
        $_SESSION[$verifyName]= md5(strtolower($randval));
        $width = ($length*10+10)>$width?$length*10+10:$width;
        if ( $type!='gif' && function_exists('imagecreatetruecolor')) {
            $im = @imagecreatetruecolor($width,$height);
        }else {
            $im = @imagecreate($width,$height);
        }
        $r = Array(225,255,255,223);
        $g = Array(225,236,237,255);
        $b = Array(225,236,166,125);
        $key = mt_rand(0,3);

        $backColor = imagecolorallocate($im, $r[$key],$g[$key],$b[$key]);    //背景色（随机）
		$borderColor = imagecolorallocate($im, 100, 100, 100);                    //边框色
        $pointColor = imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));                 //点颜色

        @imagefilledrectangle($im, 0, 0, $width - 1, $height - 1, $backColor);
        @imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor);
        $stringColor = imagecolorallocate($im,mt_rand(0,200),mt_rand(0,120),mt_rand(0,120));
		// 干扰
		for($i=0;$i<10;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagearc($im,mt_rand(-10,$width),mt_rand(-10,$height),mt_rand(30,300),mt_rand(20,200),55,44,$fontcolor);
		}
		for($i=0;$i<25;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagesetpixel($im,mt_rand(0,$width),mt_rand(0,$height),$pointColor);
		}
		for($i=0;$i<$length;$i++) {
			imagestring($im,5,$i*10+5,mt_rand(1,8),$randval{$i}, $stringColor);
		}
//        @imagestring($im, 5, 5, 3, $randval, $stringColor);
        Image::output($im,$type);
    }
	// 中文验证码
	static function GBVerify($length=4,$type='png',$width=180,$height=50,$fontface='simhei.ttf',$verifyName='verify') {
		import('ORG.Util.String');
        $code = String::rand_string($length,4);
        $width = ($length*45)>$width?$length*45:$width;
		$_SESSION[$verifyName]= md5($code);
		$im=imagecreatetruecolor($width,$height);
		$borderColor = imagecolorallocate($im, 100, 100, 100);                    //边框色
		$bkcolor=imagecolorallocate($im,250,250,250);
		imagefill($im,0,0,$bkcolor);
        @imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor);
		// 干扰
		for($i=0;$i<15;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagearc($im,mt_rand(-10,$width),mt_rand(-10,$height),mt_rand(30,300),mt_rand(20,200),55,44,$fontcolor);
		}
		for($i=0;$i<255;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagesetpixel($im,mt_rand(0,$width),mt_rand(0,$height),$fontcolor);
		}
		if(!is_file($fontface)) {
			$fontface = dirname(__FILE__)."/".$fontface;
		}
		for($i=0;$i<$length;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,120),mt_rand(0,120),mt_rand(0,120)); //这样保证随机出来的颜色较深。
			$codex= msubstr($code,$i,1);
			imagettftext($im,mt_rand(16,20),mt_rand(-60,60),40*$i+20,mt_rand(30,35),$fontcolor,$fontface,$codex);
		}
		Image::output($im,$type);
	}

    /**
     +----------------------------------------------------------
     * 把图像转换成字符显示
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $image  要显示的图像
     * @param string $type  图像类型，默认自动获取
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    static function showASCIIImg($image,$string='',$type='')
    {
        $info  = Image::getImageInfo($image);
        if($info !== false) {
            $type = empty($type)?$info['type']:$type;
            unset($info);
            // 载入原图
            $createFun = 'ImageCreateFrom'.($type=='jpg'?'jpeg':$type);
            $im     = $createFun($image);
            $dx = imagesx($im);
            $dy = imagesy($im);
			$i	=	0;
            $out   =  '<span style="padding:0px;margin:0;line-height:100%;font-size:1px;">';
			set_time_limit(0);
            for($y = 0; $y < $dy; $y++) {
              for($x=0; $x < $dx; $x++) {
                  $col = imagecolorat($im, $x, $y);
                  $rgb = imagecolorsforindex($im,$col);
				  $str	 =	 empty($string)?'*':$string[$i++];
                  $out .= sprintf('<span style="margin:0px;color:#%02x%02x%02x">'.$str.'</span>',$rgb['red'],$rgb['green'],$rgb['blue']);
             }
             $out .= "<br>\n";
            }
            $out .=  '</span>';
            imagedestroy($im);
            return $out;
        }
        return false;
    }

    /**
     +----------------------------------------------------------
     * 生成高级图像验证码
     +----------------------------------------------------------
     * @static
     * @access public
     +----------------------------------------------------------
     * @param string $type 图像格式
     * @param string $width  宽度
     * @param string $height  高度
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    static function showAdvVerify($type='png',$width=180,$height=40,$verifyName='verifyCode')
    {
		$rand	=	range('a','z');
		shuffle($rand);
		$verifyCode	=	array_slice($rand,0,10);
        $letter = implode(" ",$verifyCode);
        $_SESSION[$verifyName] = $verifyCode;
        $im = imagecreate($width,$height);
        $r = array(225,255,255,223);
        $g = array(225,236,237,255);
        $b = array(225,236,166,125);
        $key = mt_rand(0,3);
        $backColor = imagecolorallocate($im, $r[$key],$g[$key],$b[$key]);
		$borderColor = imagecolorallocate($im, 100, 100, 100);                    //边框色
        imagefilledrectangle($im, 0, 0, $width - 1, $height - 1, $backColor);
        imagerectangle($im, 0, 0, $width-1, $height-1, $borderColor);
        $numberColor = imagecolorallocate($im, 255,rand(0,100), rand(0,100));
        $stringColor = imagecolorallocate($im, rand(0,100), rand(0,100), 255);
		// 添加干扰
		/*
		for($i=0;$i<10;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagearc($im,mt_rand(-10,$width),mt_rand(-10,$height),mt_rand(30,300),mt_rand(20,200),55,44,$fontcolor);
		}
		for($i=0;$i<255;$i++){
			$fontcolor=imagecolorallocate($im,mt_rand(0,255),mt_rand(0,255),mt_rand(0,255));
			imagesetpixel($im,mt_rand(0,$width),mt_rand(0,$height),$fontcolor);
		}*/
        imagestring($im, 5, 5, 1, "0 1 2 3 4 5 6 7 8 9", $numberColor);
        imagestring($im, 5, 5, 20, $letter, $stringColor);
        Image::output($im,$type);
    }

    /**
     +----------------------------------------------------------
     * 生成UPC-A条形码
     +----------------------------------------------------------
     * @static
     +----------------------------------------------------------
     * @param string $type 图像格式
     * @param string $type 图像格式
     * @param string $lw  单元宽度
     * @param string $hi   条码高度
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    static function UPCA($code,$type='png',$lw=2,$hi=100) {
        static $Lencode = array('0001101','0011001','0010011','0111101','0100011',
                         '0110001','0101111','0111011','0110111','0001011');
        static $Rencode = array('1110010','1100110','1101100','1000010','1011100',
                         '1001110','1010000','1000100','1001000','1110100');
        $ends = '101';
        $center = '01010';
        /* UPC-A Must be 11 digits, we compute the checksum. */
        if ( strlen($code) != 11 ) { die("UPC-A Must be 11 digits."); }
        /* Compute the EAN-13 Checksum digit */
        $ncode = '0'.$code;
        $even = 0; $odd = 0;
        for ($x=0;$x<12;$x++) {
          if ($x % 2) { $odd += $ncode[$x]; } else { $even += $ncode[$x]; }
        }
        $code.=(10 - (($odd * 3 + $even) % 10)) % 10;
        /* Create the bar encoding using a binary string */
        $bars=$ends;
        $bars.=$Lencode[$code[0]];
        for($x=1;$x<6;$x++) {
          $bars.=$Lencode[$code[$x]];
        }
        $bars.=$center;
        for($x=6;$x<12;$x++) {
          $bars.=$Rencode[$code[$x]];
        }
        $bars.=$ends;
        /* Generate the Barcode Image */
        if ( $type!='gif' && function_exists('imagecreatetruecolor')) {
            $im = imagecreatetruecolor($lw*95+30,$hi+30);
        }else {
            $im = imagecreate($lw*95+30,$hi+30);
        }
        $fg = ImageColorAllocate($im, 0, 0, 0);
        $bg = ImageColorAllocate($im, 255, 255, 255);
        ImageFilledRectangle($im, 0, 0, $lw*95+30, $hi+30, $bg);
        $shift=10;
        for ($x=0;$x<strlen($bars);$x++) {
          if (($x<10) || ($x>=45 && $x<50) || ($x >=85)) { $sh=10; } else { $sh=0; }
          if ($bars[$x] == '1') { $color = $fg; } else { $color = $bg; }
          ImageFilledRectangle($im, ($x*$lw)+15,5,($x+1)*$lw+14,$hi+5+$sh,$color);
        }
        /* Add the Human Readable Label */
        ImageString($im,4,5,$hi-5,$code[0],$fg);
        for ($x=0;$x<5;$x++) {
          ImageString($im,5,$lw*(13+$x*6)+15,$hi+5,$code[$x+1],$fg);
          ImageString($im,5,$lw*(53+$x*6)+15,$hi+5,$code[$x+6],$fg);
        }
        ImageString($im,4,$lw*95+17,$hi-5,$code[11],$fg);
        /* Output the Header and Content. */
        Image::output($im,$type);
    }

    /*
    * 功能：PHP图片水印 (水印支持图片或文字)
    * 参数：
    *     $groundImage   背景图片，即需要加水印的图片，暂只支持GIF,JPG,PNG格式；
    *     $waterPos     水印位置，有10种状态，0为随机位置；
    *                 1为顶端居左，2为顶端居中，3为顶端居右；
    *                 4为中部居左，5为中部居中，6为中部居右；
    *                 7为底端居左，8为底端居中，9为底端居右；
    *     $waterImage     图片水印，即作为水印的图片，暂只支持GIF,JPG,PNG格式；
    *     $waterText     文字水印，即把文字作为为水印，支持ASCII码，不支持中文；
    *     $textFont     文字大小，值为1、2、3、4或5，默认为5；
    *     $textColor     文字颜色，值为十六进制颜色值，默认为#FF0000(红色)；
    *
    * 注意：Support GD 2.0，Support FreeType、GIF Read、GIF Create、JPG 、PNG
    *     $waterImage 和 $waterText 最好不要同时使用，选其中之一即可，优先使用 $waterImage。
    *     当$waterImage有效时，参数$waterString、$stringFont、$stringColor均不生效。
    *     加水印后的图片的文件名和 $groundImage 一样。
    */

    function waterMark($groundImage,$waterPos=0,$waterImage="",$waterText="",$textFont=9,$textColor="#FF0000")
    {
      $isWaterImage = true;
      $formatMsg = "暂不支持该文件格式，请用图片处理软件将图片转换为GIF、JPG、PNG格式。";
      //读取水印文件
      if(!empty($waterImage) && file_exists($waterImage))
      {
       $isWaterImage = TRUE;
       $water_info = getimagesize($waterImage);
       $water_w   = $water_info[0];//取得水印图片的宽
       $water_h   = $water_info[1];//取得水印图片的高
      // echo substr($water_info["mime"],6);
       switch(substr($water_info["mime"],6))//取得水印图片的格式
       {
        case "gif": $water_im = imagecreatefromgif($waterImage);break;
        case "jpeg":$water_im = imagecreatefromjpeg($waterImage);break;
        case "png":$water_im = imagecreatefrompng($waterImage);break;
        default:die($formatMsg);
       }
      }
      //读取背景图片
      if(!empty($groundImage) && file_exists($groundImage))
      {
       $ground_info = getimagesize($groundImage);
       $ground_w   = $ground_info[0];//取得背景图片的宽
       $ground_h   = $ground_info[1];//取得背景图片的高
       //echo substr($ground_info["mime"],6);
       switch(substr($ground_info["mime"],6))//取得背景图片的格式
       {
        case "gif":$ground_im = imagecreatefromgif($groundImage);break;
        case "jpeg":$ground_im = imagecreatefromjpeg($groundImage);break;
        case "png":$ground_im = imagecreatefrompng($groundImage);break;
        default:die($formatMsg);
       }
      }
      else
      {
       die("需要加水印的图片不存在！");
      }
      //水印位置
      if($isWaterImage)//图片水印
      {
       $w = $water_w;
       $h = $water_h;
       $label = "图片的";
      }
      else//文字水印
      {
       $temp = imagettfbbox(ceil($textFont*2),0,"./cour.ttf",$waterText);//取得使用 TrueType 字体的文本的范围
       $w = $temp[2] - $temp[6];
       $h = $temp[3] - $temp[7];
       unset($temp);
       $label = "文字区域";
      }

      if( ($ground_w<$w) || ($ground_h<$h) )
      {
       echo "需要加水印的图片的长度或宽度比水印".$label."还小，无法生成水印！";
       return;
      }

      switch($waterPos)
      {
       case 1://1为顶端居左
       $posX = 0;
       $posY = 0;
       break;
       case 2://2为顶端居中
       $posX = ($ground_w - $w) / 2;
       $posY = 0;
       break;
       case 3://3为顶端居右
       $posX = $ground_w - $w;
       $posY = 0;
       break;
       case 4://4为中部居左
       $posX = 0;
       $posY = ($ground_h - $h) / 2;
       break;
       case 5://5为中部居中
       $posX = ($ground_w - $w) / 2;
       $posY = ($ground_h - $h) / 2;
       break;
       case 6://6为中部居右
       $posX = $ground_w - $w;
       $posY = ($ground_h - $h) / 2;
       break;
       case 7://7为底端居左
       $posX = 0;
       $posY = $ground_h - $h;
       break;
       case 8://8为底端居中
       $posX = ($ground_w - $w) / 2;
       $posY = $ground_h - $h;
       break;
       case 9://9为底端居右
       $posX = $ground_w - $w;
       $posY = $ground_h - $h;
       break;
       case 0://随机
       default://随机
       $posX = rand(0,($ground_w - $w));
       $posY = rand(0,($ground_h - $h));
       break;
      }

      //设定图像的混色模式
      imagealphablending($ground_im, true);

      if($isWaterImage)//图片水印
      {
       imagecopy($ground_im, $water_im, $posX, $posY, 0, 0, $water_w,$water_h);//拷贝水印到目标文件
      }
      else//文字水印
      {
       if( !empty($textColor) && (strlen($textColor)==7) )
       {
        $R = hexdec(substr($textColor,1,2));
        $G = hexdec(substr($textColor,3,2));
        $B = hexdec(substr($textColor,5));
       }
       else
       {
        die("水印文字颜色格式不正确！");
       }
       //imagestring ( $ground_im, $textFont, $posX, $posY, $waterText, imagecolorallocate($ground_im, $R, $G, $B));
       imagestring($ground_im, 12,$posX, $posY, $waterText, imagecolorallocate($ground_im, $R, $G, $B));
      }

      //生成水印后的图片
      @unlink($groundImage);
      switch(substr($ground_info["mime"],6))//取得背景图片的格式
      {
       case "gif":imagegif($ground_im,$groundImage);break;
       case "jpeg":imagejpeg($ground_im,$groundImage);break;
       case "png":imagepng($ground_im,$groundImage);break;
       default:die($errorMsg);
      }
      //释放内存
      if(isset($water_info)) unset($water_info);
      if(isset($water_im)) imagedestroy($water_im);
      unset($ground_info);
      imagedestroy($ground_im);
    }


/**
     +----------------------------------------------------------
     * 为图片添加水印
     +----------------------------------------------------------
     * @static public
     +----------------------------------------------------------
     * @param string $source 原文件名
     * @param string $water  水印图片
     * @param string $$savename  添加水印后的图片名
     * @param string $alpha  水印的透明度
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    static public function water($source,$water,$savename=null,$alpha=80)
    {
        //检查文件是否存在
        if(!file_exists($source)||!file_exists($water))
            return false;
        //图片信息
        $sInfo=self::getImageInfo($source);
        $wInfo=self::getImageInfo($water);
        //如果图片小于水印图片，不生成图片
        if($sInfo["width"]<$wInfo["width"] || $sInfo['height']<$wInfo['height'])
            return false;
        //建立图像
        $sCreateFun="imagecreatefrom".$sInfo['type'];
        $sImage=$sCreateFun($source);
        $wCreateFun="imagecreatefrom".$wInfo['type'];
        $wImage=$wCreateFun($water);
        //设定图像的混色模式
        imagealphablending($wImage, true);
        //图像位置,默认为右下角右对齐
        $posY=$sInfo["height"]-$wInfo["height"];
        $posX=$sInfo["width"]-$wInfo["width"];
        //生成混合图像
         imagecopymerge($sImage, $wImage, $posX, $posY, 0, 0, $wInfo['width'],$wInfo['height'],$alpha);
        //输出图像
        $ImageFun='Image'.$sInfo['type'];
        //如果没有给出保存文件名，默认为原图像名
        if(!$savename){
            $savename=$source;
            @unlink($source);
        }
        //保存图像
        $ImageFun($sImage,$savename);
        imagedestroy($sImage);
    }

    static function output($im,$type='png',$filename='')
    {
        header("Content-type: image/".$type);
        $ImageFun='image'.$type;
		if(empty($filename)) {
	        $ImageFun($im);
		}else{
	        $ImageFun($im,$filename);
		}
        imagedestroy($im);
    }

}//类定义结束
?>