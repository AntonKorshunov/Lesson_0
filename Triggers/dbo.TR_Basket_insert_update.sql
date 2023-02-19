IF OBJECT_ID('dbo.TR_Basket_insert_update') IS NOT NULL 
	DROP TRIGGER dbo.TR_Basket_insert_update;
GO
CREATE TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
UPDATE dbo.Basket
SET DiscountValue = CASE WHEN Basket.ID_SKU IN (SELECT ID_SKU 
						FROM inserted 
						GROUP BY ID_SKU
						HAVING COUNT(*) > 1)
			 THEN [Value]*0.05
			 ELSE 0
		    END;
