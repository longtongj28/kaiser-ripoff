<?php

include 'dbconnect.php';

/** @var $conn */

if(isset($_POST['bookAptSubmit'])) {

    // Still need to generate PersonID
    $appointmentNo = generateID(10);
    $patientID = $_POST['patientID'];
    $doctorID = $_POST["doctorChoice"];
    $visitDate = $_POST["aptDate"];
    //htmlspecialchars($_GET['PersonID']);
    $sql = "INSERT INTO Appointment (appointmentNo, patientID, doctorID, visitDate) VALUES 
                                ('$appointmentNo', '$patientID', '$doctorID', '$visitDate')";

    if(mysqli_query($conn, $sql)) {

    }else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    mysqli_close($conn);

}
function generateID(int $num) {

    $characters = str_split('0123456789abcdefghijklmnopqrstuvwxyz');
    $randString = ''; 
    for ($i = 0; $i < $num; $i++) {
        $randString .= $characters[rand(0, count($characters))];
    }
    
    return $randString;
}

?>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
</head>
<body>
    <div>
        Added appointment!
    </div>
</body>
</html>