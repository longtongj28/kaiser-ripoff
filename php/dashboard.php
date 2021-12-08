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
    $patientID = $patientInfo[0];

    $firstName = $userInfo[1];
    $lastName = $userInfo[2];
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
    <!-- <div>
        <h2>Add a family member</h2>
        <form action="appointment.php" method="post">
            <label for="firstName">First Name: </label>
            <input type="text" id="firstName" name="firstName"><br>

            <label for="lastName">Last Name: </label>
            <input type="text" id="lastName" name="lastName"><br>

            <label for="SSN">SSN: </label>
            <input type="number" id="SSN" name="SSN"><br>

            <label for="streetName">Street Name: </label>
            <input type="text" id="streetName" name="streetName"><br>

            <label for="streetNum">Street Number: </label>
            <input type="number" id="streetNum" name="streetNum"><br>

            <label for="city">City: </label>
            <input type="text" id="city" name="city"><br>

            <label for="zipCode">Zip Code: </label>
            <input type="number" id="zipCode" name="zipCode"><br>

            <label for="phoneNumber">Phone Number: </label>
            <input type="number" id="phoneNumber" name="phoneNumber"><br>

            <input type="submit" name="submit" class="button" value="Submit"/>
        </form>
    </div>
    <div>
        <h2>Find doctors near you</h2>
    </div>
    <div>
        <h2>Your medical record</h2>
    </div> -->
    <!-- <div>
        <a>Book an Appointment</a>
        <a>Add a family member</a>
        <a>Find doctors near you</a>
        <a>Your medical record</a>
    </div> -->
</div>
</body>
</html>