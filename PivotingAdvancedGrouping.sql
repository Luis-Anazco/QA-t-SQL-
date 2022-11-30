SELECT VendorName, CourseName, StartDate, NumberDelegates
FROM dbo.VendorCourseDateDelegateCount

SELECT * FROM 
(
	SELECT VendorName, StartDate, NumberDelegates
	FROM dbo.VendorCourseDateDelegateCount
) AS BaseData
PIVOT
(
	SUM(NumberDelegates) FOR VendorName IN (QA, Microsoft, Oracle)
) AS Pivotted

SELECT VendorName, CourseName, StartDate, SUM(NumberDelegates) AS TotalDelegates
FROM dbo.VendorCourseDateDelegateCount
GROUP BY VendorName, CourseName, StartDate
WITH ROLLUP

SELECT 
	VendorName,		
	CourseName, 
	StartDate, 
	SUM(NumberDelegates) AS TotalDelegates,
	GROUPING_ID(VendorName, CourseName, StartDate) AS GroupingType
FROM dbo.VendorCourseDateDelegateCount
GROUP BY 
	GROUPING SETS
	(
		(VendorName),
		(VendorName, CourseName),
		(VendorName, CourseName, StartDate)
	)
