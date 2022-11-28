/*
SELECT COUNT(*)
FROM dbo.Customers

-- 91
*/

SELECT					c.CompanyName, COUNT(o.OrderID) AS NumOrders, 
						MIN(o.OrderDate) AS MinDate
FROM					dbo.Orders AS o
RIGHT OUTER JOIN		dbo.Customers AS c
ON						c.CustomerID = o.CustomerID
GROUP BY				c.CompanyName
ORDER BY				NumOrders