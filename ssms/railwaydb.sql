
DROP DATABASE IF EXISTS Railway_Facilities_DB;
CREATE DATABASE Railway_Facilities_DB;
GO
USE Railway_Facilities_DB;
GO


CREATE TABLE RailcardMaster (
    RailcardID CHAR(3) PRIMARY KEY,
    RailcardName VARCHAR(100),
    DiscountPercentage FLOAT
);


INSERT INTO RailcardMaster VALUES 
('RC1', 'Student Railcard', 30.0),
('RC2', 'Senior Railcard', 25.0),
('RC3', 'Family Railcard', 20.0);


INSERT INTO RailcardMaster (RailcardID, RailcardName, DiscountPercentage) VALUES ('RC4', 'Disabled', 10.0);
INSERT INTO RailcardMaster (RailcardID, RailcardName, DiscountPercentage) VALUES ('RC5', 'Senior', 10.0);


CREATE TABLE TicketClassMaster (
    ClassID CHAR(2) PRIMARY KEY,
    ClassName VARCHAR(50),
    Description VARCHAR(200)
);


INSERT INTO TicketClassMaster VALUES 
('C1', 'First Class', 'Premium service with extra facilities'),
('C2', 'Standard Class', 'Regular seating arrangement');

CREATE TABLE StationMetadata (
    StationCode VARCHAR(10) PRIMARY KEY,
    StationName VARCHAR(100),
    Region VARCHAR(50),
    Zone VARCHAR(20)
);


INSERT INTO StationMetadata VALUES 
('STN001', 'Flushing Station', 'Region A', 'Zone 1'),
('STN002', 'Midwood Station', 'Region B', 'Zone 2');


INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN101', 'London Kings Cross', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN102', 'Liverpool Lime Street', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN103', 'London Euston', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN104', 'York', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN105', 'Manchester Piccadilly', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN106', 'Birmingham New Street', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN107', 'London St Pancras', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN108', 'Oxford', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN109', 'Reading', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN110', 'Edinburgh Waverley', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN111', 'Bristol Temple Meads', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN112', 'Durham', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN113', 'Tamworth', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN114', 'London Waterloo', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN115', 'Sheffield', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN116', 'Wolverhampton', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN117', 'Leeds', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN118', 'Stafford', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN119', 'Doncaster', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN120', 'Swindon', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN121', 'Nottingham', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN122', 'Peterborough', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN123', 'Edinburgh', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN124', 'Crewe', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN125', 'Leicester', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN126', 'Nuneaton', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN127', 'Didcot', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN128', 'Coventry', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN129', 'Wakefield', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN130', 'Cardiff Central', 'Region X', 'Zone Y');
INSERT INTO StationMetadata (StationCode, StationName, Region, Zone) VALUES ('STN131', 'Warrington', 'Region X', 'Zone Y');


CREATE TABLE PaymentMethodMaster (
    PaymentMethodID CHAR(3) PRIMARY KEY,
    PaymentMethodName VARCHAR(50)
);


INSERT INTO PaymentMethodMaster VALUES 
('PM1', 'Credit Card'),
('PM2', 'Cash'),
('PM3', 'Mobile Payment');


INSERT INTO PaymentMethodMaster (PaymentMethodID, PaymentMethodName) VALUES ('PM4', 'Contactless');
INSERT INTO PaymentMethodMaster (PaymentMethodID, PaymentMethodName) VALUES ('PM6', 'Debit Card');


SELECT * FROM RailcardMaster;
SELECT * FROM TicketClassMaster;
SELECT * FROM StationMetadata;
SELECT * FROM PaymentMethodMaster;
