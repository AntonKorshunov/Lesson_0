IF OBJECT_ID('dbo.vw_SKUPrice') IS NOT NULL DROP FUNCTION dbo.vw_SKUPrice;
GO
CREATE VIEW  dbo.vw_SKUPrice 
(
	ID, Code, [Name], OneProdValue
)
AS
SELECT ID, Code, [Name], dbo.udf_GetSKUPrice(ID)
FROM dbo.SKU