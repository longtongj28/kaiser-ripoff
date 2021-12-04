<?php

include 'dbconnect.php';

$sql = "
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
       ";

if(mysqli_multi_query($conn, $sql)){
    echo "IT WORKED";
}else{
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}