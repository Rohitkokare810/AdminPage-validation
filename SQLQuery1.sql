-- Create the database
CREATE DATABASE VaccineManagement;

drop database VaccineManagement

-- Use the database
USE VaccineManagement;





-- Create the User table
CREATE TABLE VUser (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) Unique,
    Password NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    PhoneNumber int,
    DateOfBirth DATE,
	NO_Of_Vaccine_Taken bit not null,
	Book_Vaccine bit 
);
Drop table VUser
insert into VUser values('Rohit','Rohit098','abc','xcv','Rohit@gmail.com',1236547891,'2021/01/02',0,0)
insert into VUser values('Harish','Rohit098','abc','xcv','Rohit@gmail.com',1236547891,'2021/01/02',0,1)

select * from VUser

-- Create the VaccineDetails table
CREATE TABLE VaccineDetails (
    VaccineID INT PRIMARY KEY IDENTITY(1,1),
    VaccineName NVARCHAR(100) NOT NULL,
    Manufacturer NVARCHAR(100),
    Description NVARCHAR(MAX),
    StockQuantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
insert into VaccineDetails values('Covaxin','ABC','Covid-19 vaxin',120,200.00)
select * from VaccineDetails

-- Optional: Create a table to track stock
CREATE TABLE Stock (
    StockID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    VaccineID INT,
    City nvarchar(50),
    CONSTRAINT FK_Administration_User FOREIGN KEY (UserID) REFERENCES VUser(UserID),
    CONSTRAINT FK_Administration_Vaccine FOREIGN KEY (VaccineID) REFERENCES VaccineDetails(VaccineID)
);
Drop table VaccineDetails

-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
	StockID INT foreign key references Stock(StockID),
	UserId INT foreign key references VUser(UserID)
);
Drop table Admin
insert into Admin(Username,Password) values('Admin','Admin@123')
select * from Admin

=================================================================
create Database VaccineManagementDb

use VaccineManagementDb
--drop database VaccineManagementDb

-- Create the User table
CREATE TABLE UserDetails (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) Unique,
    Password NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(10),
    
);
insert into UserDetails Values('User','User@123','Rohit','Kokare','Rohit@gmail.com','1234567895')
select * from UserDetails


-- Create the VaccineDetails table
CREATE TABLE VaccineDetails (
    VaccineID INT  IDENTITY(1,1),
    VaccineName NVARCHAR(100) PRIMARY KEY,
    Manufacturer NVARCHAR(100),
	Stock int,
    
);
insert into VaccineDetails Values('Covxin','ABC',100)
select * from VaccineDetails


CREATE TABLE VaccineDose(
	NumberOfDose int primary key);
	insert into VaccineDose values(0)
	insert into VaccineDose values(1)
	insert into VaccineDose values(2)
	select * from VaccineDose


-- Create the Admin table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(50) NOT NULL,
	);
	insert into Admin(Username,Password) values('Admin','Admin@123')
	select * from Admin

--Create the Location table
CREATE TABLE Location (
CityID int IDENTITY(1,1),
	CityName nvarchar(50) primary key);
	insert into Location Values('Bengaluru')
	insert into Location Values('Chennai')
	insert into Location Values('Bengal')
	select * from Location

--Create the Time Slots table
CREATE TABLE DateTimeSlots
	( DatetimeID int IDENTITY(1,1), DateTimings Datetime primary key,
	
);
insert into DateTimeSlots Values('2024-01-27 1:30:00')
insert into DateTimeSlots Values('2024-01-27 12:30:00')
insert into DateTimeSlots Values('2024-01-27 11:30:00')
select * from DateTimeSlots


--Create table for status
CREATE TABLE StatusOfVaccine(Status nvarchar(50) primary key) 
insert into StatusOfVaccine Values('Not Done')
insert into StatusOfVaccine Values('Done')

	

--Create the Booking-Reg Table
CREATE TABLE BookForVaccine
	(BookingId INT PRIMARY KEY IDENTITY(1,1),
	VaccineName NVARCHAR(100) foreign key references VaccineDetails(VaccineName),
	CityName nvarchar(50) foreign key references Location(CityName),
	UserID INT foreign key references UserDetails(UserID),
	Name nvarchar(50) not null,
	MobileNumber VARCHAR(10) not null,
	DateTimings Datetime foreign key references DateTimeSlots(DateTimings),
	NumberOfDose int Foreign key References VaccineDose(NumberOfDose) DEFAULT 0,
	Status NVARCHAR(50) Foreign key references StatusOfVaccine(Status) Default 'Not Done'
	);
	Drop table BookForVaccine
	insert into BookForVaccine(VaccineName,CityName,UserId,Name,MobileNumber,DateTimings) Values('Covxin','Bengaluru',1,'Rohit','1236547895','2024-01-27 1:30:00')
	select * from BookForVaccine

--Creat the Booking-Reg For family


--Optional Confirmed about vaccinated


