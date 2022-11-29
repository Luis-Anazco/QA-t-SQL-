SELECT ProductID, TransferDate, TransferAmount
FROM dbo.BookTransfers

SELECT ProductID, SUM(TransferAmount) AS Stock
FROM dbo.BookTransfers
GROUP BY ProductID

SELECT 
	ProductID,
	TransferDate,
	TransferAmount,
	SUM(TransferAmount) OVER (PARTITION BY ProductID ORDER BY TransferDate) AS RunningStock
FROM dbo.BookTransfers

SELECT 
	VendorName, 
	CourseName, 
	NumberDelegates,
	RANK() OVER (ORDER BY NumberDelegates DESC) AS Ranking,
	DENSE_RANK() OVER (ORDER BY NumberDelegates DESC) AS DenseRanking,
	ROW_NUMBER() OVER (ORDER BY NumberDelegates DESC) AS RowNum,
	NTILE(3) OVER (ORDER BY NumberDelegates DESC) AS TileNum
FROM dbo.VendorCourseDelegateCount


SELECT 
	VendorName, 
	CourseName, 
	NumberDelegates
FROM (
		SELECT *,
		RANK() OVER (PARTITION BY VendorName ORDER BY NumberDelegates DESC) AS League_Pos
		FROM dbo.VendorCourseDelegateCount
	) AS DerivedTable
WHERE League_Pos = 1
GO