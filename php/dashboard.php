<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <!-- <link rel="stylesheet" href="styles.css"> -->
</head>
<body>
<div>
    <?php
    include 'dbconnect.php';

    $PersonID = $_GET['PersonID'];

    $query = mysqli_query($conn, "SELECT * FROM person WHERE PersonID='$PersonID'");
    $userInfo = mysqli_fetch_row($query);

    $queryPatientID = mysqli_query($conn, "SELECT patientID FROM patient WHERE personID='$PersonID'");
    $patientInfo = mysqli_fetch_row($queryPatientID);
    if ($patientInfo) {
        $patientID = $patientInfo[0];
    }

    $firstName = $userInfo[1];
    $lastName = $userInfo[2];
    $city = $userInfo[5];
    $ssn = $userInfo[8];
    ?>

    <div id="wrapper">
        <div id="container">
            <h1>Welcome <?php echo $firstName . ' ' . $lastName; ?>!<br></h1>
            <h1>I know I shouldn't tell you, but your SSN is <?php echo $ssn; ?>.<br></h1>
            <a href="login.php">Click Here to Log Out.</a>
        </div>
    </div>
    <div>
        <h2>Book an appointment</h2>
        <form action="appointment.php" method="post">
            <?php include 'getDoctors.php'?>
            <label for="aptDate">Date: </label><br/><input name="aptDate" type="date"/><br/>
            <?php echo "<input type=\"hidden\" value=$patientID  name=\"patientID\"/>"?>
            <input type="submit" name="bookAptSubmit"/>
        </form>
    </div>
    <div>
        <h2>Your medical record</h2>
        <?php

        $medicalRecordSQL = "SELECT a.appointmentNo, a.visitDate, p.firstName,  p.lastName, a.docNote
                                from appointment a
                                LEFT JOIN doctor d
                                ON a.doctorID = d.doctorID
                                LEFT JOIN person p
                                ON d.personID = p.PersonID WHERE a.patientID='$patientID'";
        $medicalRecordResult = mysqli_query($conn, $medicalRecordSQL);

        print "<pre>";
        print "<table border=1>";
        print "<tr><td> Appointment Number </td><td> Visit Date </td><td> Doctor </td><td> Doctor's Note </td> </td>";
        while($row = mysqli_fetch_array($medicalRecordResult, MYSQLI_BOTH))
        {
            print "\n";
            print "<tr><td>$row[appointmentNo] </td><td> $row[visitDate] </td><td> $row[firstName] $row[lastName] </td><td> $row[docNote] </td></tr>	";
        }
        print "</table>";
        print "</pre>";

        ?>
    </div>
    <div>
        <h2>Doctors in your area</h2>
        <?php
             if ($patientInfo) {
                $getNearestSQL = "
                SELECT firstName, lastName, city from 
                (SELECT Doctor.personID, firstName, lastName, city FROM 
                Person inner join Doctor
                on Person.PersonID = Doctor.personID AND Doctor.personID != '$PersonID') doctors where doctors.city LIKE '$city';
                ";
                $result = mysqli_query($conn, $getNearestSQL);

                print "<table border=1>";
                print "<tr><td> First Name </td><td> Last Name </td><td> City </td> </td>";
                while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
                {
                    print "\n";
                    print "<tr><td>$row[firstName] </td><td> $row[lastName] </td><td> $row[city] </td></tr>	";
                }
                print "</table>";
             }
        ?>
    </div>
    <div>
        <h2>Prescriptions History</h2>
        <?php include 'getAvailablePrescriptions.php'?>
    </div>
</div>
</body>
</html>