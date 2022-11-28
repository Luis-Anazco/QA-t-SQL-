SELECT OrderID, CustomerID, OrderDate
FROM dbo.Orders
WHERE CustomerID IN ('ALFKI', 'ERNSH', 'SIMOB') 
	AND cast(OrderDate AS date) BETWEEN '1997-08-01' AND '1997-08-31'