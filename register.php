<?php

require_once'connection.php';

//"F" stands for "Form" because we are grabbing from a form
$username = $_POST['FUsername'];
$password = $_POST['FPassword'];
$email = $_POST['FEmail']

$sql = "INSERT INTO accounts VALUES ( NULL, '$username', '$password', '$email')";

$query = $conn->prepare ( $sql );

//This way may be safer
$sql = "INSERT INTO users ( username, password, first_name, surname, address, email ) VALUES ( :username, :password, :first_name, :surname, :address, :email )";

$query = $conn->prepare( $sql );

$result = $query->execute( array( ':username'=>$username, ':password'=>$password, ':first_name'=>$first_name, ':surname'=>$surname, ':address'=>$address, ':email'=>$email ) );

if ( $result ){
  echo "<p>Thank you. You have been registered</p>";
} else {
  echo "<p>Sorry, there has been a problem inserting your details. Please contact admin.</p>";
}


?>