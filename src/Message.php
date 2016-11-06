<?php

class Message {
  
  protected $text;
  protected $userId;
  
  public function __construct($text, $userId) {
    $this->setText($text);
    $this->setUserId($userId);
  }
  
  public function setText($text){
    if (is_string($text) && strlen($text) > 5){
      $this->text = $text;
      return $this;
    }
  } 
  
  public function getUserId($userId){
    $query = "SELECT id FROM Users"
            . "WHERE id=" . $userId;
    $res = $conn->query($query);
    $this->userId = $res;
    return $this;
  }
  
  public function getText(){
    return $this->text;
  }
  
  public function getUserId(){
    return $this->userId;
  }
}

