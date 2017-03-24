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

//http://www.cnblogs.com/litturtle/p/3889906.html
//http://blog.csdn.net/ugg/article/details/3953137
//http://blog.csdn.net/Vast_Sea/article/category/1282668/1
//http://www.cnblogs.com/carekee/articles/3643394.html
//http://www.poboke.com/study/php-identification-code-and-submission.html
//http://blog.csdn.net/ugg/article/details/3972368
//http://zzk.cnblogs.com/s?w=%E9%AA%8C%E8%AF%81%E7%A0%81+php+%E8%AF%86%E5%88%AB&t=b
//http://www.cnblogs.com/shiddong/p/4063620.html
//http://bbs.phpchina.com/forum.php?mod=viewthread&tid=213896
//http://drops.wooyun.org/tips/141
//水平投影、腐蚀

class DiscernVerifyAction extends Action {

	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function _initialize() {
		//设置页面编码
		header("Content-type: text/html; charset=utf-8");
	}
	
	/**
	+----------------------------------------------------------
	* 识别验证码
	* www.altila.com/Api/DiscernVerify
	+----------------------------------------------------------
	*/
	public function index() {
		//set_time_limit(0);
		//$Image = 'http://www.altila.com/Public/verify';
		$Image = 'http://127.0.0.1/discernVerify/20150614/20150614191333.png';
		//$Image = 'https://test.alltobid.com/imgs/l/ce73d6c5-098b-49bb-8c48-38e71e0df3bc.jpg';
		$this->ImagePath = $Image;
		$this->ImageSize = getimagesize($Image);
		$this->getInfo();
		//$this->printByGray();
		//$result = $this->printByGray($Image);
		/**/$yuanshi = $this->getErzhi();
		$yijijiangzao = $this->reduceZao($yuanshi);
		$yijijiangzao = $this->removalBorder($yijijiangzao);
		$yijijiangzao = $this->getJinsuo($yijijiangzao);
		$this->printArray($yijijiangzao);
		$small = $this->cutSmall($yijijiangzao);
		foreach( $small as $key=>$val ) {
			echo "单字符{$key}<br>";
			//$this->printArray($val);
			//$val = $this->singleSlopeAdjust($val);
			$this->printArray($val);
		}
		//$result = $this->run($Image);
		print_r($small);
	}

	/*
	 * 获取图像标识符，保存到ImageInfo，只能处理bmp,png,jpg图片
	 * ImageCreateFromBmp是我自己定义的函数，最后会给出
	 */
	public function getInfo(){
		$imageSize = $this->ImageSize;
		$filetype = substr($imageSize['mime'],-3);
		if($filetype == 'bmp'){
			$this->ImageInfo = $this->ImageCreateFromBmp($this->ImagePath);
		}elseif($filetype == 'jpg'){
			$this->ImageInfo = imagecreatefromjpeg($this->ImagePath);
		}elseif($filetype == 'png'){
			$this->ImageInfo = imagecreatefrompng($this->ImagePath);
		}
	}
	
	/* 获取图片RGB信息 */
	public function getRgb(){
		$rgbArray = array();
		$res = $this->ImageInfo;
		$size = $this->ImageSize;
		$wid = $size['0'];
		$hid = $size['1'];
		for($i=0; $i < $hid; ++$i){
			for($j=0; $j < $wid; ++$j){
				$rgb = imagecolorat($res,$j,$i);
				$rgbArray[$i][$j] = imagecolorsforindex($res, $rgb);
			}
		}
		return $rgbArray;
	}

	/* 获取灰度信息 */
	public function getGray(){
		$grayArray = array();
		$size = $this->ImageSize;
		$rgbarray = $this->getRgb();
		$wid = $size['0'];
		$hid = $size['1'];
		for($i=0; $i < $hid; ++$i){
			for($j=0; $j < $wid; ++$j){
				$grayArray[$i][$j] = (299*$rgbarray[$i][$j]['red']+587*$rgbarray[$i][$j]['green']+144*$rgbarray[$i][$j]['blue'])/1000;
			}
		}
		return $grayArray;
	}

	/* 根据灰度信息打印图片 */
	public function printByGray(){
		$size = $this->ImageSize;
		$grayArray = $this->getGray();
		$wid = $size['0'];
		$hid = $size['1'];
		for($k=0;$k<25;$k++){
			echo "{$k}/n";
			for($i=0; $i < $hid; ++$i){
				for($j=0; $j < $wid; ++$j){
					if($grayArray[$i][$j] < $k*10){
						echo '■';
					}else{
						echo '□';
					}
				}
				echo "|/n";
			}
			echo "---------------------------------------------------------------------------------------------------------------/n";
		}
	}

	/* 根据灰度信息打印图片 */
	public function printArray( $grayArray ){
		$size = $this->ImageSize;
		$wid = count($grayArray[0]);
		$hid = count($grayArray);
		for($i=0; $i < $hid; ++$i){
			for($j=0; $j <$wid; ++$j){
				echo $grayArray[$i][$j] ? '■' : '□';
			}
			echo "|{$i}</br>";
		}
	}

	/*
	 * 根据自定义的规则，获取二值化二维数组
	 * @return  图片高*宽的二值数组（0,1）
	 */
	public function getErzhi(){
		$erzhiArray = array();
		$size = $this->ImageSize;
		$grayArray = $this->getGray();
		$wid = $size['0'];
		$hid = $size['1'];
		for($i=0; $i < $hid; ++$i){
			for($j=0; $j <$wid; ++$j){
				if( $grayArray[$i][$j] < 90 ){
					$erzhiArray[$i][$j]=1;
				}else{
					$erzhiArray[$i][$j]=0;
				}
			}
		}
		return $erzhiArray;
	}

	/*
	 * 二值化图片降噪
	 * @param $erzhiArray二值化数组
	 */
	public function reduceZao($erzhiArray){
		$data = $erzhiArray;
		$gao = count($erzhiArray);
		$chang = count($erzhiArray['0']);
		$jiangzaoErzhiArray = array();
		for($i=0;$i<$gao;$i++){
			for($j=0;$j<$chang;$j++){
				$num = 0;
				if($data[$i][$j] == 1) {
					// 上
					if(isset($data[$i-1][$j])){
						$num = $num + $data[$i-1][$j];
					}
					// 下
					if(isset($data[$i+1][$j])){
						$num = $num + $data[$i+1][$j];
					}
					// 左
					if(isset($data[$i][$j-1])){
						$num = $num + $data[$i][$j-1];
					}
					// 右
					if(isset($data[$i][$j+1])){
						$num = $num + $data[$i][$j+1];
					}
					// 上左
					if(isset($data[$i-1][$j-1])){
						$num = $num + $data[$i-1][$j-1];
					}
					// 上右
					if(isset($data[$i-1][$j+1])){
						$num = $num + $data[$i-1][$j+1];
					}
					// 下左
					if(isset($data[$i+1][$j-1])){
						$num = $num + $data[$i+1][$j-1];
					}
					// 下右
					if(isset($data[$i+1][$j+1])){
						$num = $num + $data[$i+1][$j+1];
					}
				}
				if($num < 1){
					$jiangzaoErzhiArray[$i][$j] = 0;
				}else{
					$jiangzaoErzhiArray[$i][$j] = 1;
				}
			}
		}
		return $jiangzaoErzhiArray;
	}

	/* 去除图片边框 - 陈强 */
	public function removalBorder( $erzhiArray ){
		$size = $this->ImageSize;
		$gao = count($erzhiArray);
		$kuan = count($erzhiArray['0']);
		$hangQi = $leiQi = $qianHang = $qianLie = 0;
		for( $i = 0; $i < ( $gao + $kuan ) / 4; $i++ ) {
			$hangSum = $_hangSum = $lieSum = $_lieSum = 0;
			for( $x = $leiQi; $x < $kuan; $x++ ) {
				$hangSum += $erzhiArray[$hangQi][$x];
				$_hangSum += $erzhiArray[$gao-1][$x];
			}
			for( $y = $hangQi; $y < $gao; $y++ ) {
				$lieSum += $erzhiArray[$y][$leiQi];
				$_lieSum += $erzhiArray[$y][$kuan-1];
			}
			if( $hangSum == 0 || $hangSum == ($kuan-$qianLie) ) {
				for( $j=0; $j < count($erzhiArray['0']); ++$j ) $erzhiArray[$hangQi][$j] = 0;
				$hangQi++;
			}
			if( $lieSum == 0 || $lieSum == ($gao-$qianHang) ) {
				for( $j=0; $j < $kuan; ++$j ) $erzhiArray[$j][$leiQi] = 0;
				$leiQi++;
			}
			if( $qianHang != $hangQi && ( $_hangSum == 0 || $_hangSum == ($kuan-$qianLie) ) ) {
				$gao--;
				for( $j=0; $j < $kuan; ++$j ) $erzhiArray[$gao][$j] = 0;
			}
			if( $qianLie != $leiQi && ( $_lieSum == 0 || $_lieSum == ($gao-$qianHang) ) ) {
				$kuan--;
				for( $j=0; $j < count($erzhiArray); ++$j ) $erzhiArray[$j][$kuan] = 0;
			}
			$qianLie = $leiQi;
			$qianHang = $hangQi;
		}
		return $erzhiArray;
	}

	/* 归一化处理,针对一个个的数字,即去除字符周围的白点
	 * @param $singleArray 二值化数组
	 */
	public function getJinsuo($singleArray){
		$dianCount = 0;
		$rearr = array();
		$gao = count($singleArray);
		$kuan = count($singleArray['0']);
		$dianCount = 0;
		$shangKuang = 0;
		$xiaKuang = 0;
		$zuoKuang = 0;
		$youKuang = 0;
		//从上到下扫描
		for($i=0; $i < $gao; ++$i){
			for($j=0; $j < $kuan; ++$j){
				if( $singleArray[$i][$j] == 1){
					$dianCount++;
				}
			}
			if($dianCount>1){
				$shangKuang = $i;
				$dianCount = 0;
				break;
			}
		}
		//从下到上扫描
		for($i=$gao-1; $i > -1; $i--){
			for($j=0; $j < $kuan; ++$j){
				if( $singleArray[$i][$j] == 1){
					$dianCount++;
				}
			}
			if($dianCount>1){
				$xiaKuang = $i;
				$dianCount = 0;
				break;
			}
		}
		//从左到右扫描
		for($i=0; $i < $kuan; ++$i){
			for($j=0; $j < $gao; ++$j){
				if( $singleArray[$j][$i] == 1){
					$dianCount++;
				}
			}
			if($dianCount>1){
				$zuoKuang = $i;
				$dianCount = 0;
				break;
			}
		}
		//从右到左扫描
		for($i=$kuan-1; $i > -1; --$i){
			for($j=0; $j < $gao; ++$j){
				if( $singleArray[$j][$i] == 1){
					$dianCount++;
				}
			}
			if($dianCount>1){
				$youKuang = $i;
				$dianCount = 0;
				break;
			}
		}
		for($i=0;$i<$xiaKuang-$shangKuang+1;$i++){
			for($j=0;$j<$youKuang-$zuoKuang+1;$j++){
				$rearr[$i][$j] = $singleArray[$shangKuang+$i][$zuoKuang+$j];
			}
		}
		return $rearr;
	}

	/*
	 * 【利用分析切割】
	 * 切割成三维数组，每个小数字在一个数组里面
	 * 只适用四个数字一起的数组
	 * @param 经过归一化处理的二值化数组
	 */
	function cutSmall($erzhiArray){
		$doubleArray = array();
		$jieZouyou = array();
		$gao = count($erzhiArray);
		$kuan = count($erzhiArray['0']);
		$jie = 0;
		$s = 0;
		$jieZouyou[$s] = 0;
		$s++;
		//从左到右扫描
		for($i=0; $i < $kuan;){
			for($j=0; $j < $gao; ++$j){
				$jie = $jie + $erzhiArray[$j][$i];
			}
			//如果有一列全部是白，设置$jieZouyou,并且跳过中间空白部分
			if($jie == 0){
				$jieZouyou[$s] = $i+1;
				do{
					$n = ++$i;
					$qian = 0;
					$hou = 0;
					for($m=0; $m < $gao; ++$m){
						$qian = $qian + $erzhiArray[$m][$n];
						$hou = $hou + $erzhiArray[$m][$n+1];
					}
					$jieZouyou[$s+1] = $n+1;
				}while($qian == 0 && $hou == 0);//当有两列同时全部为白，说明有间隙，循环，知道间隙没有了
				$s+=2;
				$i++;
			}else{
				$i++;
			}
			$jie = 0;
		}
		$jieZouyou[] = $kuan;
		//极端节点数量，(应该是字符个数)*2
		$jieZouyouCount = count($jieZouyou);
		for($k=0;$k<$jieZouyouCount/2;$k++){
			for($i=0; $i < $gao; $i++){
				for($j=0; $j < $jieZouyou[$k*2+1]-$jieZouyou[$k*2]-1; ++$j){
					$doubleArray[$k][$i][$j] = $erzhiArray[$i][$j+$jieZouyou[$k*2]];
				}
			}
		}
		return $doubleArray;
	}


	/*
	 * 定义求线性回归A和B的函数
	 * @param $zuobiaoArray坐标的三维数组
	 */
	public function getHuigui($zuobiaoArray){
		$y8 = 0;
		$x8 = 0;
		$x2 = 0;
		$xy = 0;
		$geshu = count($zuobiaoArray);
		for($i=0;$i<$geshu;$i++){
			$y8 = $y8+$zuobiaoArray[$i]['y'];
			$x8 = $x8+$zuobiaoArray[$i]['x'];
			$xy = $xy+$zuobiaoArray[$i]['y']*$zuobiaoArray[$i]['x'];
			$x2 = $x2 + $zuobiaoArray[$i]['x']*$zuobiaoArray[$i]['x'];
		}
		$y8 = $y8/$geshu;
		$x8 = $x8/$geshu;
		$b = ($xy-$geshu*$y8*$x8)/($x2-$geshu*$x8*$x8);
		$a = $y8-$b*$x8;
		$re['a'] = $a;
		$re['b'] = $b;
		return $re;
		//y = b * x + a26
	}

	/*
	 * 定义转化坐标的函数
	 * @param $x x坐标即$i
	 * @param $y y坐标，即j
	 * @param $b 线性回归方程的b参数
	 */
	public function getNewZuobiao($x,$y,$b){
		if($x == 0){
			if($y>0){
				$xianJiao = M_PI/2;
			}elseif($y<0){
				$xianJiao = -M_PI/2;
			}else{
				$p['x'] = 0;
				$p['y'] = 0;
				return $p;
			}
		}else{
			$xianJiao = atan($y/$x);
		}
		$jiao =$xianJiao-atan($b);
		$chang = sqrt($x*$x+$y*$y);
		$p['x'] = $chang*cos($jiao);
		$p['y'] = $chang*sin($jiao);
		return $p;
	}

	/*
	 * 对【单个】数字的二值化二维数组进行倾斜调整
	 * @param  $singleArray  高*宽的二值数组（0,1）
	 */
	public function singleSlopeAdjust($singleErzhiArray){
		$slopeArray = array();
		$gao = count($singleErzhiArray);
		$chang = count($singleErzhiArray['0']);
		//初始化$slopeArray
		for($i=0;$i<$gao*4;$i++){
			for($j=0;$j<$chang*4;$j++){
				$slopeArray[$i][$j] = 0;
			}
		}
		//初始化中心坐标(是数组的下标)
		$centerXfoalt = ($gao-1)/2;
		$centerYfoalt = ($chang-1)/2;
		$centerX = ceil($centerXfoalt);
		$centerY = ceil($centerYfoalt);
		//初始化图片倾斜诶角度
		/*斜率的计算！！！！！，回归方程*/
		//从上到下扫描，计算中点，求得一串坐标（$i,$ava）
		for($i=0;$i<$gao;$i++){
			$Num = 0;
			$Amount = 0;
			for($j=0;$j<$chang;$j++){
				if($singleErzhiArray[$i][$j] == 1){
					$Num = $Num+$j;
					$Amount++;
				}
			}
			if($Amount == 0){
				$Ava[$i] = $chang/2;
			}else{
				$Ava[$i] = $Num/$Amount;
			}
		}
		//计算线性回归方程的b与a
		$zuo = array();
		for($j=0;$j<count($Ava);$j++){
			$zuo[$j]['x'] = $j;
			$zuo[$j]['y'] = $Ava[$j];
		}
		$res = $this->getHuigui($zuo);
		$zuoB = $res['b'];
		for($i=0;$i<$gao;$i++){
			for($j=0;$j<$chang;$j++){
				if($singleErzhiArray[$i][$j] == 1){
					$splodeZuobiao = $this->getNewZuobiao($i,$j,$zuoB);
					$splodeX = $splodeZuobiao['x'];
					$splodeY = $splodeZuobiao['y'];
					$slopeArray[$splodeX+$gao][$splodeY+$chang] = 1;
				}
			}
		}
		//将预处理的数组空白清理
		$slopeArray = $this->getJinsuo($slopeArray);
		return $slopeArray;
	}

	/*
	 * 进行匹配
	 * @param  $Image  图片路径
	 */
	public function run($Image){
		$data = array('','','','');
		$result="";
		$bilu = '';
		$maxarr = '';
		//提取特征
		//$this->prepare($Image);
		$yuanshi = $this->getErzhi();
		$yijijiangzao = $this->reduceZao($yuanshi);
		$small = $this->cutSmall($yijijiangzao);
		for($k=0;$k<4;$k++){
			//$tianchong = $this->tianChong($small[$k]);
			$tianchong = $small[$k];
			$tiaozhenjiaodu = $this->singleSlopeAdjust($tianchong);
			//$tongyidaxiao = $this->tongyiDaxiao($tiaozhenjiaodu);
			$tongyidaxiao = $tiaozhenjiaodu;
			for($i=0;$i<20;$i++){
				for($j=0;$j<20;$j++){
					$data[$k] .= $tongyidaxiao[$i][$j];
				}
			}
		}print_r($data);
		// 进行关键字匹配
		foreach($data as $numKey => $numString){
			$max = 0;
			$num = 0;
			foreach($this->Keys as $value => $key){
				similar_text($value, $numString,$percent);
				if($percent > $max){
					$max = $percent;
					$num = $key;
					$zim = $value;
				}
				if($max>95){
					break;
				}
			}
			$result .=$num;
			$maxarr[] = $max;
		}
		// 查找最佳匹配数字
		$re = $maxarr;
		$re[] = $result;
		return $re;
		//return $result.'|max|一:'.$maxarr['0'].'|二:'.$maxarr['1'].'|三:'.$maxarr['2'].'|四:'.$maxarr['3'];
	}

	/**
	 * BMP 创建函数
	 * @author simon
	 * @param string $filename path of bmp file
	 * @example who use,who knows
	 * @return resource of GD
	 */
	function imagecreatefrombmp( $filename ){
		if ( !$f1 = fopen( $filename, "rb" ) ) return FALSE;
		$FILE = unpack( "vfile_type/Vfile_size/Vreserved/Vbitmap_offset", fread( $f1, 14 ) );
		if ( $FILE['file_type'] != 19778 ) return FALSE;
		$BMP = unpack( 'Vheader_size/Vwidth/Vheight/vplanes/vbits_per_pixel' . '/Vcompression/Vsize_bitmap/Vhoriz_resolution' . '/Vvert_resolution/Vcolors_used/Vcolors_important', fread( $f1, 40 ) );
		$BMP['colors'] = pow( 2, $BMP['bits_per_pixel'] );
		if ( $BMP['size_bitmap'] == 0 ) $BMP['size_bitmap'] = $FILE['file_size'] - $FILE['bitmap_offset'];
		$BMP['bytes_per_pixel'] = $BMP['bits_per_pixel'] / 8;
		$BMP['bytes_per_pixel2'] = ceil( $BMP['bytes_per_pixel'] );
		$BMP['decal'] = ($BMP['width'] * $BMP['bytes_per_pixel'] / 4);
		$BMP['decal'] -= floor( $BMP['width'] * $BMP['bytes_per_pixel'] / 4 );
		$BMP['decal'] = 4 - (4 * $BMP['decal']);
		if ( $BMP['decal'] == 4 ) $BMP['decal'] = 0;
		$PALETTE = array();
		if ( $BMP['colors'] < 16777216 ){
			$PALETTE = unpack( 'V' . $BMP['colors'], fread( $f1, $BMP['colors'] * 4 ) );
		}
		$IMG = fread( $f1, $BMP['size_bitmap'] );
		$VIDE = chr( 0 );
		$res = imagecreatetruecolor( $BMP['width'], $BMP['height'] );
		$P = 0;
		$Y = $BMP['height'] - 1;
		while( $Y >= 0 ){
			$X = 0;
			while( $X < $BMP['width'] ){
				if ( $BMP['bits_per_pixel'] == 32 ){
					$COLOR = unpack( "V", substr( $IMG, $P, 3 ) );
					$B = ord(substr($IMG, $P,1));
					$G = ord(substr($IMG, $P+1,1));
					$R = ord(substr($IMG, $P+2,1));
					$color = imagecolorexact( $res, $R, $G, $B );
					if ( $color == -1 )
						$color = imagecolorallocate( $res, $R, $G, $B );
					$COLOR[0] = $R*256*256+$G*256+$B;
					$COLOR[1] = $color;
				}elseif ( $BMP['bits_per_pixel'] == 24 )
					$COLOR = unpack( "V", substr( $IMG, $P, 3 ) . $VIDE );
				elseif ( $BMP['bits_per_pixel'] == 16 ){
					$COLOR = unpack( "n", substr( $IMG, $P, 2 ) );
					$COLOR[1] = $PALETTE[$COLOR[1] + 1];
				}elseif ( $BMP['bits_per_pixel'] == 8 ){
					$COLOR = unpack( "n", $VIDE . substr( $IMG, $P, 1 ) );
					$COLOR[1] = $PALETTE[$COLOR[1] + 1];
				}elseif ( $BMP['bits_per_pixel'] == 4 ){
					$COLOR = unpack( "n", $VIDE . substr( $IMG, floor( $P ), 1 ) );
					if ( ($P * 2) % 2 == 0 )
						$COLOR[1] = ($COLOR[1] >> 4);
					else
						$COLOR[1] = ($COLOR[1] & 0x0F);
					$COLOR[1] = $PALETTE[$COLOR[1] + 1];
				}elseif ( $BMP['bits_per_pixel'] == 1 ){
					$COLOR = unpack( "n", $VIDE . substr( $IMG, floor( $P ), 1 ) );
					if ( ($P * 8) % 8 == 0 )
						$COLOR[1] = $COLOR[1] >> 7;
					elseif ( ($P * 8) % 8 == 1 )
						$COLOR[1] = ($COLOR[1] & 0x40) >> 6;
					elseif ( ($P * 8) % 8 == 2 )
						$COLOR[1] = ($COLOR[1] & 0x20) >> 5;
					elseif ( ($P * 8) % 8 == 3 )
						$COLOR[1] = ($COLOR[1] & 0x10) >> 4;
					elseif ( ($P * 8) % 8 == 4 )
						$COLOR[1] = ($COLOR[1] & 0x8) >> 3;
					elseif ( ($P * 8) % 8 == 5 )
						$COLOR[1] = ($COLOR[1] & 0x4) >> 2;
					elseif ( ($P * 8) % 8 == 6 )
						$COLOR[1] = ($COLOR[1] & 0x2) >> 1;
					elseif ( ($P * 8) % 8 == 7 )
						$COLOR[1] = ($COLOR[1] & 0x1);
					$COLOR[1] = $PALETTE[$COLOR[1] + 1];
				}else
					return FALSE;
				imagesetpixel( $res, $X, $Y, $COLOR[1] );
				$X++;
				$P += $BMP['bytes_per_pixel'];
			}
			$Y--;
			$P += $BMP['decal'];
		}
		fclose( $f1 );
		return $res;
	}

}
?>
