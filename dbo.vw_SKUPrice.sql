create view  dbo.SKUPrice
as 
select*,dbo.udf_GetSKUPrice(ID) as Price
from dbo.SKU