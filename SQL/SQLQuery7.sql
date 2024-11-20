use master
drop database QLBH
CREATE DATABASE QLBH
use QLBH

create table NhomSanPham(
	MaNhom Int Not null,
	TenNhom Nvarchar(15)
);
go 
create table SanPham(
	MaSP int Not null,
	TenSP nvarchar(40) Not null, 
	MaNCC Int Not null,
	MoTa nvarchar(50),
	MaNhom Int not null,
	Đonvitinh nvarchar(20),
	GiaGoc Money check(GiaGoc > 0),
	SLTON int check (SLTON >= 0)
);
go 
create table KhachHang(
	MaKH Char(5) Not null,
	TenKH Nvarchar(40) Not null ,
	LoaiKH Nvarchar(3) check(LoaiKH = 'VIP' OR LoaiKH = 'TV' OR LoaiKH ='VL'),
	DiaChi Nvarchar(60),
	Phone NVarchar(24),
	DCMail NVarchar(50),
	DiemTL Int check(DiemTL >= 0)
);
go 
create table HoaDon(
	MaHD Int Not null,
	NgayLapHD DateTime default getdate() check(NgayLapHD>= getdate()),
	NgayGiao DateTime,
	Noichuyen NVarchar(60) Not Null ,
	MaKH Char(5) not null
);
go 
create table CT_HoaDon(
	MaHD Int Not null,
	MaSP int Not null ,
	Soluong SmallInt Check(Soluong>0),
	Dongia Money,
	ChietKhau Money  check(ChietKhau>=0)
);
go 
create table NhaCungCap(
	MaNCC Int Not null,
	TenNCC Nvarchar(40) Not Null,
	Diachi Nvarchar(60),
	Phone NVarchar(24),
	SoFax NVarchar(24),
	DCMail NVarchar(50)
);
go

alter table dbo.NhomSanPham add constraint tr primary key (MaNhom) -- pk
alter table dbo.SanPham add constraint yy primary key (MaSP) --pk
alter table dbo.NhaCungCap add constraint tu primary key (MaNCC) --pk
alter table dbo.SanPham add constraint ui foreign key (MaNhom) references dbo.NhomSanPham(MaNhom) --fk
alter table dbo.SanPham add constraint uT foreign key (MaNCC) references dbo.NhaCungCap(MaNCC) --fk
alter table dbo.HoaDon add constraint op primary key (MaHD) --pk
alter table dbo.HoaDon add constraint th foreign key (MaKH) references dbo.KhachHang(MaKH)  --fk
alter table dbo.CT_HoaDon add constraint kl primary key (MaHD,MaSP) --pkpk
alter table dbo.CT_HoaDon add constraint tc foreign key (MaHD) references dbo.HoaDon(MaHD) --fk
alter table dbo.CT_HoaDon add constraint hn foreign key (MaSP) references dbo.SanPham(MaSP)  --fk
alter table dbo.KhachHang add constraint  nh primary key (MaKH) --pk

--a)
-- Thêm cột LoaiHD vào bảng HoaDon ?
alter table dbo.HoaDon add LoaiHD char(1) default'N' constraint uu check(LoaiHD in ('N', 'X', 'C', 'T'))
--b)Tạo thêm ràng buộc trên bảng HoaDon : NgayGiao>=NgayLapHD ?
alter table dbo.HoaDon add constraint tt check(NgayGiao >= NgayLapHD);
