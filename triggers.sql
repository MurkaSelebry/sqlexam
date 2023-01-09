USE [������������� ��������� ������� ����� �� 80 ����]
GO

/****** Object:  Trigger [customers].[CheckClients]    Script Date: 09.01.2023 8:05:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





--exec where_is_tourist @FIO=N'������� �������� ����������
--'
CREATE TRIGGER [customers].[CheckClients]
ON [customers].[������� ��������]
instead of INSERT
as
begin
    if not exists (select i.Email from inserted i where i.Email in (select Email from customers.[������� ��������] ) )
            begin
            insert into customers.[������� ��������]
            select i.FIO, i.Phone, i.Email, i.DateOfBirth,i.FutureTours,i.PastTours from inserted i
            end
    else 
        begin
            set nocount on
            raiserror (N'���� ������ ��� ���� � ��!',0,1) 
        end
end;


--exec transport_method @transpM=N'�������'
GO

ALTER TABLE [customers].[������� ��������] ENABLE TRIGGER [CheckClients]
GO


CREATE TRIGGER [tours].[CheckMaxCustomers]
ON [tours].[����]
instead of update
as
begin
    if exists(select * from tours.[����] t where (select count(value) from string_split(PaidCustomers,','))=MaxCustomersNumber)
            begin
            set nocount on
            raiserror (N'������������ ���������� ��� ����������!',0,1) 
			end
end;
GO

ALTER TABLE [tours].[����] ENABLE TRIGGER [CheckMaxCustomers]
GO
CREATE TRIGGER [tours].[DeleteTours]
ON [tours].[����]
after delete
as
begin
    insert into tours.[�������� ����]
	select d.[Name],d.Price,d.DateOfStart,d.DateOfEnd,d.TransportMethods,d.PaidCustomers,d.MaxCustomersNumber,d.PotentialCustomers,d.EmployerId,d.FIOEmployer from deleted d
end;
GO

ALTER TABLE [tours].[����] ENABLE TRIGGER [DeleteTours]
GO
