-- Create the database
CREATE DATABASE WaterAccessManagement;

-- Table for users
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_Name VARCHAR(50) NOT NULL, 
    location VARCHAR(100),
    population INT, 
    phone_No VARCHAR(10) 
);

-- Table for Waterpoints
CREATE TABLE Waterpoints (
    waterpoint_id INT PRIMARY KEY,
    waterpoint_name VARCHAR(50) NOT NULL, 
    location VARCHAR(100),
    capacity INT,
    type VARCHAR(50) 
);

-- Table for MaintenanceSchedule
CREATE TABLE MaintenanceSchedule(
    maintenance_id INT PRIMARY KEY,
    waterpoint_id INT,
    maintenance_date DATE,
    staff_id INT, 
    schedule_date VARCHAR(255), 
    maintenance_type VARCHAR(50) CHECK (maintenance_type IN ('replacement', 'repair')),
    FOREIGN KEY (waterpoint_id) REFERENCES Waterpoints(waterpoint_id) ON DELETE CASCADE
);

-- Table for WaterQualityMonitoring
CREATE TABLE WaterQualityMonitoring (
    monitering_id INT PRIMARY KEY, 
    waterpoint_id INT,
    monitoring_date DATE,
    staff_id INT, 
    contaminated VARCHAR(50) CHECK (contaminated IN ('yes', 'no')),
	FOREIGN KEY ( waterpoint_id) REFERENCES Waterpoints(waterpoint_id) ON DELETE CASCADE
);
-- Table for staff
CREATE TABLE staff (
   staff_id INT PRIMARY KEY,
   F_Name VARCHAR(255),
   L_Name VARCHAR(255),
   phone_No VARCHAR(10) 
);
-- Table for WaterUsageRecords
CREATE TABLE WaterUsageRecords (
   usage_id INT PRIMARY KEY,
   usage_amount INT,
   usage_date DATE,
   waterpoint_id INT,
   FOREIGN KEY ( waterpoint_id) REFERENCES Waterpoints(waterpoint_id) ON DELETE CASCADE
);   