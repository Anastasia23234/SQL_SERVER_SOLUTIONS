create trigger dbo.TR_Basket_insert_update
on dbo.Basket
after insert
as begin
if (select count(*) from inserted  where inserted.ID_SKU in (select ID_SKU from dbo.Basket group by  ID_SKU having count(*)>1))>1 
begin
update dbo.Basket
set DiscountValue=dbo.Basket.[Value]*0.05 from dbo.Basket
join inserted on dbo.Basket.ID_SKU = INSERTED.ID_SKU
end
else
begin
update dbo.Basket 
set  DiscountValue=0 from dbo.Basket
join inserted on dbo.Basket.ID_SKU=INSERTED.ID_SKU
end
end
