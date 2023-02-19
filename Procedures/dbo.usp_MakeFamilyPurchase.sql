IF OBJECT_ID('dbo.usp_MakeFamilyPurchase') IS NOT NULL 
	DROP PROC dbo.usp_MakeFamilyPurchase;
GO

CREATE PROC dbo.usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
AS
BEGIN
	IF @FamilySurName IN (SELECT SurName FROM dbo.Family)
	BEGIN
		UPDATE dbo.Family
		SET 
			BudgetValue = dbo.Family.BudgetValue - 
				(SELECT SUM(dbo.Basket.[Value])
				FROM dbo.Basket)
		WHERE dbo.Family.SurName = @FamilySurName
	END
	ELSE
		PRINT('Ошибка - такой семьи (' + @FamilySurName + ') нет!')
END;