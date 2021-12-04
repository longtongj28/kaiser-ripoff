<?php

include 'dbconnect.php';

if(isset($_POST['submit'])) {

    $PersonID = $_POST['personID'];
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $streetName = $_POST['streetName'];
    $streetNum = $_POST['streetNum'];
    $city = $_POST['city'];
    $zipCode = $_POST['zipCode'];
    $phoneNum = $_POST['phoneNumber'];
    $SSN = $_POST['SSN'];


    $sql = "INSERT INTO person (PersonID, firstName, lastName, streetName, streetNum, city, zipCode, phoneNumber, SSN) VALUES 
                                ('$PersonID', '$firstName', '$lastName', '$streetName', '$streetNum', '$city', '$zipCode', '$phoneNum', '$SSN')";

    if(mysqli_query($conn, $sql)) {
        echo "IT WORKED";
    }else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);

}else{
    echo "rip";
}



