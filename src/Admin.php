<?php

class Admin {
  
  protected $name;
  protected $email;
  protected $password;
  
  public function __construct($name, $email, $password) {
    $this->setName($name);
    $this->setEmail($email);
    $this->setPassword($password);
  }
  
   public function setName($name){
    if(is_string($name) && strlen($name) > 3){
      $this->name = $name;
      return $this;
    } else {
      echo "Nieprawidłowe dane.";
    }
  }
  
   public function setEmail($email){
    if(preg_match('^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]{1,})*\.([a-zA-Z]{2,}){1}$', $email)){
      $this->email = $email;
      return $this;
    } else {
      echo "Nieprawidłowe dane";
    }
  }
  
    public function setPassword($password){
    if(is_string($password) && strlen($password) > 4){
      $this->password = password_hash($password, PASSWORD_DEFAULT);
      return $this;
    } else {
      echo "Nieprawidłowe dane";
    }
  }
  
  public function getName(){
    return $this->name;
  }
  
  public function getEmail(){
    return $this->email;
  }
  
  public function getPassword(){
    return $this->password;
  }
  
  public function sendMessage($message){
    
  }
}
