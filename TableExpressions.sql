/*
CREATE VIEW dbo.CourseList AS
SELECT c.CourseName, c.CourseID, v.VendorName
FROM dbo.Course AS c
JOIN dbo.Vendor AS v
ON c.VendorID = v.VendorID
GO

SELECT * 
FROM dbo.CourseList
GO


ALTER FUNCTION udf_DelegateDays() RETURNS TABLE
AS
RETURN (
		SELECT d.DelegateID, SUM(c.DurationDays) AS DelegateDays, COUNT(*) AS DelegateCourses
		FROM dbo.Delegate AS d
		JOIN dbo.DelegateAttendance AS a
		ON d.DelegateID = a.DelegateID
		JOIN dbo.CourseRun AS c
		ON c.CourseRunID = a.CourseRunID
		GROUP BY d.DelegateID
		)
GO


SELECT * FROM dbo.udf_DelegateDays()


ALTER FUNCTION udf_IndividualDelegateDays(@DelegateID INT) 
RETURNS TABLE
AS
RETURN
	SELECT * 
	FROM dbo.Delegate
GO


SELECT * FROM udf_IndividualDelegateDays(1)


SELECT d.DelegateID, d.DelegateName, d.CompanyName, DerivedTrainerTable.StartDate
FROM dbo.DelegateAttendance AS a
JOIN dbo.Delegate AS d
ON a.DelegateID = d.DelegateID
JOIN
	(
	SELECT c.CourseRunID, c.StartDate 
	FROM dbo.Trainer AS t
	JOIN dbo.CourseRun AS c
	ON c.TrainerID = t.TrainerID
	WHERE t.TrainerName = 'Jason Bourne'
	)
	AS DerivedTrainerTable
ON a.CourseRunID = DerivedTrainerTable.CourseRunID


WITH BourneCourses AS
	(
	SELECT c.CourseRunID, c.StartDate
	FROM dbo.Trainer AS t
	JOIN dbo.CourseRun AS c
	ON t.TrainerID = c.TrainerID
	WHERE t.TrainerName = 'Jason Bourne'
	)
SELECT d.DelegateID, d.DelegateName, d.CompanyName, BourneCourses.StartDate
FROM BourneCourses
JOIN dbo.DelegateAttendance AS a
ON BourneCourses.CourseRunID = a.CourseRunID
JOIN dbo.Delegate AS d
ON d.DelegateID = a.DelegateID

*/


SELECT *
FROM dbo.Course
WHERE VendorID = 2

SELECT * INTO #MicrosoftLocal
FROM dbo.Course 
WHERE VendorID = 2

SELECT * INTO ##MicrosoftGlobal
FROM dbo.Course 
WHERE VendorID = 2
GO

SELECT *
FROM #MicrosoftLocal

SELECT *
FROM ##MicrosoftGlobal