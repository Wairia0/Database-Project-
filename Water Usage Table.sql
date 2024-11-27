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
