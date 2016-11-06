<?php

$serverName = 'localhost';
$userName = 'root';
$password = 'coderslab';
$databaseName = 'intshopbase';

$conn = new mysqli($serverName, $userName, $password, $databaseName);

if ($conn->connect_error){
  die("Connection error: " . $conn->connect_error);
}