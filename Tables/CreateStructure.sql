IF object_id('SKU') is null
begin
	CREATE TABLE SKU
	(
		ID INT PRIMARY KEY IDENTITY, 
		Code AS 's' + CAST(ID AS VARCHAR),
		[Name] NVARCHAR(255) NOT NULL
	)
end
IF object_id('Basket') is null
begin
	CREATE TABLE Basket
	(
		ID INT PRIMARY KEY IDENTITY,
		ID_SKU INT REFERENCES SKU (ID),
		Quantity INT NOT NULL,
		[Value] MONEY NOT NULL, 
		PurchaseDate DATE DEFAULT(GETDATE()),
		DiscountValue MONEY NOT NULL DEFAULT(0),
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
