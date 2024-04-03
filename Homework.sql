create database Course

use Course

create table Students(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(100),
	[Surname] nvarchar(100),
	[Age] int,
	[Email] nvarchar(100),
	[Address] nvarchar(200)
)

create procedure usp_createStudent
@name nvarchar(100),
@surname nvarchar(100),
@age int,
@email nvarchar(100),
@address nvarchar(200)
as
begin
	insert into Students([Name],[Surname],[Age],[Email],[Address])
	values(@name,@surname,@age,@email,@address)
end

exec usp_createStudent 'Rashad','Aghayev',21,'rashad@gmail.com','Address1'
exec usp_createStudent 'Behruz','Eliyev',39,'behruz@gmail.com','Address2'
exec usp_createStudent 'Ismayil','Ceferli',24,'ismayil@gmail.com','Address3'
exec usp_createStudent 'Esgerxan','Bayramov',26,'esgerxan@gmail.com','Address3'
exec usp_createStudent 'Fatime','Qayxanova',22,'fatime@gmail.com','Address4'
exec usp_createStudent 'Fexriyye','Tagizade',21,'fexriyye@gmail.com','Address5'


create table StudentArchives(
	[Id] int primary key identity(1,1),
	[StudentId] int,
	[Name] nvarchar(100),
	[Surname] nvarchar(100),
	[Age] int,
	[Email] nvarchar(100),
	[Address] nvarchar(200),
	[Operation] nvarchar(20),
	[Date] datetime
)


create trigger trg_logDeletedStudent on Students
after delete
as
begin
	insert into StudentArchives([StudentId],[Name],[Surname],[Age],[Email],[Address],[Operation],[Date])
	select [Id],[Name],[Surname],[Age],[Email],[Address],'Delete',GETDATE() from deleted
end

create procedure usp_deleteStudentById
@id int
as
begin
	delete from Students where [Id] = @id
end

exec usp_deleteStudentById 5

exec usp_deleteStudentById 2

exec usp_deleteStudentById 6


select * from Students
select * from StudentArchives

