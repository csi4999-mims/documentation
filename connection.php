<?php
$servername = "localhost";
$username = "username";
$password = "password";
$databasename = "databasename";

try {
    $conn = new PDO("mysql:host="$servername;"dbname="$databasename; $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    //echo "Connection Failed: " . $e->getCause();
    }
?>