SELECT 
	COUNT(*) AS NumberOfOrders,
	MIN(OrderDate) AS EarliestOrder,
	MAX(OrderDate) AS LatestOrder
FROM dbo.Orders
WHERE EmployeeID = 1