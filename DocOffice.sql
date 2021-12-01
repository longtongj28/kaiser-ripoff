-- Run this script directly in the MySQL server query window it will automatically create the database and all the database objects.
-- Creating Hospital Schema


DROP DATABASE IF EXISTS DocOffice;
CREATE DATABASE DocOffice;

USE DocOffice;

DROP TABLE IF EXISTS Person;
Create TABLE Person (
	PersonID char(8),
	firstName varchar(25) not null, 
	lastName varchar(25) not null,
	streetName varchar(25),
	streetNum varchar(10),
	city varchar(25),
	zipCode varchar(15),
	phoneNumber char(10),
	SSN char(9) not null,
    
	CONSTRAINT pk_Person primary key (PersonID)
);
    


DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
	doctorID char(10) not null,
	medicalDegrees varchar(25),
	personID char(8),
  
	CONSTRAINT pk_Doctor primary key (doctorID),
	CONSTRAINT fk_Doctor_personID foreign key (personID) references Person(PersonID)
);

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient(
	patientID char(9) not null, 
	phoneNumber char(10),
	DOB date,
	personID char(8),
  
	CONSTRAINT pk_Patient primary key (patientID),
	CONSTRAINT fk_Patient_personID foreign key (personID) references Person(PersonID)
);

DROP TABLE IF EXISTS Appointment;
CREATE TABLE Appointment(
	appointmentNo char(10) not null, 
	patientID char(9) not null,
	doctorID char(10) not null,
	visitDate date,
	docNote varchar(100),
  
	CONSTRAINT pk_Appointment primary key (appointmentNo),
	CONSTRAINT fk_Appointment_doctorID foreign key (doctorID) references Doctor(doctorID),
	CONSTRAINT fk_Appointment_patientID foreign key (patientID) references Patient(patientID)
);

DROP TABLE IF EXISTS MedicalTest;
CREATE TABLE MedicalTest(
	testID char(10) not null,
	testType varchar(25) not null,
  
	CONSTRAINT pk_MedicalTest primary key (testID)
);

DROP TABLE IF EXISTS PVisitTest;
CREATE TABLE PVisitTest(
	appointmentNo char(10) not null,
	testID char(10) not null,

	CONSTRAINT fk_PVisitTest_appointmentNo foreign key (appointmentNo) references Appointment(appointmentNo),
	CONSTRAINT fk_PVisitTest_testID foreign key (testID) references MedicalTest(testID)
);
    


DROP TABLE IF EXISTS Prescription;
CREATE TABLE Prescription(
	prescriptionID char(10) not null, 
	drugName varchar(25) not null,
  
	CONSTRAINT pk_Prescription primary key (prescriptionID)
);

DROP TABLE IF EXISTS PVisitPrescription;
CREATE TABLE PVisitPrescription(
	appointmentNo char(10) not null, 
	prescriptionID char(10) not null, 
    
	CONSTRAINT fk_PVisitPrescriptiont_appointmentNo foreign key (appointmentNo) references Appointment(appointmentNo),
	CONSTRAINT fk_PVisitPrescription_prescriptionID foreign key (prescriptionID) references Prescription(prescriptionID)
);

DROP TABLE IF EXISTS Specialty;
CREATE TABLE Specialty(
	specialtyID char(8) not null,
	specialtyName varchar(25),
    
	CONSTRAINT pk_Specialty primary key (specialtyID)
);

DROP TABLE IF EXISTS DoctorSpecialty;
CREATE TABLE DoctorSpecialty(
	specialtyID char(8),
	doctorID char(10) not null,
    
	CONSTRAINT fk_DoctorSpecialty_specialtyID foreign key (specialtyID) references Specialty(specialtyID),
	CONSTRAINT fk_DoctorSpecialty_doctorID foreign key (doctorID) references Doctor(doctorID)
);

DROP TABLE IF EXISTS Audit;
CREATE TABLE Audit(
  doctorName varchar(25) not null,
  auditAction varchar(25) not null,
  specialty varchar(25) not null,
  dateModified date not null
);