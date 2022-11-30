-- Ex 1 Task 2 Starting Point
DECLARE @ProductID INT = 4
DECLARE @Amount INT = 1

IF @ProductID IS NULL OR @Amount IS NULL
BEGIN;
	THROW 88888, 'Either variable is NULL', 1
	RETURN
END

BEGIN TRY
	BEGIN TRAN
		INSERT INTO dbo.BookTransfers VALUES 				                
				(@ProductID,getdate(),'Transfer Out',-@Amount)
		UPDATE dbo.BookStock
			SET StockAmount = StockAmount - @Amount
			WHERE ProductID = @ProductID	
	COMMIT TRAN
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	THROW 88888, 'Something went wrong', 1
END CATCH
GO