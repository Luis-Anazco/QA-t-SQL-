SELECT c.CustomerID, c.CompanyName, c.ContactName, c.City, o.OrderID, o.OrderDate
FROM 
dbo.Customers AS c
JOIN
dbo.Orders as o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'UK'
ORDER BY CompanyName, OrderDate


SELECT		c.CustomerID, c.CompanyName, c.ContactName, o.OrderID, 
			o.OrderDate, od.Quantity, p.ProductID, p.ProductName
FROM		dbo.Customers AS c
JOIN		dbo.Orders as o
ON			c.CustomerID = o.CustomerID
JOIN		dbo.[Order Details] AS od
ON			o.OrderID = od.OrderID
JOIN		dbo.Products AS p
ON			p.ProductID = od.ProductID
WHERE		c.Country = 'UK'
ORDER BY	CompanyName, OrderDate