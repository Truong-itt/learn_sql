create database sqlquery_new

use sqlquery_new

go 
-- tao bang
create table giaovien(
	magv nvarchar(10),
	name nvarchar(100)
)
go 
create table hocsinh(
	mahs nvarchar(10),
	name nvarchar(100)
)

-- them cot vao bang 
alter table hocsinh add ngaysinh date 

-- xoa di du lieu cua bang 
truncate table hocsinh 
-- xoa  di toan bo bang 
drop table hocsinh


