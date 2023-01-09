create login Director with password = '1111';
go
create user DirectorUser for login Director;
go
exec sp_addrolemember 'db_owner' , 'DirectorUser';
go

create login ProtectedReader with password = '2222';
go
create user ProtectedUser for login ProtectedReader;
go
grant select on object::tours.[Страны] to ProtectedUser
grant select on object::tours.[Туры] to ProtectedUser
go

create login BackUpLogin with password = '3333';
go
create user BackUpUser for login BackUpLogin;
go
exec sp_addrolemember 'db_backupoperator', 'BackUpUser';
go

create login AccessLogin with password = '4444';
go
create user AcessUser for login AccessLogin;
go
exec sp_addrolemember 'db_accessadmin', 'AcessUser';