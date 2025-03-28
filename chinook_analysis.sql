
-- Q1: Who are the top spending customers?
SELECT 
    c.FirstName || ' ' || c.LastName AS CustomerName,
    SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

-- Q2: What’s the revenue trend by month?
SELECT 
    strftime('%Y-%m', InvoiceDate) AS Month,
    SUM(Total) AS MonthlyRevenue
FROM Invoice
GROUP BY Month
ORDER BY Month;

-- Q3: Which music genres are the most popular?
SELECT 
    g.Name AS Genre,
    COUNT(il.InvoiceLineId) AS TracksSold
FROM Genre g
JOIN Track t ON g.GenreId = t.GenreId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY g.GenreId
ORDER BY TracksSold DESC;

-- Q4: Which artists generate the most revenue?
SELECT 
    ar.Name AS Artist,
    SUM(il.UnitPrice * il.Quantity) AS Revenue
FROM Artist ar
JOIN Album al ON ar.ArtistId = al.ArtistId
JOIN Track t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY ar.ArtistId
ORDER BY Revenue DESC;

-- Q5: Customer distribution by country
SELECT 
    BillingCountry,
    COUNT(DISTINCT CustomerId) AS CustomerCount
FROM Invoice
GROUP BY BillingCountry
ORDER BY CustomerCount DESC;
