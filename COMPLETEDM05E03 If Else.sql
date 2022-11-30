DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor

GO

DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'QA'
IF @Vendor IS NULL
BEGIN
PRINT 'There are no NULL values'
END
ELSE
BEGIN
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
END

GO

DECLARE @Vendor VARCHAR(100)
SET @Vendor = NULL
IF @Vendor IS NULL
BEGIN
PRINT 'There are no NULL values'
END
ELSE
BEGIN
SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE 
		VendorName = @Vendor
END

GO

DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'AQ'
IF @Vendor IS NULL
BEGIN
	PRINT 'There are no NULL values'
END

IF NOT EXISTS
	(
		SELECT * 
		FROM dbo.Vendor 
		WHERE VendorName = @Vendor
	)
BEGIN
	PRINT 'The vendor does not exist'
END

ELSE
BEGIN
	SELECT *
		FROM dbo.Course AS C
			INNER JOIN dbo.Vendor AS V
				ON C.VendorID = V.VendorID
		WHERE 
			VendorName = @Vendor
END
GO


DECLARE @Vendor VARCHAR(100)
SET @Vendor = 'AQ'
IF @Vendor IS NULL
BEGIN
	PRINT 'There are no NULL values'
	RETURN
END

IF NOT EXISTS
	(
		SELECT * 
		FROM dbo.Vendor 
		WHERE VendorName = @Vendor
	)
BEGIN
	PRINT 'The vendor does not exist'
	RETURN
END

ELSE
BEGIN
	SELECT *
		FROM dbo.Course AS C
			INNER JOIN dbo.Vendor AS V
				ON C.VendorID = V.VendorID
		WHERE 
			VendorName = @Vendor
	RETURN
END
GO