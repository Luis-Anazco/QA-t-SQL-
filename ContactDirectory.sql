SELECT ContactName, Phone
FROM dbo.Customers
UNION
SELECT ContactName, Phone
FROM dbo.Suppliers
UNION
SELECT 'Northwind Traders ' + FirstName + ' ' + LastName AS FullName, Extension
FROM dbo.Employees