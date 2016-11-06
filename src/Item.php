<?php

class Item {
  protected $name;
  protected $price;
  protected $desription;
  protected $stock;
  
  public function __construct($name, $price, $description,$stock) {
    $this->setName($name);
    $this->setPrice($price);
    $this->setDescription($description);
    $this->setStock($stock);
  }
  
   public function setName($name){
    if(is_string($name) && strlen($name) > 3){
      $this->name = $name;
      return $this;
    } else {
      echo "Nieprawidłowe dane.";
    }
  }
  
  public function setPrice($price){
    if (is_decimal($price) && $price > 0 ){
      $this->price = $price;
      return $this;
    } else {
      echo "Nieprawidłowe dane";
    }
  }
  
  public function setDescription($description){
    if (is_string($description)){
      $this->desription = $description;
      return $this;
    } else {
      $this->desription = "Brak opisu";
      return $this;
    }
  }
  
  public function setStock($stock){
    if(is_int($stock) && $stock > 0){
      $this->stock = $stock;
      return $this;
    } else {
      $this->stock = 0;
      echo "Brak produktów!";
    }
  }
  
  public function getName(){
    return $this->name;
  }
  
  public function getPrice(){
    return $this->price;
  }
  
  public function getDescription(){
    return $this->desription;
  }
  
  public function getStock(){
    return $this->stock;
  }
  
  public function displayPictures(){
    $query = "SELECT path FROM ItemsPics JOIN Items
              ON ItemsPics.itemId = Items.id
              WHERE Items.id=" . $this->id;
    $res = $conn->query($query);
    
    foreach ($res as $path){
      echo '<img src="' . $path . '">';
    }
    
  }
}