use external_source
go
----querry 1 Top Departure Stations by Journey Count---
SELECT 
    [Departure Station],
    COUNT(*) AS JourneyCount
FROM 
    Sheet1$
GROUP BY 
    [Departure Station]
ORDER BY 
    JourneyCount DESC;

-----querry 2 Journeys with Price > 50-----
SELECT 
    [Transaction ID],
    [Departure Station],
    [Arrival Destination],
    [Price]
FROM 
    Sheet1$
WHERE 
    [Price] > 50
ORDER BY 
    [Price] DESC;

-- querry 3  First Class Tickets---
SELECT 
    [Transaction ID],
    [Departure Station],
    [Arrival Destination],
    [Ticket Class]
FROM 
    Sheet1$
WHERE 
    [Ticket Class] = 'First Class';

-- querry 4 Stations with More Than 5 Departing Journeys----
SELECT 
    [Departure Station],
    COUNT(*) AS JourneysDeparted
FROM 
    Sheet1$
GROUP BY 
    [Departure Station]
HAVING 
    COUNT(*) > 5
ORDER BY 
    JourneysDeparted DESC;

-- querry 5 Journeys Ordered by Date ---
SELECT 
    [Transaction ID],
    [Departure Station],
    [Arrival Destination],
    [Date of Journey],
    [Price]
FROM 
    Sheet1$
ORDER BY 
    [Date of Journey];


---querry 6 Late Arrivals (Actual Arrival > Scheduled Arrival)---
SELECT 
    [Transaction ID],
    [Departure Station],
    [Arrival Destination],
    [Arrival Time],
    [Actual Arrival Time]
FROM 
    Sheet1$
WHERE 
    TRY_CAST([Actual Arrival Time] AS TIME) > TRY_CAST([Arrival Time] AS TIME);

-- querry 7 GetJourneyDetails_SQL----
SELECT
    [Transaction ID],
     [Departure Station],
    [Arrival Destination],
    [Date Of Journey],
    [Journey Status]
FROM
    Sheet1$
ORDER BY
    [Date Of Journey];
