USE [Туристическое агентство «Вокруг света за 80 дней»]
GO

/****** Object:  Trigger [customers].[CheckClients]    Script Date: 09.01.2023 8:05:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--exec where_is_tourist @FIO=N'Романов Григорий Евгеньевич
--'
CREATE TRIGGER [customers].[CheckClients]
ON [customers].[Клиенты агенства]
instead of INSERT
as
begin
    if not exists (select i.Email from inserted i where i.Email in (select Email from customers.[Клиенты агенства] ) )
            begin
            insert into customers.[Клиенты агенства]
            select i.FIO, i.Phone, i.Email, i.DateOfBirth,i.FutureTours,i.PastTours from inserted i
            end
    else 
        begin
            set nocount on
            raiserror (N'Этот клиент уже есть в бд!',0,1) 
        end
end;


--exec transport_method @transpM=N'Автобус'
GO

ALTER TABLE [customers].[Клиенты агенства] ENABLE TRIGGER [CheckClients]
GO


CREATE TRIGGER [tours].[CheckMaxCustomers]
ON [tours].[Туры]
instead of update
as
begin
    if exists(select * from tours.[Туры] t where (select count(value) from string_split(PaidCustomers,','))=MaxCustomersNumber)
            begin
            set nocount on
            raiserror (N'Максимальное количество уже достигнуто!',0,1) 
			end
end;
GO

ALTER TABLE [tours].[Туры] ENABLE TRIGGER [CheckMaxCustomers]
GO
CREATE TRIGGER [tours].[DeleteTours]
ON [tours].[Туры]
after delete
as
begin
    insert into tours.[Архивные туры]
	select d.[Name],d.Price,d.DateOfStart,d.DateOfEnd,d.TransportMethods,d.PaidCustomers,d.MaxCustomersNumber,d.PotentialCustomers,d.EmployerId,d.FIOEmployer from deleted d
end;
GO

ALTER TABLE [tours].[Туры] ENABLE TRIGGER [DeleteTours]
GO
