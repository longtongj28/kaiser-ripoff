<?php

$link = mysqli_connect('localhost', 'root', 'Stripes13!');

if (!$link) {
    die('Could not connect: ' . mysqli_error());
}

echo "Connected Successfully";

$dbName = "DocOffice";
mysqli_select_db($link, $dbName) or die("Unable to select database $dbName");

?>