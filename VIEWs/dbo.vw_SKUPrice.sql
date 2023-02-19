CREATE OR ALTER VIEW  dbo.vw_SKUPrice 
(
	ID, Code, [Name], OneProdValue
)
AS
SELECT ID, Code, [Name], dbo.udf_GetSKUPrice(ID)
FROM dbo.SKU