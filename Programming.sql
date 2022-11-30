DECLARE @TotalDelegates INT 

SELECT @TotalDelegates = COUNT(DelegateID)
FROM dbo.Delegate

PRINT @TotalDelegates

