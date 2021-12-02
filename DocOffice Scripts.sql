USE DocOffice;

/* 1. Doctor Robert Stevens is retiring. We need to inform all his patients and ask
them to select a new doctor. For this purpose, Create a VIEW that finds the
names and Phone numbers of all of Robert's patients.*/

CREATE VIEW Stevens_Patients AS
SELECT firstName, lastName, phoneNumber
FROM Person
WHERE personID IN(
	SELECT personID
    FROM Patient
    WHERE patientID IN(
		SELECT patientID
        FROM Appointment
        WHERE doctorID IN(
			SELECT doctorID 
            FROM Doctor 
            WHERE personID = 'k1234qwe'
)));
