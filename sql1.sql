create database CPU003
go


use CPU003
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
VALUES (N'KH001', N'Nguyễn Vân Anh', '0987654321', N'Hà Nội', '0', '1990-01-01', N'5', N'nuyenvana@gmail.com');
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
VALUES (N'NV002', N'Nhân viên bán hàng', N'Trần Thị Hà', 0, '0123456789');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV003', N'Kế toán', N'Lê Văn Chung', 1, '0912345678');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV004', N'Nhân viên vệ sinh', N'Hoàng Thị Diệp', 0, '0909090909');
INSERT INTO NhanVien (MaNhanVien, ChucVu, TenNhanVien, GioiTinh, SDT)
VALUES (N'NV005', N'Nhân viên IT', N'Nguyễn Hữu Trung', 1, '0123456789');

INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH001', '2022-04-30', 4, N'VD001', 10, N'NV001',  N'KH001', N'Đang xử lý');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH002', '2022-04-01', 3, N'VD002', 0, N'NV002',  N'KH002', N'Đã giao hàng');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH003', '2022-02-12', 5, N'VD003', 20, N'NV003',  N'KH003', N'Đang vận chuyển');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH004', '2022-02-13', 2, N'VD004', 0, N'NV004',  N'KH004', N'Đã hủy');
INSERT INTO DonHang (MaDonHang, NgayDatHang, DanhGia, MaVanDon, GiamGia, MaNhanVien, MaKhachHang, TrangThai)
VALUES (N'DH005', '2022-02-14', 5, N'VD005', 15, N'NV005',  N'KH005', N'Đã giao hàng');

INSERT INTO CuaHang (MaCuaHang,TenCuaHang, SDT, DiaChi)
VALUES (N'CH001',N'Cửa hàng A', '0987654321', N'888 Đường Láng');
INSERT INTO CuaHang (MaCuaHang,TenCuaHang, SDT, DiaChi)
VALUES (N'CH002',N'Cửa hàng B', '0123456789', N'Số 3 Cầu Giấy');
INSERT INTO CuaHang (MaCuaHang,TenCuaHang, SDT, DiaChi)
VALUES (N'CH003',N'Cửa hàng C', '0909090909', N'789 Đường MNO, Quận 3, TP.HCM');
INSERT INTO CuaHang (MaCuaHang,TenCuaHang, SDT, DiaChi)
VALUES (N'CH004',N'Cửa hàng D', '0777777777', N'246 Đường PQR, Quận 4, TP.HCM');
INSERT INTO CuaHang (MaCuaHang,TenCuaHang, SDT, DiaChi)
VALUES (N'CH005',N'Cửa hàng E', '0333333333', N'135 Đường UVW, Quận 5, TP.HCM');


INSERT INTO CPU (MaCPU,TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu, SoLuongTon)
VALUES (N'CPU001', N'Intel Core i7-11700K', 8299000, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.6GHZ', N'DMI 3.0', N'128', 2, 4, 8, N'16MB', N'125W', N'Việt Nam', 50);
INSERT INTO CPU (MaCPU,TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu, SoLuongTon)
VALUES (N'CPU002', N'AMD Ryzen 9 5950X', 20999000, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.4', N'PCIe 4.0GHZ', N'128', 2, 8, 16, N'64MB', N'105W', N'Mỹ', 20);
INSERT INTO CPU (MaCPU,TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu, SoLuongTon)
VALUES (N'CPU003', N'CH003', N'Intel Core i9-12900K', 12899000, N'Desktop', 2022, N'36', N'Intel', N'LGA 1200', N'3.5GHZ', N'DMI 3.0', N'128', 2, 6, 8, N'16MB', N'125W', N'Việt Nam', 30);
INSERT INTO CPU (MaCPU,TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu, SoLuongTon)
VALUES (N'CPU004',N'AMD Ryzen 7 6800H', 7799000, N'Desktop', 2020, N'36', N'AMD', N'AM4', N'3.7', N'PCIe 4.0GHZ', N'128', 2, 4, 6, N'32MB', N'65W', N'Trung Quốc', 15);
INSERT INTO CPU (MaCPU,TenCPU, GiaTien, ChungLoai, NamSanXuat, BaoHanh, HangSanXuat, Socket, TocDo, LoaiBusHoTro, DungLuongToiDa, SoKenhBoNhoToiDa, NhanCPU, LuongCPU, BoNhoDem, TDP, XuatXu, SoLuongTon)
VALUES (N'CPU005',N'Intel Core i5-11600K', 5699000, N'Desktop', 2021, N'36', N'Intel', N'LGA 1200', N'3.9GHZ', N'DMI 3.0', N'128', 2, 6, 6, N'12MB', N'125W', N'Hàn Quốc', 40);

INSERT INTO ChiTietDonHang(MaDonHang,MaCPU,SoLuongBan)
VALUES (N'DH001',N'CPU001',4)

INSERT INTO CPU_CuaHang()
VALUES()