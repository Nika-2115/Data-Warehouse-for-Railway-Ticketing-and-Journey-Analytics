
DROP DATABASE IF EXISTS Railway_DW_;
CREATE DATABASE Railway_DW_;
GO
USE Railway_DW_;
GO

CREATE TABLE DW_Dim_Date1_ (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Month INT NOT NULL,
    Day INT NOT NULL,
    DayOfWeek VARCHAR(10) NOT NULL
);


CREATE TABLE DW_Dim_Station1_ (
    StationKey INT IDENTITY(1,1) PRIMARY KEY,
    StationCode VARCHAR(100) NOT NULL,
    StationName NVARCHAR(255) NOT NULL,
    Region VARCHAR(50),
    Zone VARCHAR(20)
);


CREATE TABLE DW_Dim_Ticket1_ (
    TicketKey INT IDENTITY(1,1) PRIMARY KEY,
    TicketType VARCHAR(50) NOT NULL,
    TicketClass VARCHAR(50) NOT NULL,
    Railcard VARCHAR(100) NOT NULL,
    DiscountPercentage FLOAT
);
ALTER TABLE DW_Dim_Ticket1_
ALTER COLUMN Railcard VARCHAR(100) NULL;

ALTER TABLE DW_Dim_Ticket1_
ALTER COLUMN TicketType VARCHAR(100);


CREATE TABLE DW_Dim_Payment1_ (
    PaymentKey INT IDENTITY(1,1) PRIMARY KEY,
    PurchaseType NVARCHAR(50) NOT NULL,      
    PaymentMethod NVARCHAR(50) NOT NULL
);


CREATE TABLE DW_Fact_Journey1_ (
    FactID INT IDENTITY(1,1) PRIMARY KEY,
    PurchaseDateKey INT NOT NULL,
    JourneyDateKey INT NOT NULL,
    DepartureStationKey INT NOT NULL,
    ArrivalStationKey INT NOT NULL,
    TicketKey INT NOT NULL,
    PaymentKey INT NOT NULL,
    Price FLOAT NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalTime TIME NOT NULL,
    ActualArrivalTime TIME,
    JourneyStatus VARCHAR(50) NOT NULL,
    RefundRequest VARCHAR(10) NOT NULL,
    FOREIGN KEY (PurchaseDateKey) REFERENCES DW_Dim_Date1_(DateKey),
    FOREIGN KEY (JourneyDateKey) REFERENCES DW_Dim_Date1_(DateKey),
    FOREIGN KEY (DepartureStationKey) REFERENCES DW_Dim_Station1_(StationKey),
    FOREIGN KEY (ArrivalStationKey) REFERENCES DW_Dim_Station1_(StationKey),
    FOREIGN KEY (TicketKey) REFERENCES DW_Dim_Ticket1_(TicketKey),
    FOREIGN KEY (PaymentKey) REFERENCES DW_Dim_Payment1_(PaymentKey)
);
select * from DW_Dim_Payment1_
select * from DW_Dim_Station1_
select * from DW_Dim_Ticket1_
select * from DW_Dim_Date1_
select * from DW_Fact_Journey1_
ALTER TABLE DW_Dim_Date1_
ALTER COLUMN FullDate DATETIME;






-- Fix StationCode length to prevent truncation
ALTER TABLE DW_Dim_Station1_
ALTER COLUMN StationCode VARCHAR(100);

-- Fix TicketType length if necessary
ALTER TABLE DW_Dim_Ticket1_
ALTER COLUMN TicketType VARCHAR(100);

-- Allow NULLs in Railcard
ALTER TABLE DW_Dim_Ticket1_
ALTER COLUMN Railcard VARCHAR(100) NULL;

-- Ensure ActualArrivalTime is nullable
ALTER TABLE DW_Fact_Journey1_
ALTER COLUMN ActualArrivalTime TIME NULL;



















-- Date Dimension
INSERT INTO DW_Dim_Date1_ (FullDate, Year, Month, Day, DayOfWeek)
SELECT DISTINCT
    [Date of Purchase],
    YEAR([Date of Purchase]),
    MONTH([Date of Purchase]),
    DAY([Date of Purchase]),
    DATENAME(WEEKDAY, [Date of Purchase])
FROM external_source.dbo.[Sheet1$]
WHERE [Date of Purchase] IS NOT NULL

UNION

SELECT DISTINCT
    [Date of Journey],
    YEAR([Date of Journey]),
    MONTH([Date of Journey]),
    DAY([Date of Journey]),
    DATENAME(WEEKDAY, [Date of Journey])
FROM external_source.dbo.[Sheet1$]
WHERE [Date of Journey] IS NOT NULL;

-- Station Dimension
INSERT INTO DW_Dim_Station1_ (StationCode, StationName)
SELECT DISTINCT [Departure Station], [Departure Station]
FROM external_source.dbo.[Sheet1$]
WHERE [Departure Station] IS NOT NULL

UNION

SELECT DISTINCT [Arrival Destination], [Arrival Destination]
FROM external_source.dbo.[Sheet1$]
WHERE [Arrival Destination] IS NOT NULL;

-- Ticket Dimension
INSERT INTO DW_Dim_Ticket1_ (TicketType, TicketClass, Railcard)
SELECT DISTINCT 
    [Ticket Type], 
    [Ticket Class], 
    Railcard
FROM external_source.dbo.[Sheet1$];

-- Payment Dimension
INSERT INTO DW_Dim_Payment1_ (PurchaseType, PaymentMethod)
SELECT DISTINCT 
    [Purchase Type], 
    [Payment Method]
FROM external_source.dbo.[Sheet1$];
INSERT INTO DW_Fact_Journey1_ (
    PurchaseDateKey, JourneyDateKey,
    DepartureStationKey, ArrivalStationKey,
    TicketKey, PaymentKey, Price,
    DepartureTime, ArrivalTime, ActualArrivalTime,
    JourneyStatus, RefundRequest
)
SELECT
    pd.DateKey,
    jd.DateKey,
    ds.StationKey,
    asn.StationKey,
    tk.TicketKey,
    pm.PaymentKey,
    s.Price,
    s.[Departure Time],
    s.[Arrival Time],
    s.[Actual Arrival Time],
    s.[Journey Status],
    s.[Refund Request]
FROM external_source.dbo.[Sheet1$] s
JOIN DW_Dim_Date1_ pd ON pd.FullDate = s.[Date of Purchase]
JOIN DW_Dim_Date1_ jd ON jd.FullDate = s.[Date of Journey]
JOIN DW_Dim_Station1_ ds ON ds.StationCode = s.[Departure Station]
JOIN DW_Dim_Station1_ asn ON asn.StationCode = s.[Arrival Destination]
JOIN DW_Dim_Ticket1_ tk 
    ON tk.TicketType = s.[Ticket Type]
   AND tk.TicketClass = s.[Ticket Class]
   AND (tk.Railcard = s.Railcard OR (tk.Railcard IS NULL AND s.Railcard IS NULL))
JOIN DW_Dim_Payment1_ pm 
    ON pm.PurchaseType = s.[Purchase Type]
   AND pm.PaymentMethod = s.[Payment Method];
select * from DW_Fact_Journey1_


select * from DW_Dim_Date1_
select * from DW_Dim_Payment1_
Select  * from DW_Dim_Station1_
select * from DW_Dim_Ticket1_

SELECT DISTINCT TicketClass, TicketType FROM DW_Dim_Ticket1_;
