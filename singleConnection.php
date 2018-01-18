// Connection statement that closes the connection after a  query. 
// As many queries can be written as necessary.

<?php
$servername = "csi4999mims.online";
$username = "tcwatling";
$password = "dankmemes";
$databasename = "mims";

try 
  {
    $conn = new PDO('mysql:host=$servername;dbname=$databasename', $username, $password);
    //query can be written in here. See example query
    //$query = $conn->query('SELECT * from profiles');
    
    //Closing the connection
    //Any $queryX variables must be closed as well
    //$query = null;
    $conn = null;
  }
catch (PDOException $e) 
  {
  print "Error!: " . $e->getMessage();
  die();
  }
?>
