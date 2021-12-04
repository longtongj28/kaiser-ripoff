<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hello</title>
</head>
<body>
    <div>
        <form action="signupform.php" method="post">
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

            <label for="personID">Person ID: </label>
            <input type="text" id="personID" name="personID"><br>

            <input type="submit" name="submit" class="button" value="Submit"/>
        </form>
    </div>
</body>
</html>