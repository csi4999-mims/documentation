<?php

require_once'connection.php';

$username = $_POST['AUsername'];
$password = $_POST['APassword'];
 


if($username == '') {
	$errmsg_arr[] = 'You must enter your Username';
	$errflag = true;
}
if($password == '') {
	$errmsg_arr[] = 'You must enter your Password';
	$errflag = true;
}
 

// query is run against existing accounts

$result = $conn->prepare("SELECT * FROM Accounts WHERE username= ? AND password= ?"); //injection prevention
$result->bindParam('1', $username);  //"1" and "2" could by anything
$result->bindParam('2', $password);
$result->execute();


// If at least one username and password is returned than the system redirect to the homepage
// If no usernames and passwords are returned than error message appears and redirects to the login page
$rows = $result->fetch(PDO::FETCH_NUM);
if($rows > 0) {
header("location: "//location of homepage );
}
else{
	$errmsg_arr[] = 'Username and Password are not found';
	$errflag = true;
}

?>


//Testing HTML
<html>
<head><title>Login</title></head>
    <body>
        <form action="<?PHP $_PHP_SELF ?>" method="post">
            Username <input type="text" name="AUsername" value="" /><br/>
            Password <input type = "password" name= "APassword" value="" /><br/>
            <input type= "submit" name="btnsubmit" value="Login"/>
        </form>
    </body>
</html>