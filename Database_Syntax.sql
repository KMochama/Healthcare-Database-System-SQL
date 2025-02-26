--Create Database AvenueHospital
CREATE DATABASE AvenueHospital;

-- Create Departments Table
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY IDENTITY,
    Department_Name VARCHAR(100) NOT NULL
);

-- Create Doctors Table
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY IDENTITY,
    Full_Name VARCHAR(255) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);

-- Create Patients Table
CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY IDENTITY,
    Full_Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Date_of_Birth DATE,
    Insurance_Info VARCHAR(255),
    Username VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Exit_Date DATE
);

-- Create Appointments Table
CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATETIME NOT NULL,
    Status VARCHAR(50),
    Department_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID),
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);
ALTER TABLE Appointments
ADD CONSTRAINT chk_appointment_status
CHECK (Status IN ('pending', 'cancelled', 'completed'));

-- Create Medical Records Table
CREATE TABLE Medical_Records (
    Medical_Record_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Diagnosis VARCHAR(255),
    Prescription VARCHAR(255),
    Doctor_ID INT,
    Appointment_ID INT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);
-- Create Feedback Table
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Appointment_ID INT,
    Feedback_Text TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);

-- Create Allergies Table
CREATE TABLE Allergies (
    Allergy_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Allergy_Name VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- Insert Records into Departments Table
INSERT INTO Departments (Department_Name) 
VALUES 
	('Cardiology'), 
	('Neurology'), 
	('Dermatology'),
	('Pediatrics'),
	('Gynecology')
;
