
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

