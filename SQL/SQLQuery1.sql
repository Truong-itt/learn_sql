-- luu y ve du lieu 
--- char ap cung 
-- varchar dung nhieu tinh nhieu them chu n vao la duoc su dung chu co dau 
-- text luu van ban 
-- ntext luu van ban tien viet co dau 
use  sqlquery_new

-- them du lieu vao bang 
-- kieu so thi dua vao binh thuong
-- kieu du lieu ngay thi can de trong cap nhat don 
-- neu la text thi can co N
select * from dbo.hocsinh
insert dbo.hocsinh (mahs,name,ngaysinh) 
values (
	N'123',
	N'truong',
	GETDATE()
)
create table test(
	maso int,
	ten nvarchar(10),
	ngaysinh date,
	nam bit,
	diachi char(10),
	tienluong float
)
drop table dbo.test
INSERT INTO dbo.test(maso, ten, ngaysinh, nam, diachi, tienluong) 
VALUES (0, N'', GETDATE(), NULL, '', 1.1);

INSERT INTO dbo.test
VALUES (0, N'', GETDATE(), NULL, 1, 1.1);

select * from dbo.test;
INSERT INTO dbo.test
VALUES (1, N'', GETDATE(), NULL, 1, 101);

-- xoad  di du lieu co dieu kien trong table 
delete dbo.test where tienluong > 1000 or maso  =1
delete dbo.test -- tuong tu nhu truncate 
-- neu chu delete ten bang xoa  bo du ieu trong bang 
-- xoa truong moggn muong them where

-- update du lieu trong bang voi mot truong
update dbo.test set tienluong  = 10
-- update du lieu nhieu truong trong bang 
update dbo.test set tienluong  = 10,diachi = 0;
-- updata trong truong co dieu kien 
update dbo.test set tienluong = 100000 where diachi = 1;