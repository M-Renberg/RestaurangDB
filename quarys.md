#SQl QUARIES TO TRY

## Sale:


Sale per meny item
```sql
SELECT m.MenuItemName,
SUM(o.Quantity) AS TotalQuantity,
m.Price,
SUM(o.Quantity * m.Price) AS TotalSales
FROM orderitems AS o
JOIN menuitems AS m ON o.MenuID = m.MenuID
GROUP BY m.MenuItemName, m.Price
ORDER BY totalsales DESC;
```


Total sales:
```sql
SELECT SUM(o.Quantity * m.Price) AS TotalSales
FROM orderitems AS o
JOIN menuitems AS m ON o.MenuID = m.MenuID;
```

Total profit:

```sql
SELECT
Sales.allsales AS TotalSales,
Costs.allpurchases AS TotalPurcheses,
(Sales.allSales - Costs.allpurchases) AS TotalWinnings
FROM
(SELECT SUM(o.Quantity * m.Price) AS AllSales
FROM orderitems AS o
JOIN menuitems AS m ON o.MenuID = m.MenuID) AS Sales,
(SELECT SUM(p.Price) AS AllPurchases
FROM purchasing AS p) AS Costs;
```

Total profit per month
```sql
SELECT
Sales.allsales AS TotalSales,
Costs.allpurchases AS TotalPurcheses,
(Sales.allSales - Costs.allpurchases) AS TotalWinnings
FROM
(SELECT SUM(o.Quantity * m.Price) AS AllSales
FROM orderitems AS o
JOIN menuitems AS m ON o.MenuID = m.MenuID
JOIN orders AS o2 ON o.OrderID = o2.OrderID
WHERE
YEAR(o2.OrderDate) = 2025
AND MONTH(o2.OrderDate) = 10) AS Sales,
(SELECT SUM(p.Price) AS AllPurchases
FROM restaurangdb.purchasing AS p
WHERE
YEAR(p.PurchaseDate) = 2025
AND MONTH(p.PurchaseDate) = 10) AS Costs;
```

Total profit per year
```sql
CREATE VIEW View_YearlySales AS
SELECT
Sales.allsales AS TotalSales,
Costs.allpurchases AS TotalPurcheses,
(Sales.allSales - Costs.allpurchases) AS TotalWinnings
FROM
(SELECT SUM(o.Quantity * m.Price) AS AllSales
FROM orderitems AS o
JOIN menuitems AS m ON o.MenuID = m.MenuID
JOIN orders AS o2 ON o.OrderID = o2.OrderID
WHERE
YEAR(o2.OrderDate) = 2025) AS Sales,
(SELECT SUM(p.Price) AS AllPurchases
FROM purchasing AS p
WHERE
YEAR(p.PurchaseDate) = 2025) AS Costs;
```

Daily sale (made as view)

```sql
CREATE VIEW View_DailySales AS
SELECT 
    DATE(o.OrderDate) AS ODate,
    COUNT(DISTINCT o.OrderID) AS NumOfOrders,
    SUM(oi.Quantity * m.Price) AS Sales,
    SUM(o.TipAmount) AS Tip,
    (SUM(oi.Quantity * m.Price) + COALESCE(SUM(o.TipAmount), 0)) AS TotalSales
FROM orders AS o
JOIN orderitems AS oi ON o.OrderID = oi.OrderID
JOIN menuitems AS m ON oi.MenuID = m.MenuID
GROUP BY DATE(o.OrderDate);
```

receipt (made as view)

```sql
SELECT
o.OrderID,
o.TableID,
o.OrderDate,
s.FirstName AS Servitor,
GROUP_CONCAT(CONCAT(oi.Quantity, 'x ', m.MenuItemName) SEPARATOR ', ') AS Dishes,
SUM(oi.Quantity * m.Price) AS CostofFood,
COALESCE(o.TipAmount, 0) AS Tip,
(SUM(oi.Quantity * m.Price) + COALESCE(o.TipAmount, 0)) AS TotalPrice
FROM orders AS o
LEFT JOIN orderitems AS oi ON o.OrderID = oi.OrderID
LEFT JOIN menuitems AS m ON oi.MenuID = m.MenuID
lEFT JOIN personal AS s ON o.PersonalID = s.PersonalID
GROUP BY
o.OrderID, o.TableID, o.OrderDate, s.FirstName;
```

Print receipt
```sql
SELECT * FROM view_receipts
WHERE OrderID = 10;
```

## Tip:

who has the most tip

```sql
SELECT CONCAT(p.FirstName , ' ', p.LastName ) as PersonalName, Sum(o.TipAmount ) as Tip
FROM personal AS p
JOIN orders AS o ON p.PersonalID = o.PersonalID
GROUP BY PersonalName;
```


## Inventory:

Inventory status
```sql
CREATE VIEW View_InventoryStatus AS
SELECT DISTINCT i.ProductName, i.Quantity,
CASE
WHEN i.Quantity < 5 THEN 'Low'
ELSE 'OK'
END AS Status
FROM restaurangdb.inventory AS i
ORDER BY i.Quantity ASC;
```

## Orders

```sql
SELECT * FROM orders 
ORDER BY OrderDate DESC 
LIMIT 5 OFFSET 5;
```

### Personal:



Who take the most orders
```sql
select p.FirstName, p.LastName, p.Role,
COUNT(o.OrderID) AS OrdersTaken
FROM personal AS p
JOIN orders AS o ON p.PersonalID = o.PersonalID
GROUP BY p.PersonalID
HAVING OrdersTaken > 5
ORDER BY OrdersTaken DESC;
```

Who works the most?

```sql
select FirstName, LastName, Role,
CASE
WHEN Role IN ('head chef', 'sous chef', 'dishwasher') THEN 'Kitchen Staff'
WHEN Role IN ('head waiter', 'waiter', 'bartender') THEN 'Service Staff'
WHEN Role = 'restaurant manager' THEN 'Management'
ELSE 'Unknown Department'
END AS Department
FROM Personal;
```


Who many hours has the staff worked the last 30 days

```sql
SELECT 
    CONCAT(p.FirstName, ' ', p.LastName) AS FullName,
    SUM(TIMESTAMPDIFF(HOUR, s.ScheduleTIME, s.SceduleTimeEnd)) AS TotalHours
FROM 
    restaurangdb.personal AS p 
JOIN 
    restaurangdb.schedule AS s ON p.PersonalID = s.PersonalID
WHERE 
    s.ScheduleDay BETWEEN (CURDATE() - INTERVAL 1 MONTH) AND CURDATE()
GROUP BY 
    p.PersonalID, FullName;
```


Who many hours overtime:

```sql
SELECT FullName, TotalHours,
CASE
WHEN TotalHours > 40 THEN (TotalHours - 40)
ELSE 0
END AS OverTime,
CASE
WHEN TotalHours < 40 THEN (40 - TotalHours)
END AS UnScheduledTime

FROM(
SELECT CONCAT(p.FirstName, ' ', p.LastName) As FullName,
SUM(TIMESTAMPDIFF(HOUR, s.ScheduleTIME, s.SceduleTimeEnd)) AS TotalHours
FROM personal AS p
INNER JOIN schedule AS s ON p.PersonalID = s.PersonalID
WHERE
YEAR(s.ScheduleDay) = 2025
AND MONTH(s.ScheduleDay) = 10
GROUP BY
p.PersonalID, FullName
) AS WorkedHours;
```


Search personal base on first name

```sql
SELECT p.PersonalID, CONCAT(p.FirstName , '', p.LastName ) AS FullName, p.`Role`, p.PhoneNumber ,p.Email, p.Adress, p.`EmploymentStatus`,
COALESCE(n.FirstName, ' ', n.LastName ) AS NextOfKinName, n.PhoneNumber
FROM personal AS p
RIGHT JOIN nextofkin AS n ON p.PersonalID = n.PersonalID
WHERE p.FirstName LIKE '%a%';
```

Add employ
```sql
INSERT INTO personal (RestaurangID, FirstName, LastName, Email, PhoneNumber, Adress, `Role`, `EmploymentStatus`) VALUES
(1, 'FirstName', 'LastName', 'someting@fakemail.com', '07012345678', 'streetname', 'Role', 'EmploymentStatus');
INSERT INTO nextofkin (PersonalID, FirstName, LastName, PhoneNumber) VALUES
(LAST_INSERT_ID(), 'Firstname', 'LastName', '07012345622')
```


Remove employ
```sql
DELETE FROM restaurangdb.nextofkin
WHERE PersonalID = 15;
DELETE FROM restaurangdb.personal
WHERE PersonalID = 15;
```

Modify Employment status
```sql
UPDATE personal
SET EmploymentStatus = 'No'
WHERE PersonalID = 1;
```

### Add Order

select table and staff (first number table, second staff)
```sql
CALL sp_NewOrder(7, 1);
```

add menu items (first number orderid, second, menuid, third quantity)

```sql
CALL sp_AddOrderItem(31, 10, 2);
```
