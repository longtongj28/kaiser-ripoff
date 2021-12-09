
<?php

include 'dbconnect.php';
$sql="
SELECT firstName, lastName, Doctor.doctorID FROM
Doctor INNER JOIN Person
ON Doctor.personID = Person.personID AND Doctor.personID != '$PersonID';
"; 

/* You can add order by clause to the sql statement if the names are to be displayed in alphabetical order */

echo "<div>Doctors: </div>";
echo "<select name=\"doctorChoice\" value=''>Doctors: </option>"; // list box select command
$result = mysqli_query($conn,$sql);

while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
{
    echo "\n";
    echo "<option value=$row[doctorID]>
            $row[firstName] $row[lastName]
            </option>"; 
}

echo "</select>";// Closing of list box
echo "<br/>";
