CREATE TABLE Waterpoints (
    waterpointId INT PRIMARY KEY,
    waterpointName VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    type VARCHAR(50) NOT NULL
);

INSERT INTO Waterpoints (waterpointId,waterpointName,location,capacity,type)
VALUES(4566576, 'Everest', 'Westlands', 453, 'borehole'),
      (55378987, 'RTF', 'Kasarani', 789, 'tap'),
      (6256237, 'JHG', 'Karen', 65, 'dam'),
      (977467, 'DSE', 'Embakasi', 576, 'borehole'),
      (6325756, 'DFT', 'Langata', 567, 'dam');
SELECT * FROM Waterpoints;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_Name VARCHAR(50) NOT NULL, 
    population INT, 
    WaterpointId INT NOT NULL,
    FOREIGN KEY(waterpointId)REFERENCES Waterpoints(WaterpointId)
);

INSERT INTO Users (user_id, user_Name,population,WaterpointId)
VALUES(6325756, 'Ann', 567, 4566576),
      (783878, 'Agnes', 454,55378987),
      (6325757, 'Ben', 567, 6256237),
      (6325758, 'Emily', 567,977467 ),
      (6325759, 'William',567,6325756 );
SELECT * FROM Users;

CREATE TABLE UserPhoneNumber (
    user_id INT,
    u_phoneNo VARCHAR(15) PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO UserPhoneNumber(user_id, u_phoneNo)
VALUES(6325756,0789453458 ),
      (783878,0786345323 ),
      (6325757,0761123764),
      (6325758, 0768543786),
      (6325759,0712764534 );
SELECT * FROM UserPhoneNumber;


CREATE TABLE Staff (
   staff_id INT PRIMARY KEY,
   F_Name VARCHAR(255),
   L_Name VARCHAR(255)
   );
   
INSERT INTO staff (staff_id,F_Name,L_Name)
VALUES(185634, 'Ben', 'Otieno' ),
      (90865, 'Ann', 'Wanjiku'),
      (45387, 'Agnes', 'Maina'),
      (549312, 'William', 'Njenga'),
      (185635, 'Emily', 'Wambui');

SELECT * FROM Staff;

CREATE TABLE StaffPhoneNumber (
    staff_id INT,
    s_phoneNo VARCHAR(15) PRIMARY KEY,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

INSERT INTO StaffPhoneNumber (staff_id,s_phoneNo)
VALUES(185634, 0789124365),
      (90865,0745142546 ),
      (45387,0745663345),
      (549312, 0789236559),
      (185635,0789432556);

SELECT * FROM StaffPhoneNumber;

    CREATE TABLE MaintenanceSchedule (
    maintenanceId INT PRIMARY KEY,
    staff_id INT NOT NULL,
    maintenanceDate DATE NOT NULL,
    maintenanceType VARCHAR(50) NOT NULL,
    waterpointId INT NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (waterpointId) REFERENCES Waterpoints(waterpointId)
);

INSERT INTO MaintenanceSchedule (maintenanceId, staff_id, maintenanceDate, maintenanceType, waterpointId)
VALUES
    (4554367, 185634 , '2023-11-03', 'replacement' ,4566576),
    (674864, 90865 , '2023-11-05', 'repair',55378987),
    (735671, 45387, '2023-11-04','repair', 6256237),
    (625327, 549312 , '2023-11-10', 'replacement',977467),
    (626781, 185634, '2023-11-01', 'repair',6325756);
SELECT * FROM MaintenanceSchedule;

CREATE TABLE WaterQualityMonitoring (
    monitoringId INT PRIMARY KEY,
    monitoringDate DATE NOT NULL,
    staff_id INT NOT NULL,
    waterpointId INT NOT NULL,
    contaminated BOOLEAN NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (waterpointId) REFERENCES Waterpoints(waterpointId)
);

INSERT INTO WaterQualityMonitoring (monitoringId,  monitoringDate, staff_id,waterpointId, contaminated)
 VALUES (626781, '2023-11-01', 185634,6325756, FALSE),
  (5478, '2023-11-15', 90865,55378987, FALSE),
   (6543, '2023-11-24', 45387,6256237, TRUE),
    (54290,'2023-11-20', 549312,977467, TRUE),
     (89435, '2023-11-11', 185634, 6325756, FALSE); 

SELECT * FROM WaterQualityMonitoring;

CREATE TABLE WaterUsageRecords (
    usageId INT PRIMARY KEY,
    usageAmount INT NOT NULL,
    usageDate DATE NOT NULL,
    waterpointId INT NOT NULL,
    FOREIGN KEY (waterpointId) REFERENCES Waterpoints(waterpointId)
);


INSERT INTO WaterUsageRecords(usageId, usageAmount, usageDate, waterpointId)
VALUES(467387, 5000, '2023-10-13', 4566576),
      (83767, 10000, '2023-10-23', 55378987),
      (906524, 15000, '2023-10-15', 6256237),
      (56433, 9000, '2023-10-14', 977467),
      (890435, 4000, '2023-10-17', 6325756);
SELECT * FROM WaterUsageRecords;


ALTER TABLE Waterpoints
ADD Population INT;

SELECT usageId, usageAmount
FROM WaterUsageRecords
ORDER BY usageAmount DESC;

ALTER TABLE MaintenanceSchedule
ADD ScheduleDate DATE;

SELECT * FROM MaintenanceSchedule;

UPDATE MaintenanceSchedule
SET ScheduleDate='2023-11-02'
WHERE maintenanceId= 4554367;

UPDATE MaintenanceSchedule
SET ScheduleDate='2023-11-05'
WHERE maintenanceId= 674864;

UPDATE MaintenanceSchedule
SET ScheduleDate='2023-11-06'
WHERE maintenanceId= 735671;

UPDATE MaintenanceSchedule
SET ScheduleDate='2023-11-09'
WHERE maintenanceId= 625327;

UPDATE MaintenanceSchedule
SET ScheduleDate='2023-11-01'
WHERE maintenanceId= 626781;

SELECT * FROM MaintenanceSchedule;
--Join Staff and StaffPhoneNumber Tables
SELECT s.staff_id,s.F_Name,s.L_Name,sp.s_phoneNo
FROM Staff s
JOIN StaffPhoneNumber sp ON s.staff_id=sp.staff_id;
--Join User and UserPhoneNumber Tables
SELECT u.user_id,u.user_Name,up.u_phoneNo
FROM Users u
JOIN UserPhoneNumber up ON u.user_id=up.user_id;
--Deletiing
DELETE FROM MaintenanceSchedule
WHERE maintenanceId = 4554367;

SELECT SUM(usageAmount) AS MonthlyUsageAmount
FROM WaterUsageRecords
WHERE usageDate BETWEEN '2023-10-01' AND '2023-10-31';

--Selection
SELECT *
FROM Waterpoints
WHERE capacity>550;
--Union
SELECT staff_id
FROM Staff
UNION
SELECT staff_id
FROM StaffPhoneNumber;
--Intersection
SELECT user_id
FROM Users
INTERSECT
SELECT user_id
FROM UserPhoneNumber;
--First name of staff starts with A
SELECT staff_id,F_Name
FROM Staff
WHERE F_Name LIKE '%A%';