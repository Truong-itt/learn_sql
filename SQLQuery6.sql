use master
go 
create database primary_foreign 
drop database primary_foreign
use primary_foreign
create table bomon(
	mabm char(10) primary key,
	name nvarchar(100) default N'ten bo mon'
);
go 
create table lop(
	malop char(10)not null ,
	name nvarchar(100) default N'ten lop'

	-- tao khoa chinh 
	primary key (malop)
);

go 
create table giaovien(
	magv char(10) not null,
	name nvarchar(100) default N'ten giao vien',
	diachi nvarchar(100) default N'dia chi cua giao vien',
	ngaysinh date,
	sex bit,
	mabm char(10)

	foreign key (mabm) references dbo.bomon(mabm)
)
alter table dbo.giaovien add primary key (magv)
go
create table hocsinh(
	mahs char(10) unique not null,
	name nvarchar(100),
)
alter table dbo.hocsinh add primary key (mahs)
go 
alter table dbo.hocsinh add malop char(10)
alter table dbo.hocsinh add constraint fk_hs foreign key (malop) references dbo.lop(malop)
-- huy khoa 
alter table dbo.hocsinh  drop constraint fk_hs
-- dieu kien de tao khoa ngoai 
-- tham chieu den khoa chinh 
-- cung kieu du lieu 
-- khoa chinh not null unique 
-- cung so luong turong cos sap xep

-- insert xem mối rang buộc 
insert into dbo.bomon(mabm,name)
values ('BM01',N'bo mon1')
insert into dbo.bomon(mabm,name)
values ('BM0',N'bo mon2')
insert into dbo.bomon(mabm,name)
values ('BM03',N'bo mon3')

select * from dbo.bomon

insert into dbo.giaovien 
values ('gv01',N'gv 1',N'dc 1',getdate(),null,'')

INSERT INTO dbo.giaovien (magv, name, diachi, ngaysinh, sex, mabm)
VALUES ('gv01', N'gv 1', N'dc 1', GETDATE(), NULL, N'BM01');

select * from dbo.giaovien
truncate table  dbo.giaovien 