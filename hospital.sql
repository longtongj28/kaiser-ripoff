-- Run this script directly in the MySQL server query window it will automatically create the database and all the database objects.
-- Creating Hospital Schema


DROP DATABASE IF EXISTS Hospital;
CREATE DATABASE Hospital;

USE Hospital;

DROP TABLE IF EXISTS Doctor;
CREATE TABLE Doctor (
  doctorID char(10) not null,
  lastName varchar(25) not null,
  firstName varchar(25) not null, 
  phoneNumber char(10),
  specialty varchar(25) not null,
  salary dec(65, 2),
  
  CONSTRAINT pk_Doctor primary key (doctorID)
);

DROP TABLE IF EXISTS Patient;
CREATE TABLE Patient(
  patientSSN char(9) not null, 
  lastName varchar(25),
  firstName varchar(25),
  primaryPhoneNo char(10),
  streetName varchar(25),
  streetNum varchar(10),
  city varchar(25),
  zipCode varchar(15),
  insuranceID varchar(20),
  
  CONSTRAINT pk_Patient primary key (patientSSN)
);

DROP TABLE IF EXISTS Appointment;
CREATE TABLE Appointment(
  appointmentNo char(10) not null, 
  testGiven varchar(25),
  patientSSN char(9) not null,
  doctorName varchar(25) not null,
  doctorID char(10) not null,
  aptTime time not null,
  aptDate date not null, 
  roomNo int not null,
  
  CONSTRAINT pk_Appointment primary key (appointmentNo),
  CONSTRAINT fk_DoctorID foreign key (doctorID) references Doctor(doctorID),
  CONSTRAINT fk_PatientSSN foreign key (patientSSN) references Patient(patientSSN),
  CONSTRAINT fk_DoctorName foreign key (doctorName) references Doctor(firstName)
);

DROP TABLE IF EXISTS MedicalTest;
CREATE TABLE MedicalTest(
  testID char(10) not null,
  doctorName varchar(25) not null,
  patientSSN char(9) not null,
  doctorID char(10) not null,
  testType varchar(25) not null,
  result varchar(50) not null,
  dateGiven date not null,
  
  CONSTRAINT pk_MedicalTest primary key (testID),
  CONSTRAINT fk_DateGiven foreign key (dateGiven) references Appointment(aptDate),
  CONSTRAINT fk_DoctorID foreign key (doctorID) references Doctor(doctorID),
  CONSTRAINT fk_PatientSSN foreign key (patientSSN) references Patient(patientSSN),
  CONSTRAINT fk_DoctorName foreign key (doctorName) references Doctor(firstName)
);

DROP TABLE IF EXISTS Prescription;
CREATE TABLE Prescription(
  prescriptionID char(10) not null, 
  drugName varchar(25) not null,
  dosage int not null,
  noRefills int not null,
  datePrescribed date not null,
  mostRecentFiling date,
  prescribedBy char(10) not null, 
  patientSSN char(9) not null,
  
  CONSTRAINT pk_Prescription primary key (prescriptionID),
  CONSTRAINT fk_PrescribedBy foreign key (prescribedBy) references Doctor(doctorID),
  CONSTRAINT fk_patientSSN foreign key (patientSSN) references Patient(patientSSN),
  CONSTRAINT fk_datePrescribed foreign key (datePrescribed) references Appointment(aptDate),
  CONSTRAINT uk_drugName UNIQUE (drugName) 
);

DROP TABLE IF EXISTS Audit;
CREATE TABLE Audit(
  doctorName varchar(25) not null,
  doctorID char(10) not null,
  auditAction varchar(25) not null,
  specialty varchar(25) not null,
  dateModified date not null,
  
  CONSTRAINT pk_Audit primary key (doctorID),
  CONSTRAINT fk_DoctorID foreign key (doctorID) references Doctor(doctorID),
  CONSTRAINT fk_Specialty foreign key (specialty) references Doctor(specialty),
  CONSTRAINT fk_DoctorName foreign key (doctorName) references Doctor(firstName)
);


/* inserting into the hospital database */
INSERT INTO Doctor VALUES
('2ak1234qwe', 'Tong', 'Johnson', '6261234567', 'neurosurgeon', 230.24),
('5ak1w34qw4', 'Harden', 'James', '9091234567', 'psychiatry', 399.24),
('2qqq234qwe', 'James', 'Lebron', '1234567890', 'heart', 124.24),
('2ak1234lzk', 'Edwards', 'Anthony', '1245873491', 'skin', 222.76),
('2afdk23452', 'Davis', 'Anthony', '6261234567', 'bone', 799.21)
;