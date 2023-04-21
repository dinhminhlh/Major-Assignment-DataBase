create database CPU007
go


use CPU007
go

create table DonHang
(
	MaDonHang nvarchar(10),
	NgayDatHang datetime,
	DanhGia tinyint,
	MaVanDon nvarchar(10),
	GiamGia nvarchar(20),
	MaNhanVien nvarchar(10),
	MaKhachHang nvarchar(10),
	TrangThai nvarchar(30),
	constraint pk_DonHang_MaDH primary key(MaDonHang)
)

create table NhanVien
(
	MaNhanVien nvarchar(10),
	ChucVu nvarchar(20),
	TenNhanVien nvarchar(30),
	GioiTinh bit,
	SDT varchar(15),
	constraint pk_NhanVien_MaNV primary key(MaNhanVien)
)

create table KhachHang
(
	MaKhachHang nvarchar(10),
	TenKhachHang nvarchar(30),
	SDT varchar(15),
	DiaChi nvarchar(50),
	GioiTinh bit,
	NgaySinh date,
	Emails nvarchar(30),
	UuDai nvarchar(10),
	constraint pk_KhachHang_MaKH primary key(MaKhachHang)
)

alter table dbo.DonHang add constraint fk_DonHang_MaNV foreign key (MaNhanVien) references NhanVien (MaNhanVien), constraint fk_KhachHang_MaKH foreign key(MaKhachHang) references KhachHang(MaKhachHang)

create table CPU
(
	MaCPU nvarchar(10),
	GiaTien int,
	ChungLoai nvarchar(20),
	NamSanXuat int,
	BaoHanh nvarchar(10),
	HangSanXuat nvarchar(15),
	Socket nvarchar(10),
	TocDo nvarchar(10),
	LoaiBusHoTro nvarchar(20),
	DungLuongToiDa nvarchar(10),
	SoKenhBoNhoToiDa tinyint,
	NhanCPU tinyint,
	LuongCPU tinyint,
	BoNhoDem nvarchar(10),
	TDP nvarchar(10),
	XuatXu nvarchar(15),
	TenCPU nvarchar(30),
	constraint pk_CPU_MaCPU primary key(MaCPU)
)
go

create table ChiTietDonHang
(
	MaDonHang nvarchar(10),
	MaCPU nvarchar(10),
	SoLuongBan int,
	DonGia int
)
go

alter table ChiTietDonHang add constraint fk_ChiTietDH_MaDH foreign key (MaDonHang) references DonHang (MaDonHang),constraint fk_ChiTietDH_MaCPU foreign key (MaCPU) references CPU (MaCPU)

create table CuaHang
(
	MaCuaHang nvarchar(10),
	DiaChi nvarchar(50),
	SDT varchar(15),
	TenCuaHang nvarchar(20),
	constraint pk_CuaHang_MaCH primary key(MaCuaHang)
)

create table CPU_CuaHang
(
	MaCPU nvarchar(10),
	MaCuaHang nvarchar(10),
	SoLuong int,
	constraint fk_CPU_CuaHang_MaCPU foreign key (MaCPU) references CPU (MaCPU),
	constraint fk_CPU_CuaHang_MaCuaHang foreign key (MaCuaHang) references CuaHang (MaCuaHang)
)

INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SDT, DiaChi, GioiTinh, NgaySinh, UuDai, Emails)
VALUES (N'KH001', N'Nguyễn Vân Anh', '0987654321', N'Hà Nội', '0', '1990-01-01', N'5%', N'nuyenvana@gmail.com');
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SDT, DiaChi, GioiTinh, NgaySinh, UuDai, Emails)
VALUES (N'KH002', N'Nguyễn Thị Bình', '0912345678', N'HCM', '0', '1995-05-05', N'10%' ,N'nguyenthib@gmail.com');
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SDT, DiaChi, GioiTinh, NgaySinh, UuDai, Emails)
VALUES (N'KH003', N'Trần Văn Trung', '0967890123', N'Da Nang', '1', '1985-12-15', '15%', N'tranvanc@gmail.com');
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SDT, DiaChi, GioiTinh, NgaySinh, UuDai, Emails)
VALUES (N'KH004', N'Trần Thi Diep', '0977777777', N'Binh Duong', '0', '2000-02-02', N'20%', N'tranthid@gmail.com');
INSERT INTO KhachHang (MaKhachHang, TenKhachHang, SDT, DiaChi, GioiTinh, NgaySinh, UuDai, Emails)
VALUES (N'KH005', N'Lê Văn Nam', '0911111111', N'Vinh Phuc', '1', '1998-08-08', N'25%', N'levane@gmail.com');

INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV001', N'Quản lý', N'Nguyễn Văn Nam', 1, '0987654321');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV002', N'Nhân viên', N'Trần Thị Hà', 0, '0123456789');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV003', N'Nhân viên', N'Lê Văn Chung', 1, '0912345678');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV004', N'Nhân viên', N'Hoàng Thị Diệp', 0, '0909090909');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV005', N'Nhân viên', N'Nguyễn Tuấn Anh', 1, '0123456789');

INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH001', '2022-04-30', 4, N'VD001', 10, N'NV001',  N'KH001', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH002', '2022-04-01', 3, N'VD002', 0, N'NV002',  N'KH002', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH003', '2022-02-12', 5, N'VD003', 20, N'NV003',  N'KH003', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH004', '2022-02-13', 2, N'VD004', 0, N'NV004',  N'KH004', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH005', '2022-02-14', 5, N'VD005', 15, N'NV004',  N'KH005', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH006', '2022-02-14', 5, N'VD006', 15, N'NV005',  N'KH004', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH007', '2022-06-11', 4, N'VD007', 10, N'NV001',  N'KH001', N'Đã giao hàng');


INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU001', N'Intel Core i7-11700K', 8299, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.6GHZ', N'DMI 3.0', N'128', 2, 4, 8, N'16MB', N'125W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU002', N'AMD Ryzen 9 5950X', 20999, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.4', N'PCIe 4.0GHZ', N'128', 2, 8, 16, N'64MB', N'105W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU003', N'Intel Core i9-12900K', 12899, N'Desktop', 2022, N'36', N'Intel', N'LGA 1200', N'3.5GHZ', N'DMI 3.0', N'128', 2, 6, 8, N'16MB', N'125W', N'Trung Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU004', N'AMD Ryzen 7 6800H', 7799, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.7', N'PCIe 4.0GHZ', N'128', 2, 4, 6, N'32MB', N'65W', N'Trung Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU005', N'Intel Core i5-11600K', 5699, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Hàn Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU006', N'Intel Core i5-12600H', 5699, N'Laptop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU007', N'Intel Core i7-11700K', 8299, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.6GHZ', N'DMI 3.0', N'128', 2, 4, 8, N'16MB', N'125W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU008', N'AMD Ryzen 9 5950X', 20999, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.4', N'PCIe 4.0GHZ', N'128', 2, 8, 16, N'64MB', N'105W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU009', N'Intel Core i9-12900K', 12899, N'Desktop', 2022, N'36', N'Intel', N'LGA 1200', N'3.5GHZ', N'DMI 3.0', N'128', 2, 6, 8, N'16MB', N'125W', N'Trung Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU0010', N'AMD Ryzen 7 6800H', 7799, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.7', N'PCIe 4.0GHZ', N'128', 2, 4, 6, N'32MB', N'65W', N'Trung Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU0011', N'Intel Core i5-11600K', 5699, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Hàn Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU0012', N'Intel Core i5-12600H', 5699, N'Laptop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Mỹ');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU0013', N'Intel Core i5-11600K', 5699, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Hàn Quốc');
INSERT INTO CPU (MaCPU, TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu)
VALUES (N'CPU0014', N'Intel Core i5-12600H', 5699, N'Laptop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Mỹ');

INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH001', N'CPU001', 10, 9000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH002', N'CPU002', 20, 23000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH003', N'CPU003', 30, 14000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH004', N'CPU004', 10, 9000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH005', N'CPU005', 14, 6500);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH006', N'CPU003', 20, 14000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH006', N'CPU004', 15, 9000);
INSERT INTO ChiTietDonHang (MaDonHang, MaCPU, SoLuongBan, DonGia)
VALUES (N'DH007', N'CPU002', 5, 23000);

INSERT INTO CuaHang (MaCuaHang, TenCuaHang, SDT, DiaChi)
VALUES (N'CH001', N'Cửa hàng Apple', '0987654321', N'888 Đường Láng');
INSERT INTO CuaHang (MaCuaHang, TenCuaHang, SDT, DiaChi)
VALUES (N'CH002', N'Cửa hàng Samsung', '0123456789', N'Số 3 Cầu Giấy');
INSERT INTO CuaHang (MaCuaHang, TenCuaHang, SDT, DiaChi)
VALUES (N'CH003', N'Cửa hàng Thinh Vuong', '0909090909', N'19 Nguyễn Chí Thanh');
INSERT INTO CuaHang (MaCuaHang, TenCuaHang, SDT, DiaChi)
VALUES (N'CH004', N'Cửa hàng ShopDunk', '0777777777', N'12 Trần Phú');
INSERT INTO CuaHang (MaCuaHang, TenCuaHang, SDT, DiaChi)
VALUES (N'CH005', N'Cửa hàng Dinh Minh', '0333333333', N'300 Kim Mã');

INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH001', N'CPU001', 100);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH001', N'CPU002', 150);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH001', N'CPU003', 200);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH001', N'CPU004', 160);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH001', N'CPU005', 300); 
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU006', 100);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU007', 150);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU008', 240);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU009', 260);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU0010', 300); 
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH002', N'CPU0011', 150);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH003', N'CPU0012', 200);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH004', N'CPU0013', 160);
INSERT INTO CPU_CuaHang (MaCuaHang, MaCPU, SoLuong)
VALUES (N'CH005', N'CPU0014', 300); 

-- Cau 1
SELECT * FROM CPU
SELECT DISTINCT HangSanXuat
FROM CPU
WHERE NamSanXuat = 2020 

-- Cau 2
SELECT * FROM CuaHang
SELECT TenCuaHang 
FROM CuaHang
WHERE DiaChi = N'Số 3 Cầu Giấy'


-- Cau 3
SELECT * FROM CPU
SELECT MaCPU, TenCPU
FROM CPU
WHERE XuatXu = N'Mỹ' AND GiaTien > 10000;
-- Giatien don vi nghin : 10 trieu = 10000 


-- Cau 4
SELECT * FROM DonHang
SELECT MaDonHang 
FROM DonHang
WHERE NgayDatHang = '2022-04-30' AND DanhGia = 4;


-- Cau 5
SELECT * FROM NhanVien
SELECT * FROM DonHang
SELECT TenNhanVien 
FROM NhanVien, DonHang
WHERE NgayDatHang = '2022-04-01' and NhanVien.MaNhanVien = DonHang.MaNhanVien;


-- Cau 6
SELECT * FROM CPU
SELECT * FROM CuaHang
SELECT * FROM CPU_CuaHang
SELECT TenCPU, SoLuong
FROM CPU, CuaHang, CPU_CuaHang
WHERE CPU.MaCPU = CPU_CuaHang.MaCPU 
	AND CPU_CuaHang.MaCuaHang = CuaHang.MaCuaHang 
	AND TenCuaHang = N'Cửa hàng Thinh Vuong';

-- Cau 7
SELECT * FROM CPU
SELECT * FROM ChiTietDonHang
SELECT * FROM DonHang
SELECT * FROM KhachHang
SELECT TenKhachHang
FROM CPU, ChiTietDonHang, DonHang, KhachHang
WHERE  CPU.MaCPU = ChiTietDonHang.MaCPU
	AND ChiTietDonHang.MaDonHang = DonHang.MaDonHang
	AND DonHang.MaKhachHang = KhachHang.MaKhachHang
	AND CPU.NamSanXuat = 2021
	AND CPU.HangSanXuat = N'Intel'

-- Cau 8
SELECT * FROM ChiTietDonHang
SELECT * FROM CPU
SELECT TenCPU
FROM CPU
WHERE MaCPU not in
	(
	SELECT DISTINCT CPU.MaCPU FROM ChiTietDonHang, CPU
	WHERE ChiTietDonHang.MaCPU = CPU.MaCPU
	)


-- Cau 9
SELECT * FROM KhachHang
SELECT * FROM DonHang
SELECT TenKhachHang
FROM KhachHang
WHERE MaKhachHang not in
	(
		SELECT KhachHang.MaKhachHang FROM KhachHang, DonHang
		WHERE KhachHang.MaKhachHang = DonHang.MaKhachHang
			AND DonHang.NgayDatHang >= '2022-04-01'
	)


-- Cau 10
SELECT * FROM ChiTietDonHang
SELECT * FROM CPU
SELECT TenCPU, SoluongBan
FROM CPU, ChiTietDonHang
WHERE ChiTietDonHang.MaCPU = CPU.MaCPU
	AND ChiTietDonHang.SoLuongBan <> 0


-- Cau 11
select * from ChiTietDonHang
select *
from DonHang as DH
where DH.MaDonHang in
(
	select MaDonHang
	from ChiTietDonHang as CTDH, CPU
	where TenCPU = N'Intel Core i9-12900K'
	and CTDH.MaCPU = CPU.MaCPU
	and MaDonHang in (
		select MaDonHang
		from ChiTietDonHang as CTDH, CPU
		where TenCPU = N'AMD Ryzen 7 6800H'
		and CTDH.MaCPU = CPU.MaCPU
	)
)

--12
select * from ChiTietDonHang

select CTDH.MaCPU, sum(SoLuongBan) as TongSLB
into ThongKeBanHang
from ChiTietDonHang as CTDH
group by CTDH.MaCPU

select CPU.MaCPU,CPU.TenCPU,TongSLB
from ThongKeBanHang as TKBH,CPU
where TKBH.MaCPU = CPU.MaCPU
and TongSLB =
(
	select max(TongSLB)
	from ThongKeBanHang
)

drop table ThongKeBanHang

--13
select * from KhachHang
select * from DonHang
select KH.MaKhachHang, count(DH.MaDonHang) as SoLanMua
into ThongKeKhachHang
from DonHang as DH, KhachHang as KH
where NgayDatHang >= '2022-01-01' and NgayDatHang<='2022-12-31' and DH.MaKhachHang = KH.MaKhachHang
group by KH.MaKhachHang

select KH.*, SoLanMua
from ThongKeKhachHang as TKKH,KhachHang as KH
where TKKH.MaKhachHang = KH.MaKhachHang
and SoLanMua = (
	select max(SoLanMua)
	from ThongKeKhachHang
)

drop table ThongKeKhachHang

--14
select	distinct DH.MaDonHang,DH.MaNhanVien into ThongKeDonHangNV
from CuaHang as CH, CPU_CuaHang, ChiTietDonHang as CTDH, DonHang as DH
where CH.DiaChi = N'888 Đường Láng'
and CH.MaCuaHang = CPU_CuaHang.MaCuaHang and CPU_CuaHang.MaCPU = CTDH.MaCPU and CTDH.MaDonHang = DH.MaDonHang

select MaNhanVien,count(TKDHNV.MaDonHang) as SoDonNhan into SoDonNhanVienNhan
from ThongKeDonHangNV as TKDHNV
group by TKDHNV.MaNhanVien

--drop table ThongKeDonHangNV

select NV.*,SoDonNhan from SoDonNhanVienNhan as SDNVN,NhanVien as NV
where NV.MaNhanVien = SDNVN.MaNhanVien and SoDonNhan = (
	select max(SoDonNhan)
	from SoDonNhanVienNhan
)

drop table SoDonNhanVienNhan


--15 
select CH.MaCuaHang,CTDH.MaDonHang,CTDH.MaCPU,SoLuongBan , DonGia
from CuaHang as CH,CPU_CuaHang,ChiTietDonHang as CTDH
where CH.MaCuaHang= CPU_CuaHang.MaCuaHang and CPU_CuaHang.MaCPU = CTDH.MaCPU

select CH.MaCuaHang,sum(SoLuongBan * DonGia) as DoanhThu
into DoanhThu
from CuaHang as CH,CPU_CuaHang,ChiTietDonHang as CTDH
where CH.MaCuaHang= CPU_CuaHang.MaCuaHang and CPU_CuaHang.MaCPU = CTDH.MaCPU
group by CH.MaCuaHang

select CuaHang.*, DoanhThu
from DoanhThu, CuaHang
where DoanhThu.MaCuaHang = CuaHang.MaCuaHang AND DoanhThu = (
	select MAX(DoanhThu)
	from DoanhThu
)
drop table DoanhThu
