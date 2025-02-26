
--# Data Queries
--Retrieve the full names and dates of birth of all patients registered with the hospital

SELECT Full_Name, Date_of_Birth 
FROM Patients;

--Get the usernames and email addresses of patients who have provided both email and telephone number

SELECT Username, Email 
FROM Patients 
WHERE Email IS NOT NULL AND Phone IS NOT NULL;


SELECT Full_Name, Specialty 
FROM Doctors;

--Retrieve the names of all patients who have completed appointments with a doctor.

SELECT DISTINCT p.Full_Name
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
WHERE a.Status = 'completed';


--Get the medical record IDs and corresponding diagnoses for all patients
SELECT Medical_Record_ID, Diagnosis 
FROM Medical_Records;



--Retrieve appointment details for the Cardiology department in Q1 2024: 
SELECT Appointment_Date, Doctor_ID 
FROM Appointments a
JOIN Departments d ON a.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Cardiology' 
  AND Appointment_Date BETWEEN '2024-01-01' AND '2024-03-31';


  --
SELECT p.Full_Name 
FROM Patients p
JOIN Allergies a ON p.Patient_ID = a.Patient_ID
JOIN Appointments app ON p.Patient_ID = app.Patient_ID
JOIN Doctors d ON app.Doctor_ID = d.Doctor_ID
WHERE a.Allergy_Name = 'Penicillin' AND d.Specialty = 'Dermatologist';



--
SELECT Medical_Record_ID
FROM Medical_Records m
JOIN Patients p ON m.Patient_ID = p.Patient_ID
WHERE m.Diagnosis = 'Diabetes Type 2' 
  AND DATEDIFF(YEAR, p.Date_of_Birth, GETDATE()) > 50;


--
SELECT DISTINCT p.Full_Name
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
JOIN Doctors d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Status = 'completed' 
  AND (d.Specialty = 'Pediatrician' OR d.Specialty = 'Gynecologist');


  --
SELECT p.Username, p.Email
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
WHERE DATEPART(WEEKDAY, a.Appointment_Date) BETWEEN 2 AND 6  -- Monday to Friday
  AND DATEPART(HOUR, a.Appointment_Date) >= 15;


  --
SELECT p.Full_Name, a.Appointment_Date
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
ORDER BY p.Full_Name;


--
SELECT Appointment_Date
FROM Appointments
ORDER BY Appointment_Date DESC;


--
SELECT Full_Name
FROM Doctors
ORDER BY Specialty;

--
SELECT p.Patient_ID, a.Appointment_Date
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
ORDER BY p.Patient_ID;

--SELECT p.Full_Name
--
SELECT p.Full_Name
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
WHERE a.Status = 'completed'
ORDER BY p.Address;


--Retrieve distinct doctor specialties available at the hospital
SELECT DISTINCT Specialty
FROM Doctors;

--Get distinct appointment dates for all scheduled appointments
SELECT DISTINCT Appointment_Date
FROM Appointments;


--Fetch distinct patient IDs for patients who have appointments scheduled in the 'Neurology' department

SELECT DISTINCT p.Patient_ID
FROM Patients p
JOIN Appointments a ON p.Patient_ID = a.Patient_ID
JOIN Departments d ON a.Department_ID = d.Department_ID
WHERE d.Department_Name = 'Neurology';

--Retrieve distinct medicine names prescribed in the medical records

SELECT DISTINCT Prescription
FROM Medical_Records;

--Get distinct appointment statuses for all appointments

SELECT DISTINCT Status
FROM Appointments;



SELECT DISTINCT Specialty 
FROM Doctors;



SELECT Full_Name, Appointment_Date
FROM Patients
JOIN Appointments ON Patients.Patient_ID = Appointments.Patient_ID
ORDER BY Full_Name;
