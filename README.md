
# Avenue Hospital Database System Design, Creation, and Implementation. 

## Introduction

As the Data Analyst consultant for Avenue Hospital, my role was to design, create, and implement a robust database system tailored to the healthcare industry's specific needs. The objective was to develop a system capable of efficiently managing patient **registrations, appointments, medical records, and doctor-patient interactions while ensuring data integrity, security, and scalability.** The goal was to provide an organized and structured approach to storing and retrieving healthcare-related data in a manner that supports daily hospital operations.

The system also had to meet the client’s detailed requirements, which ranged from patient registration and medical record management to appointment scheduling and feedback handling. The need for normalization (3NF), high availability, and ease of use for hospital staff guided the design process.

# Hospital Requirements Breakdown
## The client outlined the following key requirements:
1. **Patient Registration:** Patients need to be able to register with essential personal information and optional contact details.
2. **Appointment Booking:** Patients should be able to book appointments through a portal, checking for doctor availability.
3. **Appointment Details Storage:** Appointments should include the date, time, department, status, and assigned doctor.
4. **Medical Record Updates:** Doctors should be able to review and update patient medical records during appointments.
5. **Patient Feedback:** Patients can provide feedback after appointments.
6. **Cancelled Appointments:** Cancelled appointments should require rebooking.
7. **Patient Data Retention:** Patient data should be retained even after they leave the hospital system, with their exit date recorded.

# Objective
The objective of this project was to design a database that not only meets these client requirements but also follows best practices in database normalization and integrity. The solution would be implemented using Microsoft SQL Server, utilizing T-SQL for database design, table creation, and querying.

# Design & Implementation
## Database Design and Normalization
The first step in the implementation was to design a normalized relational database structure to ensure that all data is logically organized and minimizes redundancy. The design was done up to the Third Normal Form (3NF), where each table stores data about a single entity, and all attributes depend on the primary key.

## Entities in the System;
1. **Patients** - Stores information such as personal details, medical records, and appointment history.
2. **Doctors** - Includes doctor details, including specialties.
3. **Appointments** - Tracks appointment dates, times, statuses, and the doctor assigned.
4. **Medical Records** - Contains diagnoses, prescriptions, and medical history.
5. **Departments** - A reference table for hospital departments such as Cardiology, Neurology, etc.
6. **Allergies** - Keeps records of patients allergies.
7. **Feedback**  - Keep track of responses from the patients. 
   
## Justification for Design Decisions
-  **Normalization to 3NF** - Each table was designed to eliminate redundancy and ensure that data is stored most efficiently.
-  **Primary and Foreign Keys** - To maintain referential integrity, each table contains primary keys (e.g., Patient_ID, Doctor_ID) and foreign keys that link related tables (e.g., Doctor_ID in the Appointments table).
-  **Constraints** - Constraints were implemented to ensure data validity, such as ensuring that appointments cannot be scheduled for past dates or that a patient cannot be re-registered with the same username.

Table Creation
Once the design was finalized, I created the necessary tables using T-SQL, ensuring that each table was properly normalized and that primary and foreign keys were correctly implemented. I also added constraints to ensure data integrity.

**Patients Table**
```
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
```

**Departments Table**
```
CREATE TABLE Departments (
    Department_ID INT PRIMARY KEY IDENTITY,
    Department_Name VARCHAR(100) NOT NULL
);
```

**Create Doctors Table**
```
CREATE TABLE Doctors (
    Doctor_ID INT PRIMARY KEY IDENTITY,
    Full_Name VARCHAR(255) NOT NULL,
    Specialty VARCHAR(100) NOT NULL,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Departments(Department_ID)
);
```

**Appointments Table**
```
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
    CONSTRAINT chk_appointment_status
    CHECK (Status IN ('pending', 'cancelled', 'completed')
);
```

**Medical Records Table**
```
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
```

**Feedback Table**
```
CREATE TABLE Feedback (
    Feedback_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Appointment_ID INT,
    Feedback_Text TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Appointment_ID) REFERENCES Appointments(Appointment_ID)
);
```

**Allergies Table**
```
CREATE TABLE Allergies (
    Allergy_ID INT PRIMARY KEY IDENTITY,
    Patient_ID INT,
    Allergy_Name VARCHAR(100),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);
```




**Insert Records into Departments Table**
```
INSERT INTO Departments (Department_Name) 
VALUES 
	('Cardiology'), 
	('Neurology'), 
	('Dermatology'),
	('Pediatrics'),
	('Gynecology')
;
```

**Insert Records into Doctors Table**
```
INSERT INTO Doctors (Full_Name, Specialty, Department_ID) 
VALUES 
	('Dr. John Smith', 'Cardiologist', 1), 
	('Dr. Jane Doe', 'Neurologist', 2), 
	('Dr. Emily White', 'Dermatologist', 3),
	('Dr. Michael Brown', 'Pediatrician', 4),
	('Dr. Olivia Green', 'Gynecologist', 5),
	('Dr. Sarah Black', 'Cardiologist', 1),
	('Dr. Jacob Taylor', 'Neurologist', 2),
	('Dr. Anna Wilson', 'Dermatologist', 3),
	('Dr. Ethan Scott', 'Pediatrician', 4),
	('Dr. Lily Harris', 'Gynecologist', 5)
;
```


 **Insert Records into Patient Table**
 ```
INSERT INTO Patients (Full_Name, Address, Date_of_Birth, Insurance_Info, Username, Password, Exit_Date) 
VALUES 
	('Michael Johnson', '123 Elm St, City A', '1985-06-15', 'ABC Insurance', 'mjohnson', 'password123', NULL),
	('Sarah Lee', '456 Maple Ave, City B', '1990-03-22', 'XYZ Insurance', 'slee', 'mypassword456', NULL),
	('Emily Davis', '789 Oak Dr, City C', '1978-12-05', 'ABC Insurance', 'edavis', 'securepassword789', '2024-01-20'),
	('James Williams', '321 Pine Rd, City A', '1982-07-10', 'XYZ Insurance', 'jwilliams', 'password321', NULL),
	('Lily Adams', '654 Birch Ln, City B', '1993-04-18', 'ABC Insurance', 'ladams', 'mypassword654', '2024-01-25'),
	('Chris Martinez', '987 Cedar Blvd, City C', '1988-09-30', 'XYZ Insurance', 'cmartinez', 'strongpass123', NULL),
	('Olivia Clark', '543 Willow St, City A', '1996-06-15', 'ABC Insurance', 'oclark', 'secure1234', NULL),
	('Daniel Thompson', '852 Maple Ave, City B', '1980-02-10', 'XYZ Insurance', 'dthompson', 'password852', '2024-02-15'),
	('Sophia Taylor', '369 Birch Dr, City C', '1992-08-05', 'ABC Insurance', 'staylor', 'mypassword369', NULL),
	('Lucas Hernandez', '741 Pine St, City A', '1984-11-25', 'XYZ Insurance', 'lhernandez', 'mypassword741', '2024-02-10'),
	('Mason White', '159 Oak St, City C', '1995-05-20', 'ABC Insurance', 'mwhite', 'password159', NULL),
	('Ava Robinson', '753 Cedar Rd, City B', '1983-01-10', 'XYZ Insurance', 'arobinson', 'securepass753', NULL),
	('Ella King', '456 Maple Blvd, City C', '1986-10-08', 'ABC Insurance', 'eking', 'password456', NULL),
	('Isabella Garcia', '321 Elm Ave, City A', '1997-04-02', 'XYZ Insurance', 'igarcia', 'mypassword321', '2024-01-15'),
	('Zoe Nelson', '258 Pine Blvd, City B', '1994-07-29', 'ABC Insurance', 'znelson', 'securepassword258', NULL),
	('Mia Carter', '987 Birch St, City C', '1989-06-12', 'XYZ Insurance', 'mcarter', 'strongpass987', NULL),
	('William Allen', '753 Cedar Ave, City A', '1991-03-18', 'ABC Insurance', 'wallen', 'password753', NULL),
	('Jack Harris', '159 Oak Blvd, City B', '1990-11-13', 'XYZ Insurance', 'jharris', 'mypassword159', NULL),
	('Amelia Young', '369 Pine Ave, City C', '1987-09-02', 'ABC Insurance', 'ayoung', 'securepass369', NULL),
	('Harper Martinez', '741 Maple Blvd, City A', '1998-05-15', 'XYZ Insurance', 'hmartinez', 'mypassword741', NULL);
;
```



**Insert Records into Appointments Table**
```
INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Status, Department_ID) 
VALUES 
	(1, 1, '2024-02-25 10:00:00', 'pending', 1),
	(2, 2, '2024-03-10 14:30:00', 'completed', 2),
	(3, 3, '2024-03-15 09:00:00', 'completed', 3),
	(4, 4, '2024-03-20 11:00:00', 'pending', 4),
	(5, 5, '2024-04-02 13:00:00', 'pending', 5),
	(6, 6, '2024-04-05 15:00:00', 'completed', 1),
	(7, 7, '2024-04-12 10:30:00', 'pending', 2),
	(8, 8, '2024-04-17 14:00:00', 'completed', 3),
	(9, 9, '2024-04-21 11:30:00', 'completed', 4),
	(10, 10, '2024-04-25 09:45:00', 'pending', 5),
	(11, 1, '2024-05-01 16:00:00', 'pending', 1),
	(12, 2, '2024-05-05 12:30:00', 'pending', 2),
	(13, 3, '2024-05-08 10:00:00', 'completed', 3),
	(14, 4, '2024-05-12 14:30:00', 'completed', 4),
	(15, 5, '2024-05-15 11:15:00', 'pending', 5),
	(16, 6, '2024-05-18 15:45:00', 'pending', 1),
	(17, 7, '2024-05-21 13:30:00', 'completed', 2),
	(18, 8, '2024-05-25 09:00:00', 'pending', 3),
	(19, 9, '2024-06-01 11:30:00', 'completed', 4),
	(20, 10, '2024-06-05 14:00:00', 'pending', 5)
;
```


**Insert Records into Medical Records Table**
```
INSERT INTO Medical_Records (Patient_ID, Diagnosis, Prescription, Doctor_ID, Appointment_ID) 
VALUES 
	(1, 'Hypertension', 'Atenolol 50mg', 1, 1),
	(2, 'Migraine', 'Sumatriptan 50mg', 2, 2),
	(3, 'Psoriasis', 'Topical Steroid Cream', 3, 3),
	(4, 'Asthma', 'Albuterol Inhaler', 4, 4),
	(5, 'Endometriosis', 'Ibuprofen 400mg', 5, 5),
	(6, 'Hyperlipidemia', 'Atorvastatin 20mg', 6, 6),
	(7, 'Multiple Sclerosis', 'Ocrelizumab', 7, 7),
	(8, 'Acne', 'Clindamycin Gel', 8, 8),
	(9, 'Pneumonia', 'Amoxicillin 500mg', 9, 9),
	(10, 'Pregnancy', 'Prenatal Vitamins', 10, 10),
	(11, 'Coronary Artery Disease', 'Aspirin 81mg', 1, 11),
	(12, 'Epilepsy', 'Valproic Acid 500mg', 2, 12),
	(13, 'Eczema', 'Hydrocortisone Cream', 3, 13),
	(14, 'Bronchitis', 'Azithromycin 250mg', 4, 14),
	(15, 'Cervical Dysplasia', 'Pap Smear', 5, 15),
	(16, 'Diabetes Type 2', 'Metformin 500mg', 6, 16),
	(17, 'Parkinson S Disease', 'Carbidopa-levodopa', 7, 17),
	(18, 'Rosacea', 'Topical Metronidazole', 8, 18),
	(19, 'Tuberculosis', 'Rifampin 10mg', 9, 19),
	(20, 'Gestational Diabetes', 'Insulin Therapy', 10, 20)
	;
```

**Insert Records into Feedback Table**
```
INSERT INTO Feedback (Patient_ID, Appointment_ID, Feedback_Text)
VALUES 
	(1, 1, 'Excellent care, very thorough.'),
	(2, 2, 'Great experience, would recommend!'),
	(3, 3, 'The doctor was helpful, and the treatment is working well.'),
	(4, 4, 'Friendly and attentive staff.'),
	(5, 5, 'Doctor took the time to explain everything clearly.'),
	(6, 6, 'Highly satisfied with the treatment.'),
	(7, 7, 'Appointment was on time and the doctor was great.'),
	(8, 8, 'Great service, very professional.'),
	(9, 9, 'Good appointment, the doctor was very knowledgeable.'),
	(10, 10, 'Satisfied with my visit.'),
	(11, 11, 'Doctor was very helpful, and I feel better now.'),
	(12, 12, 'Appointment was quick and effective.'),
	(13, 13, 'Good experience overall, I would come again.'),
	(14, 14, 'Very satisfied with the treatment I received.'),
	(15, 15, 'The doctor listened to all my concerns.'),
	(16, 16, 'Good care, would recommend to others.'),
	(17, 17, 'Very professional, I trust this doctor.'),
	(18, 18, 'Very pleased with the appointment.'),
	(19, 19, 'Appointment went smoothly, would come again.'),
	(20, 20, 'Excellent care, staff was friendly.')
;
```


**Insert Records into Allergies Table**
```
INSERT INTO Allergies (Patient_ID, Allergy_Name)
VALUES 
	(1, 'Penicillin'),
	(2, 'Peanuts'),
	(3, 'Aspirin'),
	(4, 'Latex'),
	(5, 'Shellfish'),
	(6, 'Milk'),
	(7, 'Soy'),
	(8, 'Pollen'),
	(9, 'Dust'),
	(10, 'Bee Stings'),
	(11, 'Mold'),
	(12, 'Wheat'),
	(13, 'Eggs'),
	(14, 'Nickel'),
	(15, 'Cats'),
	(16, 'Dogs'),
	(17, 'Perfume'),
	(18, 'Chocolate'),
	(19, 'Fish'),
	(20, 'Tree Nuts')
;
```

# Data Queries
## To meet the client’s requirements, I implemented a series of SQL queries for data retrieval and manipulation. Below are some of the queries of how the data could be queried to meet specific needs;

## 1. Retrieve the full names and dates of birth of all patients registered with the hospital 
```
SELECT Full_Name, Date_of_Birth 
FROM Patients;
```
![image](https://github.com/user-attachments/assets/6a724fe3-436b-4add-805c-fa51846448d3)

**2. Get the usernames and email addresses of patients who have provided both email and telephone numbers**

```
SELECT Username, Email 
FROM Patients 
WHERE Email IS NOT NULL AND Phone IS NOT NULL;
```
![image](https://github.com/user-attachments/assets/5b1e6f67-e000-46cb-aa01-15313a4aa221)

**3. Fetch doctors’ names and specialties**
```
SELECT Full_Name, Specialty 
FROM Doctors;
```
![image](https://github.com/user-attachments/assets/112b86f3-d709-4fe9-a810-01529f80eab6)


**4. Retrieve the names of all patients who have completed appointments with a doctor**
```
SELECT DISTINCT p.Full_Name
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
WHERE a.Status = 'completed';
```

![image](https://github.com/user-attachments/assets/4f4e7233-5a0a-446e-a156-a3647e08a0c8)

**5. Get the medical record IDs and corresponding diagnoses for all patients**

```
SELECT Medical_Record_ID, Diagnosis 
FROM Medical_Records;
```
![image](https://github.com/user-attachments/assets/618eafd8-57cd-437d-9d98-97196b1e3c74)

**6. Retrieve appointment details for the Cardiology department in Q1 2024**
```
SELECT Appointment_Date, Doctor_ID 
FROM Appointments a
JOIN Departments d ON a.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Cardiology' 
  AND Appointment_Date BETWEEN '2024-01-01' AND '2024-03-31';
```

![image](https://github.com/user-attachments/assets/09a2f5a4-0016-4e16-95e5-9f04d647636a)


**7. Get patient names who have completed appointments with a Pediatric or Gynecology doctor**
```
SELECT DISTINCT p.Full_Name
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
JOIN Doctors d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Status = 'completed' 
  AND (d.Specialty = 'Pediatrician' OR d.Specialty = 'Gynecologist');
```


# Sorting
## Retrieving distinct data or sorting records.

**Distinct doctor specialties available at the hospital**
```
SELECT DISTINCT Specialty 
FROM Doctors;
```

![image](https://github.com/user-attachments/assets/70411403-f1f1-43c6-80fb-1f5d88625f6d)




**Sort patient names alphabetically**

```
SELECT Full_Name, Appointment_Date
FROM Patients
JOIN Appointments ON Patients.Patient_ID = Appointments.Patient_ID
ORDER BY Full_Name;
```

![image](https://github.com/user-attachments/assets/dff93ab1-4590-478a-a7e0-89b0bedf8a72)



# Challenges and Solutions
-  Handling Cancellations and Rebooking: The system needed to account for canceled appointments and allow rebooking. A solution was implemented where the appointment status would be marked as "Cancelled," and a new entry would be created for the rebooked appointment.

-  Data Retention: Ensuring patient data retention after they leave the system was a challenge. I implemented an "Exit_Date" field in the Patient table, allowing us to track when a patient exits the system while preserving their data.

-  Optimizing Query Performance: As the dataset grew, I ensured that indexes were created on commonly queried fields such as Patient_ID and Doctor_ID to enhance query performance.

# Conclusion
-  This database system was designed to meet the comprehensive requirements of Avenue Hospital, focusing on data integrity, ease of use, and scalability. Through thoughtful database design, normalization to 3NF, and robust T-SQL queries, I was able to provide a solution that handles patient data, appointments, and doctor-patient interactions efficiently. This project has provided me with valuable experience in database design, implementation, and optimization within the healthcare domain.







































































