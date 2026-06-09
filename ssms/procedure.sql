USE Railway_DW_;
GO

-- QueryReport1: Total revenue and tickets sold by journey date
CREATE OR ALTER PROCEDURE QueryReport1
AS
BEGIN
    SELECT
        dd.FullDate AS JourneyDate,
        COUNT(fj.FactID) AS TicketsSold,
        SUM(fj.Price) AS TotalRevenue
    FROM DW_Fact_Journey1_ fj
    JOIN DW_Dim_Date1_ dd ON fj.JourneyDateKey = dd.DateKey
    GROUP BY dd.FullDate
    ORDER BY dd.FullDate;
END;
GO

-- QueryReport2: Station-wise journey summary
CREATE OR ALTER PROCEDURE QueryReport2
AS
BEGIN
    SELECT
        ds.StationName AS DepartureStation,
        COUNT(fj.FactID) AS TotalJourneys,
        SUM(fj.Price) AS RevenueGenerated
    FROM DW_Fact_Journey1_ fj
    JOIN DW_Dim_Station1_ ds ON fj.DepartureStationKey = ds.StationKey
    GROUP BY ds.StationName
    ORDER BY RevenueGenerated DESC;
END;
GO

-- QueryReport3: Popular ticket types and their usage
CREATE OR ALTER PROCEDURE QueryReport3
AS
BEGIN
    SELECT
        dt.TicketType,
        dt.TicketClass,
        COUNT(fj.FactID) AS TicketsUsed,
        AVG(fj.Price) AS AvgFare
    FROM DW_Fact_Journey1_ fj
    JOIN DW_Dim_Ticket1_ dt ON fj.TicketKey = dt.TicketKey
    GROUP BY dt.TicketType, dt.TicketClass
    ORDER BY TicketsUsed DESC;
END;
GO

-- QueryReport4: Refund summary by journey status
CREATE OR ALTER PROCEDURE QueryReport4
AS
BEGIN
    SELECT
        fj.JourneyStatus,
        fj.RefundRequest,
        COUNT(*) AS TotalRequests
    FROM DW_Fact_Journey1_ fj
    GROUP BY fj.JourneyStatus, fj.RefundRequest
    ORDER BY TotalRequests DESC;
END;
GO

-- QueryReport5: Payment type analysis
CREATE OR ALTER PROCEDURE QueryReport5
AS
BEGIN
    SELECT
        dp.PaymentMethod,
        COUNT(fj.FactID) AS Transactions,
        SUM(fj.Price) AS TotalSales
    FROM DW_Fact_Journey1_ fj
    JOIN DW_Dim_Payment1_ dp ON fj.PaymentKey = dp.PaymentKey
    GROUP BY dp.PaymentMethod
    ORDER BY TotalSales DESC;
END;
GO


EXEC QueryReport1;
EXEC QueryReport2;
EXEC QueryReport3;
EXEC QueryReport4;
EXEC QueryReport5;
