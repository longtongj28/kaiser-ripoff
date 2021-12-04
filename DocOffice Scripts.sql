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
        WHERE NEW.doctorID = ds.doctorID AND NEW.specialtyID=ds.specialtyID
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
        WHERE NEW.doctorID = ds.doctorID AND NEW.specialtyID=ds.specialtyID
;

	

/* 7. Create a script to do the following (Write the script for this)
a. If first time backup take backup of all the tables
b. If not the first time remove the previous backup tables and take new
backups.*/

DROP TABLE IF EXISTS Appointment_bak;
CREATE TABLE Appointment_bak LIKE Appointment;
INSERT INTO Appointment_bak SELECT * FROM Appointment;

DROP TABLE IF EXISTS Audit_bak;
CREATE TABLE Audit_bak LIKE Audit;
INSERT INTO Audit_bak SELECT * FROM Audit;

DROP TABLE IF EXISTS Doctor_bak;
CREATE TABLE Doctor_bak LIKE Doctor;
INSERT INTO Doctor_bak SELECT * FROM Doctor;

DROP TABLE IF EXISTS doctorspecialty_bak;
CREATE TABLE doctorspecialty_bak LIKE doctorspecialty;
INSERT INTO doctorspecialty_bak SELECT * FROM doctorspecialty;

DROP TABLE IF EXISTS medicaltest_bak;
CREATE TABLE medicaltest_bak LIKE medicaltest;
INSERT INTO medicaltest_bak SELECT * FROM medicaltest;

DROP TABLE IF EXISTS patient_bak;
CREATE TABLE patient_bak LIKE patient;
INSERT INTO patient_bak SELECT * FROM patient;

DROP TABLE IF EXISTS person_bak;
CREATE TABLE person_bak LIKE person;
INSERT INTO person_bak SELECT * FROM person;

DROP TABLE IF EXISTS prescription_bak;
CREATE TABLE prescription_bak LIKE prescription;
INSERT INTO prescription_bak SELECT * FROM prescription;

DROP TABLE IF EXISTS pvisitprescription_bak;
CREATE TABLE pvisitprescription_bak LIKE pvisitprescription;
INSERT INTO pvisitprescription_bak SELECT * FROM pvisitprescription;

DROP TABLE IF EXISTS pvisittest_bak;
CREATE TABLE pvisittest_bak LIKE pvisittest;
INSERT INTO pvisittest_bak SELECT * FROM pvisittest;

DROP TABLE IF EXISTS specialty_bak;
CREATE TABLE specialty_bak LIKE specialty;
INSERT INTO specialty_bak SELECT * FROM specialty;







