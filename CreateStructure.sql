create table dbo.SKU (
     ID int identity(1,1)  primary key,
     Code as 's'+ CAST (ID as varchar),
     [Name] varchar(100),
     constraint UQ_SKU_Code  unique (Code),
     );


create table dbo.Family (
     ID int identity(1,1) primary key,
     SurName varchar (255),
     BudgetValue money,
     );


create table dbo.Basket(
     ID int identity (1,1) primary key,
     ID_SKU int foreign key references dbo.SKU(ID),
     ID_Family int  foreign key references dbo.Family(ID),
     Quantity  money check (Quantity>=0),
     [Value] numeric check (Value>=0),
     PurchaseDate date default  getdate(),
     DiscountValue money,
     );

	   

	