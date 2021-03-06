USE DocOffice;


/*Create TABLE Person (
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
);*/

INSERT INTO Person VALUES
('k1234qwe', 'Robert', 'Stevens', 'Cedar Street', '2548', 'Los Angeles', '95248', '5109542145', '852141234'),
('k1w34qw4', 'James','Harden', 'Oak Drive', '8521', 'Brooklyn', '56478', '1234567890', '111111111'),
('qq234qwe', 'Lebron', 'James', 'Danes Way', '854', 'Los Angeles', '91006', '2548649875', '222222222'),
('k1234lzk', 'Anthony', 'Edwards', '52st Street', '200', 'Minneapolis', '85123', '9516548524', '333333333'),
('fdk23452', 'Anthony', 'Davis', 'Main Street', '1135', 'Los Angeles', '95426', '6542589761', '444444444'),
('df8456ey', 'Philip', 'Sherman', 'Wallabe Way', '42', 'Sydney', '85469', '9875241111', '555555555'),
('rdf554qw', 'Lemelo', 'Ball', 'Big Baller Drive', '8456', 'Los Angeles', '98765', '8456871235', '666666666'),
('aj8789ew', 'Nikola', 'Jokic', 'Arrowhead Place', '11546', 'Denver', '65845', '9895851333', '777777777'),
('ik8657wb', 'Jordan', 'Pool', 'Torrence Avenue', '524', 'Oakland', '96687', '2225488088', '888888888'),
('dd5689dr', 'Devin', 'Booker', 'Sunshine Avenue', '8888', 'Phoenix', '87779', '4046852225', '999999999')
;

/*
CREATE TABLE Doctor (
	doctorID char(10) not null,
	medicalDegrees varchar(25),
	personID char(8),
  
	CONSTRAINT pk_Doctor primary key (doctorID),
	CONSTRAINT fk_Doctor_personID foreign key (personID) references Person(PersonID)
);*/

INSERT INTO Doctor VALUES
	('1212121212', 'M.D.', 'k1234qwe'),
    ('3434343434', 'M.D.', 'k1w34qw4'),
    ('5656565656', 'M.D.', 'qq234qwe'),
    ('7878787878', 'M.D.', 'k1234lzk'),
    ('9090909090', 'M.D.', 'fdk23452')
;

/*CREATE TABLE Patient(
	patientID char(9) not null, 
	phoneNumber char(10),
	DOB date,
	personID char(8),
  
	CONSTRAINT pk_Patient primary key (patientID),
	CONSTRAINT fk_Patient_personID foreign key (personID) references Person(PersonID)
);*/

INSERT INTO Patient VALUES
	('00a265879','6542589761', '1995-03-11','fdk23452'),
    ('00a111111','9875241111', '1995-09-24','df8456ey'),
    ('00a222222','8456871235', '2001-08-22','rdf554qw'),
    ('00a333333','9895851333', '1995-02-19','aj8789ew'),
    ('00a444444','2225488088', '1999-06-19','ik8657wb'),
    ('00a555555','4046852225', '1996-10-30','dd5689dr')
    ;

/*CREATE TABLE Appointment(
	appointmentNo char(10) not null, 
	patientID char(9) not null,
	doctorID char(10) not null,
	visitDate date,
	docNote varchar(100),
  
	CONSTRAINT pk_Appointment primary key (appointmentNo),
	CONSTRAINT fk_Appointment_doctorID foreign key (doctorID) references Doctor(doctorID),
	CONSTRAINT fk_Appointment_patientID foreign key (patientID) references Patient(patientID)
);*/

INSERT INTO Appointment VALUES
	('AA22121212','00a265879','1212121212','2021-12-01','Prone to injuries'),
    ('AA22131313','00a111111','3434343434','2021-12-01','Severe Migrains'),
    ('AA22141414','00a222222','5656565656','2021-12-01','Yearly Checkup'),
    ('AA22151515','00a333333','7878787878','2021-12-01','Yearly Checkup'),
    ('AA22161616','00a444444','7878787878','2021-12-01','Yearly Checkup'),
    ('AA22171717','00a555555','9090909090','2021-12-01','Yearly Checkup'),
    ('AA22181818','00a555555','1212121212','2021-12-01','Noticable Growth')
    ;
    
/*CREATE TABLE MedicalTest(
	testID char(10) not null,
	testType varchar(25) not null,
  
	CONSTRAINT pk_MedicalTest primary key (testID)
);*/

INSERT INTO MedicalTest VALUES
	('000000000a', 'CT Scan'),
    ('000000000b', 'Blood Test'),
    ('000000000c', 'Urine Test'),
    ('000000000d', 'Endoscopy'),
    ('000000000e', 'Biopsy'),
    ('000000000f', 'Xray')
    ;
    
/*CREATE TABLE PVisitTest(
	appointmentNo char(10) not null,
	testID char(10) not null,

	CONSTRAINT fk_PVisitTest_appointmentNo foreign key (appointmentNo) references Appointment(appointmentNo),
	CONSTRAINT fk_PVisitTest_testID foreign key (testID) references MedicalTest(testID)
);*/

INSERT INTO PVisitTest VALUES
	('AA22121212','000000000f'),
    ('AA22131313','000000000a'),
    ('AA22131313','000000000b'),
    ('AA22131313','000000000c'),
    ('AA22141414','000000000e'),
    ('AA22151515','000000000e'),
    ('AA22161616','000000000e'),
    ('AA22171717','000000000e'),
    ('AA22181818','000000000e'),
    ('AA22181818','000000000b'),
    ('AA22181818','000000000e'),
    ('AA22181818','000000000f')
;

/*CREATE TABLE Prescription(
	prescriptionID char(10) not null, 
	drugName varchar(25) not null,
  
	CONSTRAINT pk_Prescription primary key (prescriptionID)
);*/

INSERT INTO Prescription VALUES
	('1122334455','Levothyroxine'),
    ('0022334455','Lisinopril'),
    ('2222334455','Metformin'),
    ('3322334455','Amlodipine'),
    ('4422334455','Metoprolol'),
    ('5522334455','Vicodin'),
    ('6622334455','Omeprazole'),
    ('7722334455','Losartan'),
    ('8822334455','Simvastatin')
;

/*CREATE TABLE PVisitPrescription(
	appointmentNo char(10) not null, 
	prescriptionID char(10) not null, 
    
	CONSTRAINT fk_PVisitPrescriptiont_appointmentNo foreign key (appointmentNo) references Appointment(appointmentNo),
	CONSTRAINT fk_PVisitPrescription_prescriptionID foreign key (prescriptionID) references Prescription(prescriptionID)
);*/

INSERT INTO PVisitPrescription VALUES
	('AA22121212','1122334455'),
    ('AA22131313','7722334455'),
    ('AA22131313','2222334455'),
    ('AA22131313','5522334455'),
    ('AA22141414','6622334455'),
    ('AA22151515','2222334455'),
    ('AA22161616','8822334455'),
    ('AA22181818','1122334455'),
    ('AA22181818','8822334455'),
    ('AA22181818','5522334455')
;

/*CREATE TABLE Specialty(
	specialtyID char(8) not null,
	specialtyName varchar(25),
    
	CONSTRAINT pk_Specialty primary key (specialtyID)
);*/

INSERT INTO Specialty VALUES
	('aaaa0000', 'Family Medicine'),
    ('aaaa0011', 'Neurology'),
    ('aaaa0022', 'Diagnostic radiology'),
    ('aaaa0033', 'Medical toxicology')
;

/*CREATE TABLE DoctorSpecialty(
	specialtyID char(8) not null,
	doctorID char(10) not null,
    
	CONSTRAINT fk_DoctorSpecialty_specialtyID foreign key (specialtyID) references Specialty(specialtyID),
	CONSTRAINT fk_DoctorSpecialty_doctorID foreign key (doctorID) references Doctor(doctorID)
);*/

INSERT INTO DoctorSpecialty VALUES
	('aaaa0022','1212121212'),
    ('aaaa0011','3434343434'),
    (null,'5656565656'),
    ('aaaa0000','7878787878'),
    ('aaaa0000','9090909090')
;

