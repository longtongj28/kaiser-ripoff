USE DocOffice;

/* 2. Doctor Robert Stevens is retiring. We need to inform all his patients and ask
them to select a new doctor. For this purpose, Create a VIEW that finds the
names and Phone numbers of all of Robert's patients.*/

DROP VIEW IF EXISTS Stevens_Patients;
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

/* 3. Create a view that has the First Names, Last Names of all doctors who gave out
prescriptions for Vicodin.*/

DROP VIEW IF EXISTS Vicodin_Patients;
CREATE VIEW Vicodin_Patients AS
SELECT firstName, lastName
FROM Person
WHERE personID IN(
	SELECT personID
    FROM Doctor
    WHERE doctorID IN(
		SELECT doctorID
        FROM Appointment
        WHERE appointmentNo IN(
			SELECT appointmentNo
            FROM PVisitPrescription
            WHERE prescriptionID = '5522334455'
)));
        
/* 4. Create a view that shows the First Name and Last name of all doctors and their
specialty. */

DROP VIEW IF EXISTS Doctor_Specialty4;
CREATE VIEW Doctor_Specialty4 AS
SELECT p.firstName, p.lastName, s.specialtyName
FROM Person p
INNER JOIN Doctor d
ON p.personID = d.personID
LEFT JOIN DoctorSpecialty ds
ON d.doctorID = ds.doctorID
LEFT JOIN Specialty s
ON ds.specialtyID = s.specialtyID
;

/* 5. Modify the view created in Q4 to show the First Name and Last name of all
doctors and their specialties ALSO include doctors who DO NOT have any
specialty. */

DROP VIEW IF EXISTS Doctor_Specialty5;
CREATE VIEW Doctor_Specialty5 AS
SELECT p.firstName, p.lastName, s.specialtyName
FROM Person p
RIGHT JOIN Doctor d
ON p.personID = d.personID
LEFT JOIN DoctorSpecialty ds
ON d.doctorID = ds.doctorID
LEFT JOIN Specialty s
ON ds.specialtyID = s.specialtyID
;

/* 6. Create a trigger on the DoctorSpeciality so that every time a doctor’s specialty is
updated or added, a new entry is made in the audit table. The audit table will
have the following (Hint-The trigger will be on DoctorSpecialty table).
a. Doctor’s FirstName
b. Action(indicate update or added)
c. Specialty
d. Date of modification*/

DROP TRIGGER IF EXISTS Trigger_Aud_Specialty_Insert;
CREATE TRIGGER Trigger_Aud_Specialty_Insert
AFTER INSERT
ON DoctorSpecialty
FOR EACH ROW
    INSERT INTO Audit (doctorName, auditAction, specialty, dateModified)
        SELECT p.firstName, 'Insert', NEW.specialtyID, NOW()
		FROM Person p
		RIGHT JOIN Doctor d
		ON p.personID = d.personID
		LEFT JOIN DoctorSpecialty ds
		ON d.doctorID = ds.doctorID
		LEFT JOIN Specialty s
		ON ds.specialtyID = s.specialtyID
        WHERE NEW.doctorID = ds.doctorID
;

DROP TRIGGER IF EXISTS Trigger_Aud_Specialty_Update;
CREATE TRIGGER Trigger_Aud_Specialty_Update
AFTER UPDATE
ON DoctorSpecialty
FOR EACH ROW
    INSERT INTO Audit (doctorName, auditAction, specialty, dateModified)
        SELECT p.firstName, 'Update', NEW.specialtyID, NOW()
		FROM Person p
		RIGHT JOIN Doctor d
		ON p.personID = d.personID
		LEFT JOIN DoctorSpecialty ds
		ON d.doctorID = ds.doctorID
		LEFT JOIN Specialty s
		ON ds.specialtyID = s.specialtyID
        WHERE NEW.doctorID = ds.doctorID
;

	

/* 7. Create a script to do the following (Write the script for this)
a. If first time backup take backup of all the tables
b. If not the first time remove the previous backup tables and take new
backups.*/

