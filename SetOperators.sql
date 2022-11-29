SELECT 'Vendor' AS ContactType, Vendorname, PhoneNumber
FROM dbo.Vendor
UNION ALL
SELECT 'Trainer' AS ContactType, TrainerName, PhoneNumber
FROM dbo.Trainer

SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQL'
INTERSECT
SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQLPLUS'

SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQL'
EXCEPT
SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQLPLUS'


SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQLPLUS'
EXCEPT
SELECT a.DelegateID
FROM dbo.DelegateAttendance AS a
JOIN dbo.CourseRun AS r
ON a.CourseRunID = r.CourseRunID
JOIN dbo.Course AS c
ON r.CourseID = c.CourseID
WHERE c.CourseName ='QATSQL'