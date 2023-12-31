
alter procedure dbo.MakeFamily
@FamilySurName varchar (255) 
as
begin
if not exists(select*from dbo.Family where SurName = @FamilySurName)
begin
raiserror('Семьи с фамилией %s нет',15,1, @FamilySurName)
end
update dbo.Family
set BudgetValue = (select sum([Value]) from dbo.Basket join dbo.Family on ID_Family = dbo.Family.ID  where SurName=@FamilySurName)
where SurName=@FamilySurName
end
