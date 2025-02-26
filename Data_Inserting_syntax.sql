
-- Insert Records into Doctors Table
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

SELECT * FROM Doctors;

 -- Insert Records into Patient Table
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


SELECT * FROM  Patients

-- Insert Records into Appointments Table
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

SELECT * FROM Appointments

-- Insert Records into Medical Records Table
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

SELECT * FROM Medical_Records

-- Insert Records into Feedback Table
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

SELECT * FROM Feedback

-- Insert Records into Allergies Table
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

SELECT * FROM Allergies

