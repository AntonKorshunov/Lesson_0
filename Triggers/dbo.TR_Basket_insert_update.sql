CREATE OR ALTER TRIGGER dbo.TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
UPDATE dbo.Basket
SET DiscountValue = [Value]*0.05
WHERE Basket.ID_SKU IN (SELECT ID_SKU 
						FROM inserted 
						GROUP BY ID_SKU
						HAVING COUNT(*) > 1
						)