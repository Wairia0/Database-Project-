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
