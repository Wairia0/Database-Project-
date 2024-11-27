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