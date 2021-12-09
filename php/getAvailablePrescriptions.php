
<?php

include 'dbconnect.php';
$sql="
    SELECT * FROM Prescription INNER JOIN (
        SELECT a.appointmentNo, visitDate, docNote, prescriptionID FROM Appointment a
        INNER JOIN PVisitPrescription p
        on a.patientID = '$patientID' AND a.appointmentNo = p.appointmentNo) patientPrescription
    on Prescription.prescriptionID = patientPrescription.prescriptionID;;
"; 

/* You can add order by clause to the sql statement if the names are to be displayed in alphabetical order */
$result = mysqli_query($conn,$sql);
print "<table border=1>";
print "<tr><td>Visit Date </td> <td>Doctor's Note </td> <td>Precription ID </td>  <td>Prescription Name </td></tr>";
while($row = mysqli_fetch_array($result, MYSQLI_BOTH))
{
    echo "\n";
    echo "<tr><td>$row[visitDate]</td> <td>$row[docNote]</td> <td>$row[prescriptionID]</td> <td>$row[drugName]</td></tr>";
}
echo "<table/>"
?>