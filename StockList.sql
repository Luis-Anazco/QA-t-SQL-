SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, 
	UnitPrice * UnitsInStock AS CurrentStockValue, 
	(UnitsOnOrder + UnitsInStock) * UnitPrice AS FutureStockValue
FROM dbo.Products

