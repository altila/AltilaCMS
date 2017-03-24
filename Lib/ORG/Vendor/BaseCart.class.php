<?php
/**
 * ¿¿¿¿
 * ¿¿¿¿
 * 
 * ¿¿¿¿¿
 * 1¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
 * 2¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
 * 
 * ¿¿¿¿¿¿¿¿¿
 * 
 * ¿¿¿¿¿
 * 1¿¿¿¿¿¿¿¿¿¿
 * 2¿¿¿¿¿¿
 * 3¿¿¿¿¿¿
 * 4¿¿¿¿¿¿¿¿
 * 
 * 5¿¿¿¿+1
 * 6¿¿¿¿-1
 * 
 * 7¿¿¿¿¿¿¿¿¿¿¿
 * 8¿¿¿¿¿¿¿¿¿¿¿
 * 9¿¿¿¿¿¿¿¿¿¿¿¿¿
 * 10¿¿¿¿¿¿¿¿¿¿¿¿
 * 
 * 11¿¿¿¿¿¿
 * 
 * http://www.thinkphp.cn/topic/5205.html
 */
session_start();
Class Cart {
	private static $ins = null;
	private $items = array();
	final protected function __construct(){
	}
	final protected function __clone(){
	}
	protected static function getIns () {
		if( !(self::$ins instanceof self) ) {
			self::$ins = new self();
		}
		return self::$ins;
	}
	//¿¿¿¿¿¿¿¿¿¿¿session¿
	public static function getCart () {
		if( !isset($_SESSION['cart']) || !($_SESSION['cart'] instanceof self) ) {
			$_SESSION['cart'] = self::getIns();
		}
		return $_SESSION['cart'];
	}
	//¿¿¿¿
	public function addItem ($id,$name,$price,$num=1) {
		if($this->hasItem($id)){ //¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
			echo $id."¿¿¿";
			$this->incItem($id,$num);
			return;
		}
		$this->items[$id] = array();
		$this->items[$id]['name'] = $name;
		$this->items[$id]['price'] = $price;
		$this->items[$id]['num'] = $num;
	}
	//¿¿¿¿¿¿¿¿¿¿¿¿
	//¿¿¿¿¿¿¿¿¿¿¿$num
	public function modNum ($id,$num) {
		if(!$this->hasItem($id)){
			return false;
		}
		$this->items[$id]['num'] = $num;
	}
	//¿¿¿¿¿¿1
	public function incItem ($id,$num=1) {
		if($this->hasItem($id)){
			$this->items[$id]['num'] += $num;
		}
	}
	//¿¿¿¿¿¿1
	public function decItem ($id,$num=1) {
		if($this->hasItem($id)){
			$this->items[$id]['num'] -= $num;
		}
		//¿¿¿0
		if($this->items[$id]['num'] < 1){
			$this->delItem($id);
		}
	}
	//¿¿¿¿¿
	public function delItem ($id) {
		unset($this->items[$id]);
	}
	//¿¿¿¿¿¿¿¿¿
	public function hasItem ($id) {
		return array_key_exists($id, $this->items);
	}
	//¿¿¿¿¿¿¿
	public function getCnt () {
		return count($this->items);
	}
	//¿¿¿¿¿¿¿¿¿¿¿
	public function getNum () {
		if($this->getCnt() == 0) {
			return 0;
		}
		$sum = 0;
		foreach($this->items as $v){
			$sum += $v['num'];
		}
		return $sum;
	}
	//¿¿¿¿¿¿¿¿¿¿¿¿¿
	public function getPrice () {
		if($this->getCnt() == 0) {
			return 0;
		}
		$price = 0.0;
		foreach($this->items as $v){
			$price += $v['num'] * $v['price'];
		}
		return $price;
	}
	//¿¿¿¿¿¿¿¿¿¿¿
	public function getAll () {
		return $this->items;
	}
	//¿¿¿¿¿
	public function clearCart () {
		$this->items = array();
		echo "¿¿¿¿¿¿¿";
	}
}
// print_r(Cart::getCart());
/*
$cart = Cart::getCart();
if(!isset($_GET['test'])){
	$_GET['test'] = '';
}
if($_GET['test'] == 'addw'){
	$cart->addItem(1,'¿¿',23.4,1);
	echo '¿¿¿¿¿¿';
}
else if($_GET['test'] == 'addc'){
	$cart->addItem(2,'¿¿',2500.46,1);
	echo '¿¿¿¿¿¿';
}
else if ($_GET['test'] == 'clear'){
	$cart->clearCart();
} else {
	echo "<pre>";
	print_r($cart->getAll());
	echo '¿¿'. $cart->getCnt() .'¿'. $cart->getNum() .'¿¿¿<br />';
	echo '¿¿¿¿¿'. $cart->getPrice() . '¿¿';
}
 */
