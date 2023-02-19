IF object_id('SKU') is null
begin
	CREATE TABLE SKU
	(
		ID INT PRIMARY KEY IDENTITY, 
		Code AS 's' + CAST(ID AS VARCHAR),
		[Name] NVARCHAR(255) CHECK([Name] !='')
	)
end
IF object_id('Basket') is null
begin
	CREATE TABLE Basket
	(
		ID INT PRIMARY KEY IDENTITY,
		ID_SKU INT UNIQUE REFERENCES SKU (ID),
		Quantity INT NOT NULL DEFAULT(0),
		[Value] MONEY NOT NULL DEFAULT(0), 
		PurchaseDate AS GETDATE(),
		DiscountValue MONEY NOT NULL,
		CHECK((Quantity >= 0) AND ([Value] >= 0) AND ([DiscountValue] >= 0))
	)
end
IF object_id('SKU') is null
begin
	CREATE TABLE Family
	(
		ID INT PRIMARY KEY IDENTITY,
		SurName VARCHAR(255),
		BudgetValue MONEY NOT NULL 
	)
end
