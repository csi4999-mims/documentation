<?php


$site_root = $_SERVER['connection.php'];
require_once("$site_root");


//"F" stands for "Form" because we are grabbing from a form
$Email = $_POST['email'];
$pass = $_POST['pass'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$phone = $_POST['phone'];

//$sql = "INSERT INTO profiles VALUES ( NULL, '$username', '$password', '$email')";

//$query = $conn->prepare ( $sql );

//This way may be safer
$sql = "INSERT INTO profiles ( :pEmail, :pPass, :fname, :lname, :pPhone ) VALUES ( Email, pass, firstname, lastname, phone )";

$query = $conn->prepare( $sql );

$result = $query->execute( array( ':pEmail'=>$Email, ':pPass'=>$pass, ':fname'=>$firstname, ':lname'=>$lastname, ':pPhone'=>$phone ) );

if ( $result ){
  echo "<p>Thank you. You have been registered</p>";
} else {
  echo "<p>Sorry, there has been a problem inserting your details. Please contact admin.</p>";
}


?>
