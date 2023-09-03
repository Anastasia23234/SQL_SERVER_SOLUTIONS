
create function dbo.udf_GetSKUPrice
(@ID_SKU  as int) returns decimal(18, 2)
begin
 declare @Summ Decimal(18,2)
 declare @Summ2 Decimal(18,2)
 declare @rez Decimal(18,2)
select @Summ=sum(Quantity) from dbo.Basket
where ID_SKU = @ID_SKU;
select @Summ2=sum([Value]) from dbo.Basket
where ID_SKU = @ID_SKU
set @rez=@Summ2/@Summ
return @rez
end

