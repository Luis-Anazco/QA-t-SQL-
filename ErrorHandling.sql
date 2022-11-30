EXEC sp_addmessage 88888, 16, 'Vendor %s cannot be found'
GO

RAISERROR (88888, 16, 1, 'Red Hat')

-- Ex 2 Task 2 STARTING POINT
DECLARE @Vendor VARCHAR(100)
SET @Vendor = NULL

IF @Vendor IS NULL
	BEGIN;
		THROW 88888, 'Vendor cannot be NULL', 1
		RETURN
	END

IF NOT EXISTS (SELECT * FROM dbo.Vendor WHERE VendorName = @Vendor)
	BEGIN;
		THROW 88888, 'Vendor cannot be found', 1
		RETURN
	END

SELECT *
	FROM dbo.Course AS C
		INNER JOIN dbo.Vendor AS V
			ON C.VendorID = V.VendorID
	WHERE VendorName = @Vendor	
GO

-- Ex 3 Task 2	STARTING POINT

BEGIN TRY 
	UPDATE dbo.Vendor
	SET VendorName = NULL
	WHERE VendorID = 1
END TRY
BEGIN CATCH
	THROW 60000, 'Error', 1
END CATCH
GO