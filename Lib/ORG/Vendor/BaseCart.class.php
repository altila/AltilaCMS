<?php
/**
 * 真真
 * 真真
 * 
 * 真真�
 * 1真真真真真真真真真真真真真真真真真真真真真真真真�
 * 2真真真真真真真真真真
 * 
 * 真真真真�
 * 
 * 真真�
 * 1真真真真真
 * 2真真真
 * 3真真真
 * 4真真真真
 * 
 * 5真真+1
 * 6真真-1
 * 
 * 7真真真真真�
 * 8真真真真真�
 * 9真真真真真真�
 * 10真真真真真真
 * 
 * 11真真真
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
	//真真真真真�session�
	public static function getCart () {
		if( !isset($_SESSION['cart']) || !($_SESSION['cart'] instanceof self) ) {
			$_SESSION['cart'] = self::getIns();
		}
		return $_SESSION['cart'];
	}
	//真真
	public function addItem ($id,$name,$price,$num=1) {
		if($this->hasItem($id)){ //真真真真真真真真
			echo $id."真�";
			$this->incItem($id,$num);
			return;
		}
		$this->items[$id] = array();
		$this->items[$id]['name'] = $name;
		$this->items[$id]['price'] = $price;
		$this->items[$id]['num'] = $num;
	}
	//真真真真真真
	//真真真真真�$num
	public function modNum ($id,$num) {
		if(!$this->hasItem($id)){
			return false;
		}
		$this->items[$id]['num'] = $num;
	}
	//真真真1
	public function incItem ($id,$num=1) {
		if($this->hasItem($id)){
			$this->items[$id]['num'] += $num;
		}
	}
	//真真真1
	public function decItem ($id,$num=1) {
		if($this->hasItem($id)){
			$this->items[$id]['num'] -= $num;
		}
		//真�0
		if($this->items[$id]['num'] < 1){
			$this->delItem($id);
		}
	}
	//真真�
	public function delItem ($id) {
		unset($this->items[$id]);
	}
	//真真真真�
	public function hasItem ($id) {
		return array_key_exists($id, $this->items);
	}
	//真真真�
	public function getCnt () {
		return count($this->items);
	}
	//真真真真真�
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
	//真真真真真真�
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
	//真真真真真�
	public function getAll () {
		return $this->items;
	}
	//真真�
	public function clearCart () {
		$this->items = array();
		echo "真真真�";
	}
}
// print_r(Cart::getCart());
/*
$cart = Cart::getCart();
if(!isset($_GET['test'])){
	$_GET['test'] = '';
}
if($_GET['test'] == 'addw'){
	$cart->addItem(1,'真',23.4,1);
	echo '真真真';
}
else if($_GET['test'] == 'addc'){
	$cart->addItem(2,'真',2500.46,1);
	echo '真真真';
}
else if ($_GET['test'] == 'clear'){
	$cart->clearCart();
} else {
	echo "<pre>";
	print_r($cart->getAll());
	echo '真'. $cart->getCnt() .'�'. $cart->getNum() .'真�<br />';
	echo '真真�'. $cart->getPrice() . '真';
}
 */
