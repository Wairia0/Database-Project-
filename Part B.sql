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