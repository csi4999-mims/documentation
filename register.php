<?php

require_once'connection.php';

//"F" stands for "Form" because we are grabbing from a form
$username = $_POST['FUsername'];
$password = $_POST['FPassword'];
$email = $_POST['FEmail']

//$sql = "INSERT INTO profiles VALUES ( NULL, '$username', '$password', '$email')";

//$query = $conn->prepare ( $sql );

//This way may be safer
$sql = "INSERT INTO profiles ( :pEmail, :pPass, :fname, :lname, :pPhone, :pPhoneExt ) VALUES ( Email, pass, first-name, last-name, phone, ext )";

$query = $conn->prepare( $sql );

$result = $query->execute( array( ':pEmail'=>$Email, ':pPass'=>$pass, ':fname'=>$firstname, ':lname'=>$lastname, ':pPhone'=>$phone, ':pPhoneExt'=>$ext ) );

if ( $result ){
  echo "<p>Thank you. You have been registered</p>";
} else {
  echo "<p>Sorry, there has been a problem inserting your details. Please contact admin.</p>";
}


?>
