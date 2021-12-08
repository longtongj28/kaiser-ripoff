<?php

include 'dbconnect.php';

/** @var $conn */

if(isset($_POST['submit'])) {

    // Still need to generate PersonID
    $firstName = $_POST['firstName'];
    $lastName = $_POST['lastName'];
    $streetName = $_POST['streetName'];
    $streetNum = $_POST['streetNum'];
    $city = $_POST['city'];
    $zipCode = $_POST['zipCode'];
    $phoneNum = $_POST['phoneNumber'];
    $SSN = $_POST['SSN'];
    $PersonID = generatePersonID();

    $sql = "INSERT INTO person (PersonID, firstName, lastName, streetName, streetNum, city, zipCode, phoneNumber, SSN) VALUES 
                                ('$PersonID', '$firstName', '$lastName', '$streetName', '$streetNum', '$city', '$zipCode', '$phoneNum', '$SSN')";

    if(mysqli_query($conn, $sql)) {

    }else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);

    echo 'Your Person ID is ' . $PersonID . '<br>';
    echo 'Do not share this with anyone! <br>';

}else{
    echo "rip <br>";
}

function generatePersonID() {

    include 'dbconnect.php';
    
    $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
    $randString = '';
    for ($i = 0; $i < 8; $i++) {
        $randString .= $characters[rand(0, strlen($characters))];
    }
    
    /** @var $conn */
    $temp_id = $randString;
    $result = mysqli_query($conn, "SELECT firstName FROM person WHERE PersonID='$temp_id'");
    if(mysqli_num_rows($result) != 0) {
        generatePersonID();
    }

    return $randString;
}

?>

<html lang="en">
<body>
<form action="login.php">
    <input type="submit" name="submit" class="button" value="Go To Login Page!"/>
</form>
</body>
</html>
