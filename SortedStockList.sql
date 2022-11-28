SELECT TOP 10 ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder, 
	UnitPrice * UnitsInStock AS CurrentStockValue, 
	(UnitsOnOrder + UnitsInStock) * UnitPrice AS FutureStockValue
FROM dbo.Products
ORDER BY CurrentStockValue DESC, FutureStockValue DESC