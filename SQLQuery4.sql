use sqlquery_new


create table testprimary1(
-- khi de unique khong nen de default vi rat de bi trung 
	id int unique not null ,
	name nvarchar(100) default N'truong dt'
)
go 
insert into dbo.testprimary1 (id) values (0)
insert into dbo.testprimary1(id)  values (1)
insert into dbo.testprimary1 (id) values (0)

-- khi tao khoa chinh thi primarry key bang not null + unique 
drop table testprimary1
create table testprimary1 (
-- khi de unique khong nen de default vi rat de bi trung 
	id int primary key,
	name nvarchar(100) default N'truong dt'
)

-- khi da tao bang roi 
alter table dbo.testprimary1 add primary key (id)

-- xu li co trinh tu khi tao bang 
create table testprimary1(
-- khi de unique khong nen de default vi rat de bi trung 
	id int unique not null ,
	name nvarchar(100) default N'truong dt'

	primary key (id)
)

create table testprimary1(
-- khi de unique khong nen de default vi rat de bi trung 
	id int unique not null ,
	name nvarchar(100) default N'truong dt'

	constraint khoa_chinh_id
	primary key (id)
)

-- toa primary key ngay sau kih tao nang va dat ten cho key do 
create table testprimary1(
-- khi de unique khong nen de default vi rat de bi trung 
	id int unique not null ,
	name nvarchar(100) default N'truong dt'
)
alter  table dbo.testprimary1
add constraint khoa_chinh_id primary key (id)


-- xet hai primảkeyy cho mot table
create table testprimary1(
-- khi de unique khong nen de default vi rat de bi trung 
	id int not null ,
	id2 int not null,
	name nvarchar(100) default N'truong dt'

	primary key (id,id2)
)