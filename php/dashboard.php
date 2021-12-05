<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div>
    <?php
    include 'dbconnect.php';

    $PersonID = $_GET['PersonID'];

    /** @var $conn */
    $query = mysqli_query($conn, "SELECT * FROM person WHERE PersonID='$PersonID'");
    $userInfo = mysqli_fetch_row($query);

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

</div>
</body>
</html>