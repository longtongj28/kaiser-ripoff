USE Hospital;


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
('k1234qwe', 'Johnson', 'Tong', 'Cedar Street', '2548', 'Los Angeles', '95248', '5109542145', '852141234'),
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
    ('AA22121212','00a111111','3434343434','2021-12-01','Severe Migrains'),
    ('AA22121212','00a222222','5656565656','2021-12-01','Yearly Checkup'),
    ('AA22121212','00a333333','7878787878','2021-12-01','Yearly Checkup'),
    ('AA22121212','00a444444','7878787878','2021-12-01','Yearly Checkup'),
    ('AA22121212','00a555555','9090909090','2021-12-01','Yearly Checkup'),
    ('AA22121212','00a555555','1212121212','2021-12-01','Noticable Growth')
    ;
