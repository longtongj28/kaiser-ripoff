<?php

$conn = mysqli_connect('localhost', 'root', 'Stripes13!');

if (!$conn) {
    die('Could not connect: ' . mysqli_error());
}

$dbName = "DocOffice";
mysqli_select_db($conn, $dbName) or die("Unable to select database $dbName");

?>