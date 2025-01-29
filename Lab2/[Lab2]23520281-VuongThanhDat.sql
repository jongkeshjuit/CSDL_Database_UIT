/*
USE master
DROP DATABASE QuanLyBanHang
GO
USE master
DROP DATABASE QuanLyGiaoVu
GO
*/
---------------------------------------------BAI TAP 1-----------------------------------------------------------------------
---------------------------------------------QUAN LY BAN HANG----------------------------------------------------------------
USE master
CREATE DATABASE QuanLyBanHang
GO
USE QuanLyBanHang

CREATE TABLE KHACHHANG
(
	MAKH char(4) CONSTRAINT PK_KHACHHANG PRIMARY KEY,--NOT NULL
	HOTEN varchar(40),
	DCHI varchar(50),
	SODT varchar(20),
	NGSINH smalldatetime,
	DOANHSO money,
	NGDK smalldatetime,
)

CREATE TABLE NHANVIEN
(
	MANV char(4) CONSTRAINT PK_NHANVIEN PRIMARY KEY,--NOT NULL
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime
)


CREATE TABLE SANPHAM
(
	MASP char(4) CONSTRAINT PK_SANPHAM PRIMARY KEY,--NOT NULL
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40),
	GIA money
)

CREATE TABLE HOADON
(
	SOHD int CONSTRAINT PK_HOADON PRIMARY KEY,--NOT NULL
	NGHD smalldatetime,
	MAKH char(4),
	MANV char(4),
	TRIGIA money
)

CREATE TABLE CTHD
(
	SOHD int,--NOT NULL
	MASP char(4),--NOT NULL
	SL int,
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD, MASP)
)

-- 1.Nhập dữ liệu cho các quan hệ trên.
--="('"&A2&"', N'"&B2&"', '"&TEXT(C2,"yyyy-mm-dd")&"', "&IF(D2="Null","NULL","'"&D2&"'")&"),"
--="('"&a2&"','"&b2&"','"&TEXT(c2,"yyyy-mm-dd")&"','"&d2&"'),"

SET DATEFORMAT ymd

INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK) VALUES
('KH01', 'Nguyen Van A', '731 Tran Hung Dao, Q5, TpHCM', '08823451', '1960-10-22', 13060000, '2006-07-22'),
('KH02', 'Tran Ngoc Han', '23/5 Nguyen Trai, Q5, TpHCM', '0908256478', '1974-04-03', 280000, '2006-07-30'),
('KH03', 'Tran Ngoc Linh', '45 Nguyen Canh Chan, Q1, TpHCM', '0938776266', '1980-06-12', 3860000, '2006-08-05'),
('KH04', 'Tran Minh Long', '50/34 Le Dai Hanh, Q10, TpHCM', '0917325476', '1965-03-09', 250000, '2006-10-02'),
('KH05', 'Le Nhat Minh', '34 Truong Dinh, Q3, TpHCM', '08246108', '1950-03-10', 21000, '2006-10-28'),
('KH06', 'Le Hoai Thuong', '227 Nguyen Van Cu, Q5, TpHCM', '08631738', '1981-12-31', 915000, '2006-11-24'),
('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM', '0916783565', '1971-04-06', 12500, '2006-12-01'),
('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '0938435756', '1971-01-10', 365000, '2006-12-13'),
('KH09', 'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM', '08654763', '1979-09-03', 70000, '2007-01-14'),
('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '08768904', '1983-05-02', 67500, '2007-01-16');

INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES
('NV01', 'Nguyen Nhu Nhut', '0927345678', '2006-04-13'),
('NV02', 'Le Thi Phi Yen', '0987567390', '2006-04-21'),
('NV03', 'Nguyen Van B', '0997047382', '2006-04-27'),
('NV04', 'Ngo Thanh Tuan', '0913758498', '2006-06-24'),
('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '2006-07-20');

INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES
('BC01', 'But chi', 'cay', 'Singapore', 3000),
('BC02', 'But chi', 'cay', 'Singapore', 5000),
('BC03', 'But chi', 'cay', 'Viet Nam', 3500),
('BC04', 'But chi', 'hop', 'Viet Nam', 30000),
('BB01', 'But bi', 'cay', 'Viet Nam', 5000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 7000),
('BB03', 'But bi', 'hop', 'Thai Lan', 100000),
('TV01', 'Tap 100 giay mong', 'quyen', 'Trung Quoc', 2500),
('TV02', 'Tap 200 giay mong', 'quyen', 'Trung Quoc', 4500),
('TV03', 'Tap 100 giay tot', 'quyen', 'Viet Nam', 3000),
('TV04', 'Tap 200 giay tot', 'quyen', 'Viet Nam', 5500),
('TV05', 'Tap 100 trang', 'chuc', 'Viet Nam', 23000),
('TV06', 'Tap 200 trang', 'chuc', 'Viet Nam', 53000),
('TV07', 'Tap 100 trang', 'chuc', 'Trung Quoc', 34000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000);

INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH01', 'NV02', 840000),
(1003, '2006-08-23', 'KH02', 'NV01', 100000),
(1004, '2006-09-01', 'KH02', 'NV01', 180000),
(1005, '2006-10-20', 'KH01', 'NV02', 3800000),
(1006, '2006-10-16', 'KH01', 'NV03', 2430000),
(1007, '2006-10-28', 'KH03', 'NV03', 510000),
(1008, '2006-10-28', 'KH01', 'NV03', 440000),
(1009, '2006-10-28', 'KH03', 'NV04', 200000),
(1010, '2006-11-01', 'KH01', 'NV01', 5200000),
(1011, '2006-11-04', 'KH04', 'NV03', 250000),
(1012, '2006-11-30', 'KH05', 'NV03', 21000),
(1013, '2006-12-12', 'KH06', 'NV01', 5000),
(1014, '2006-12-31', 'KH03', 'NV02', 3150000),
(1015, '2007-01-01', 'KH06', 'NV01', 910000),
(1016, '2007-01-01', 'KH07', 'NV02', 12500),
(1017, '2007-01-02', 'KH08', 'NV03', 35000),
(1018, '2007-01-13', 'KH08', 'NV03', 330000),
(1019, '2007-01-13', 'KH01', 'NV03', 30000),
(1020, '2007-01-14', 'KH09', 'NV04', 70000),
(1021, '2007-01-16', 'KH10', 'NV03', 67500),
(1022, '2007-01-16', NULL, 'NV03', 7000),
(1023, '2007-01-17', NULL, 'NV01', 330000);

INSERT INTO CTHD (SOHD, MASP, SL) VALUES
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'TV07', 20),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 100),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1014, 'BB02', 100),
(1014, 'BC04', 60),
(1014, 'BB01', 50),
(1015, 'BB02', 30),
(1015, 'BB03', 7),
(1016, 'TV01', 5),
(1017, 'TV02', 1),
(1017, 'TV03', 1),
(1017, 'TV04', 5),
(1018, 'ST04', 6),
(1019, 'ST05', 1),
(1019, 'ST06', 2),
(1020, 'ST07', 10),
(1021, 'ST08', 5),
(1021, 'TV01', 7),
(1021, 'TV02', 10),
(1022, 'ST07', 1),
(1023, 'ST04', 6);


ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY (MANv) REFERENCES NHANVIEN(MANV)

ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_HOADON FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)

ALTER TABLE CTHD ADD CONSTRAINT FK_CTHD_SANPHAM FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)

-- CAU 2: THEM THUOC TINH GHICHU KIEU VARCHAR(20) CHO QUAN HE SANPHAM

ALTER TABLE SANPHAM ADD GHICHU varchar(20)

-- CAU 3: THEM THUOC TINH LOAIKH KIEU TINYINT CHO QUAN HE KHACH HANG

ALTER TABLE KHACHHANG ADD LOAIKH tinyint

-- CAU 4: SUA KIEU DU LIEU GHICHU TRONG QUAN HE SANPHAM THANH VARCHAR(100)

ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100)

-- CAU 5: XOA THUOC TINH GHICHU TRONG QUAN HE SANPHAM

ALTER TABLE SANPHAM DROP COLUMN GHICHU

-- CAU 6: THUOC TINH LOAIKH TRONG QUAN HE KHACHHANG CO THE LUU GIA TRI:"Vang lai","Thuong xuyen", "Vip"

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(20)

-- CAU 7: DON VI TINH CUA SANPHAM CHI CO THE LA (“cay”,”hop”,”cai”,”quyen”,”chuc”)

ALTER TABLE SANPHAM ADD CHECK (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')
--ALTER TABLE SANPHAM ADD CHECK(DVT in ('cay', 'hop', 'cai', 'quyen', 'chuc'))

--CAU 8:GIA BAN CUA SANPHAM TU 500 DONG TRO LEN

ALTER TABLE SANPHAM ADD CHECK(GIA>=500)

-- CAU 9: MOI LAN MUA HANG, KHACHHANG PHAI MUA IT NHAT 1 SANPHAM

ALTER TABLE CTHD ADD CHECK(SL>=1)

-- CAU 10:NGAY KHACHHANG DANG KY LA KHACHHANG THANH VIEN PHAI LON HON NGAY SINH CUA NGUOI DO

ALTER TABLE KHACHHANG ADD CHECK(NGDK > NGSINH)

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(10)

---------------------------------------------BAI TAP 2----------------------------------------------------------------
--------------------------------------------QUAN LY GIAO VU-----------------------------------------------------------
USE master
CREATE DATABASE QuanLyGiaoVu
GO
USE QuanLyGiaoVu

CREATE TABLE KHOA
(
	MAKHOA varchar(4) CONSTRAINT PK_KHOA PRIMARY KEY,
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRGKHOA char(4)
)

CREATE TABLE MONHOC
(
	MAMH varchar(10) CONSTRAINT PK_MONHOC PRIMARY KEY,
	TENMH varchar(40),
	TCLT tinyint,
	TCTH tinyint,
	MAKHOA varchar(4)
)

CREATE TABLE DIEUKIEN
(
	MAMH varchar(10),
	MAMH_TRUOC varchar(10),
	 CONSTRAINT PK_MAMH PRIMARY KEY(MAMH, MAMH_TRUOC)
)

CREATE TABLE GIAOVIEN
(
	MAGV char(4) CONSTRAINT PK_GIAOVIEN PRIMARY KEY,
	HOTEN varchar(40),
	HOCVI varchar(10),
	HOCHAM varchar(10),
	GIOITINH varchar(3),
	NGSINH smalldatetime,
	NGVL smalldatetime,
	HESO numeric(4,2),
	MUCLUONG money,
	MAKHOA varchar(4)
)

CREATE TABLE LOP
(
	MALOP char(3) CONSTRAINT PK_LOP PRIMARY KEY,
	TENLOP varchar(40),
	TRGLOP char(5),
	SISO tinyint,
	MAGVCN char(4)
)

CREATE TABLE HOCVIEN
(
	MAHV char(5) CONSTRAINT PK_HOCVIEN PRIMARY KEY,
	HO varchar(40),
	TEN varchar(10),
	NGSINH smalldatetime,
	GIOITINH varchar(3),
	NOISINH varchar(40),
	MALOP char(3)
)

CREATE TABLE GIANGDAY
(
	MALOP char(3),
	MAMH varchar(10),
	MAGV char(4),
	HOCKY tinyint,
	NAM smallint,
	TUNGAY smalldatetime,
	DENNGAY smalldatetime,
	CONSTRAINT PK_GIANGDAY PRIMARY KEY(MALOP, MAMH)
)

CREATE TABLE KETQUATHI
(
	MAHV char(5),
	MAMH varchar(10),
	LANTHI tinyint,
	NGTHI smalldatetime,
	DIEM numeric(4,2),
	KQUA varchar(10)
	 CONSTRAINT PK_KETQUATHI PRIMARY KEY(MAHV, MAMH, LANTHI)
)

--="('"&A2&"','"&B2&"','"&TEXT(C2,"dd-mm-yyyy")&"','"&D2&"'),"
--="('"&A2&"', N'"&B2&"', '"&TEXT(C2,"yyyy-mm-dd")&"', "&IF(D2="Null","NULL","'"&D2&"'")&"),"

SET DATEFORMAT DMY

INSERT INTO KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA) VALUES
('KHMT','Khoa hoc may tinh','06-07-2005','GV01'),
('HTTT','He thong thong tin','06-07-2005','GV02'),
('CNPM','Cong nghe phan mem','06-07-2005','GV04'),
('MTT','Mang va truyen thong','20/10/2005','GV03'),
('KTMT','Ky thuat may tinh','20/12/2005',NULL)

INSERT INTO LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES
('K11','Lop 1 khoa 1','K1108','11','GV07' ),
('K12','Lop 2 khoa 1','K1205','12','GV09' ),
('K13','Lop 3 khoa 1','K1305','12','GV14' )

INSERT INTO MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES
('THDC','Tin hoc dai cuong','4','1','KHMT'),
('CTRR','Cau truc roi rac','5','2','KHMT'),
('CSDL','Co so du lieu','3','1','HTTT'),
('CTDLGT','Cau truc du lieu va giai thuat','3','1','KHMT'),
('PTTKTT','Phan tich thiet ke thuat toan','3','0','KHMT'),
('DHMT','Do hoa may tinh','3','1','KHMT'),
('KTMT','Kien truc may tinh','3','0','KTMT'),
('TKCSDL','Thiet ke co so du lieu','3','1','HTTT'),
('PTTKHTTT','Phan tich thiet ke he thong thong tin','4','1','HTTT'),
('HDH','He dieu hanh','4','1','KTMT'),
('NMCNPM','Nhap mon cong nghe phan mem','3','0','CNPM'),
('LTCFW','Lap trinh C for win','3','1','CNPM'),
('LTHDT','Lap trinh huong doi tuong','3','1','CNPM')

INSERT INTO GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES
('K11','THDC','GV07',1,2006,'01-02-2006','2006-12-05'),
('K12','THDC','GV06',1,2006,'01-02-2006','2006-12-05'),
('K13','THDC','GV15',1,2006,'01-02-2006','2006-12-05'),
('K11','CTRR','GV02',1,2006,'01-09-2006','17/5/2006'),
('K12','CTRR','GV02',1,2006,'01-09-2006','17/5/2006'),
('K13','CTRR','GV08',1,2006,'01-09-2006','17/5/2006'),
('K11','CSDL','GV05',2,2006,'06-01-2006','15/7/2006'),
('K12','CSDL','GV09',2,2006,'06-01-2006','15/7/2006'),
('K13','CTDLGT','GV15',2,2006,'06-01-2006','15/7/2006'),
('K13','CSDL','GV05',3,2006,'08-01-2006','15/12/2006'),
('K13','DHMT','GV07',3,2006,'08-01-2006','15/12/2006'),
('K11','CTDLGT','GV15',3,2006,'08-01-2006','15/12/2006'),
('K12','CTDLGT','GV15',3,2006,'08-01-2006','15/12/2006'),
('K11','HDH','GV04',1,2007,'01-02-2007','18/2/2007'),
('K12','HDH','GV04',1,2007,'01-02-2007','20/3/2007'),
('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')


INSERT INTO GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES
('GV01','Ho Thanh Son','PTS','GS','Nam','05-02-1950','01-11-2004',5,2250000,'KHMT'),
('GV02','Tran Tam Thanh','TS','PGS','Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT'),
('GV03','Do Nghiem Phung','TS','GS','Nu','08-01-1950','23/9/2004',4,1800000,'CNPM'),
('GV04','Tran Nam Son','TS','PGS','Nam','22/2/1961','01-12-2005',4.5,2025000,'KTMT'),
('GV05','Mai Thanh Danh','ThS','GV','Nam','03-12-1958','01-12-2005',3,1350000,'HTTT'),
('GV06','Tran Doan Hung','TS','GV','Nam','03-11-1953','01-12-2005',4.5,2025000,'KHMT'),
('GV07','Nguyen Minh Tien','ThS','GV','Nam','23/11/1971','03-01-2005',4,1800000,'KHMT'),
('GV08','Le Thi Tran','KS','Null','Nu','26/3/1974','03-01-2005',1.69,760500,'KHMT'),
('GV09','Nguyen To Lan','ThS','GV','Nu','31/12/1966','03-01-2005',4,1800000,'HTTT'),
('GV10','Le Tran Anh Loan','KS','Null','Nu','17/7/1972','03-01-2005',1.86,837000,'CNPM'),
('GV11','Ho Thanh Tung','CN','GV','Nam','01-12-1980','15/5/2005',2.67,1201500,'MTT'),
('GV12','Tran Van Anh','CN','Null','Nu','29/3/1981','15/5/2005',1.69,760500,'CNPM'),
('GV13','Nguyen Linh Dan','CN','Null','Nu','23/5/1980','15/5/2005',1.69,760500,'KTMT'),
('GV14','Truong Minh Chau','ThS','GV','Nu','30/11/1976','15/5/2005',3,1350000,'MTT'),
('GV15','Le Ha Thanh','ThS','GV','Nam','05-04-1978','15/5/2005',3,1350000,'KHMT')


INSERT INTO DIEUKIEN (MAMH, MAMH_TRUOC) VALUES
('CSDL','CTRR'),
('CSDL','CTDLGT'),
('CTDLGT','THDC'),
('PTTKTT','THDC'),
('PTTKTT','CTDLGT'),
('DHMT','THDC'),
('LTHDT','THDC'),
('PTTKHTTT','CSDL')

INSERT INTO KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
('K1101','CSDL','1','20/7/2006','10','Dat'),
('K1101','CTDLGT','1','28/12/2006','9','Dat'),
('K1101','THDC','1','20/5/2006','9','Dat'),
('K1101','CTRR','1','13/5/2006','9.5','Dat'),
('K1102','CSDL','1','20/7/2006','4','Khong Dat'),
('K1102','CSDL','2','27/7/2006','4.25','Khong Dat'),
('K1102','CSDL','3','08-10-2006','4.5','Khong Dat'),
('K1102','CTDLGT','1','28/12/2006','4.5','Khong Dat'),
('K1102','CTDLGT','2','01-05-2007','4','Khong Dat'),
('K1102','CTDLGT','3','15/1/2007','6','Dat'),
('K1102','THDC','1','20/5/2006','5','Dat'),
('K1102','CTRR','1','13/5/2006','7','Dat'),
('K1103','CSDL','1','20/7/2006','3.5','Khong Dat'),
('K1103','CSDL','2','27/7/2006','8.25','Dat'),
('K1103','CTDLGT','1','28/12/2006','7','Dat'),
('K1103','THDC','1','20/5/2006','8','Dat'),
('K1103','CTRR','1','13/5/2006','6.5','Dat'),
('K1104','CSDL','1','20/7/2006','3.75','Khong Dat'),
('K1104','CTDLGT','1','28/12/2006','4','Khong Dat'),
('K1104','THDC','1','20/5/2006','4','Khong Dat'),
('K1104','CTRR','1','13/5/2006','4','Khong Dat'),
('K1104','CTRR','2','20/5/2006','3.5','Khong Dat'),
('K1104','CTRR','3','30/6/2006','4','Khong Dat'),
('K1201','CSDL','1','20/7/2006','6','Dat'),
('K1201','CTDLGT','1','28/12/2006','5','Dat'),
('K1201','THDC','1','20/5/2006','8.5','Dat'),
('K1201','CTRR','1','13/5/2006','9','Dat'),
('K1202','CSDL','1','20/7/2006','8','Dat'),
('K1202','CTDLGT','1','28/12/2006','4','Khong Dat'),
('K1202','CTDLGT','2','01-05-2007','5','Dat'),
('K1202','THDC','1','20/5/2006','4','Khong Dat'),
('K1202','THDC','2','27/5/2006','4','Khong Dat'),
('K1202','CTRR','1','13/5/2006','3','Khong Dat'),
('K1202','CTRR','2','20/5/2006','4','Khong Dat'),
('K1202','CTRR','3','30/6/2006','6.25','Dat'),
('K1203','CSDL','1','20/7/2006','9.25','Dat'),
('K1203','CTDLGT','1','28/12/2006','9.5','Dat'),
('K1203','THDC','1','20/5/2006','10','Dat'),
('K1203','CTRR','1','13/5/2006','10','Dat'),
('K1204','CSDL','1','20/7/2006','8.5','Dat'),
('K1204','CTDLGT','1','28/12/2006','6.75','Dat'),
('K1204','THDC','1','20/5/2006','4','Khong Dat'),
('K1204','CTRR','1','13/5/2006','6','Dat'),
('K1301','CSDL','1','20/12/2006','4.25','Khong Dat'),
('K1301','CTDLGT','1','25/7/2006','8','Dat'),
('K1301','THDC','1','20/5/2006','7.75','Dat'),
('K1301','CTRR','1','13/5/2006','8','Dat'),
('K1302','CSDL','1','20/12/2006','6.75','Dat'),
('K1302','CTDLGT','1','25/7/2006','5','Dat'),
('K1302','THDC','1','20/5/2006','8','Dat'),
('K1302','CTRR','1','13/5/2006','8.5','Dat'),
('K1303','CSDL','1','20/12/2006','4','Khong Dat'),
('K1303','CTDLGT','1','25/7/2006','4.5','Khong Dat'),
('K1303','CTDLGT','2','08-07-2006','4','Khong Dat'),
('K1303','CTDLGT','3','15/8/2006','4.25','Khong Dat'),
('K1303','THDC','1','20/5/2006','4.5','Khong Dat'),
('K1303','CTRR','1','13/5/2006','3.25','Khong Dat'),
('K1303','CTRR','2','20/5/2006','5','Dat'),
('K1304','CSDL','1','20/12/2006','7.75','Dat'),
('K1304','CTDLGT','1','25/7/2006','9.75','Dat'),
('K1304','THDC','1','20/5/2006','5.5','Dat'),
('K1304','CTRR','1','13/5/2006','5','Dat'),
('K1305','CSDL','1','20/12/2006','9.25','Dat'),
('K1305','CTDLGT','1','25/7/2006','10','Dat'),
('K1305','THDC','1','20/5/2006','8','Dat'),
('K1305','CTRR','1','13/5/2006','10','Dat')

INSERT INTO HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) VALUES
('K1101','Nguyen Van','A','27/1/1986','Nam','TpHCM','K11'),
('K1102','Tran Ngoc','Han','14/3/1986','Nu','Kien Giang','K11'),
('K1103','Ha Duy','Lap','18/4/1986','Nam','Nghe An','K11'),
('K1104','Tran Ngoc','Linh','30/3/1986','Nu','Tay Ninh','K11'),
('K1105','Tran Minh','Long','27/2/1986','Nam','TpHCM','K11'),
('K1106','Le Nhat','Minh','24/1/1986','Nam','TpHCM','K11'),
('K1107','Nguyen Nhu','Nhut','27/1/1986','Nam','Ha Noi','K11'),
('K1108','Nguyen Manh','Tam','27/2/1986','Nam','Kien Giang','K11'),
('K1109','Phan Thi Thanh','Tam','27/1/1986','Nu','Vinh Long','K11'),
('K1110','Le Hoai','Thuong','02-05-1986','Nu','Can Tho','K11'),
('K1111','Le Ha','Vinh','25/12/1986','Nam','Vinh Long','K11'),
('K1201','Nguyen Van','B','02-11-1986','Nam','TpHCM','K12'),
('K1202','Nguyen Thi Kim','Duyen','18/1/1986','Nu','TpHCM','K12'),
('K1203','Tran Thi Kim','Duyen','17/9/1986','Nu','TpHCM','K12'),
('K1204','Truong My','Hanh','19/5/1986','Nu','Dong Nai','K12'),
('K1205','Nguyen Thanh','Nam','17/4/1986','Nam','TpHCM','K12'),
('K1206','Nguyen Thi Truc','Thanh','03-04-1986','Nu','Kien Giang','K12'),
('K1207','Tran Thi Bich','Thuy','02-08-1986','Nu','Nghe An','K12'),
('K1208','Huynh Thi Kim','Trieu','04-08-1986','Nu','Tay Ninh','K12'),
('K1209','Pham Thanh','Trieu','23/2/1986','Nam','TpHCM','K12'),
('K1210','Ngo Thanh','Tuan','14/2/1986','Nam','TpHCM','K12'),
('K1211','Do Thi','Xuan','03-09-1986','Nu','Ha Noi','K12'),
('K1212','Le Thi Phi','Yen','03-12-1986','Nu','TpHCM','K12'),
('K1301','Nguyen Thi Kim','Cuc','06-09-1986','Nu','Kien Giang','K13'),
('K1302','Truong Thi My','Hien','18/3/1986','Nu','Nghe An','K13'),
('K1303','Le Duc','Hien','21/3/1986','Nam','Tay Ninh','K13'),
('K1304','Le Quang','Hien','18/4/1986','Nam','TpHCM','K13'),
('K1305','Le Thi','Huong','27/3/1986','Nu','TpHCM','K13'),
('K1306','Nguyen Thai','Huu','30/3/1986','Nam','Ha Noi','K13'),
('K1307','Tran Minh','Man','28/5/1986','Nam','TpHCM','K13'),
('K1308','Nguyen Hieu','Nghia','04-08-1986','Nam','Kien Giang','K13'),
('K1309','Nguyen Trung','Nghia','18/1/1987','Nam','Nghe An','K13'),
('K1310','Tran Thi Hong','Tham','22/4/1986','Nu','Tay Ninh','K13'),
('K1311','Tran Minh','Thuc','04-04-1986','Nam','TpHCM','K13'),
('K1312','Nguyen Thi Kim','Yen','09-07-1986','Nu','TpHCM','K13')

-- MAKHOA
ALTER TABLE MONHOC ADD CONSTRAINT FK_MONHOC_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)

ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_GIAOVIEN_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)

-- MAMH

ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DIEUKIEN_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_DIEUKIEN_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)

ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GIANGDAY_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KETQUATHI_MONHOC FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)

-- MAGV

ALTER TABLE LOP ADD CONSTRAINT FK_LOP_MAGV FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)

ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GIANGDAY_MAGV FOREIGN KEY (MAGV) REFERENCES GIAOVIEN(MAGV)

-- MALOP
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_HOCVIEN_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

ALTER TABLE GIANGDAY ADD CONSTRAINT FK_GIANGDAY_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

-- MAHV

ALTER TABLE KETQUATHI ADD CONSTRAINT FK_KETQUATHI_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)

-- TRGLOP

ALTER TABLE LOP ADD CONSTRAINT FK_LOP_TRGLOP FOREIGN KEY (TRGLOP) REFERENCES HOCVIEN(MAHV)

-- THEM 3 THUOC TINH GHICHU, DIEMTB, XEPLOAI CHO QUAN HE HOCVIEN

ALTER TABLE HOCVIEN ADD GHICHU varchar(20)

ALTER TABLE HOCVIEN ADD DIEMTB numeric(4,2)

ALTER TABLE HOCVIEN ADD XEPLOAI varchar(15)

-- CAU 3: THUOC TINH GIOITINH CHI CO GIA TRI LA: "NAM" OR "NU"

ALTER TABLE HOCVIEN ADD CHECK(GIOITINH ='NAM' OR GIOITINH ='NU')
--ALTER TABLE HOCVIEN ADD CHECK(GIOITINH IN ('NAM', 'NU'))

ALTER TABLE GIAOVIEN ADD CHECK(GIOITINH ='NAM' OR GIOITINH ='NU')
--ALTER TABLE GIAOVIEN ADD CHECK(GIOITINH IN ('NAM', 'NU'))

-- CAU 4: DIEM SO CUA MOT LAN THI CO GIA TRI TU 0-10 VA CAN LUU DEN 2 SO LE (VD:6.22)
--SELECT MAX(DIEM) AS MaxDiem FROM KETQUATHI;
ALTER TABLE KETQUATHI ALTER COLUMN DIEM numeric(4,2)

-- CAU 5:KET QUA LA "DAT" NEU DIEM TU 5-10 VA "KHONG DAT" NEU DIEM NHO HON 5

ALTER TABLE KETQUATHI ADD CHECK(KQUA = IIF(DIEM BETWEEN 5 AND 10, 'Dat', 'Khong dat'))

-- CAU 6: HOC VIEN THI MOT MON TOI DA 3 LAN

ALTER TABLE KETQUATHI ADD CHECK(LANTHI<=3)

-- CAU 7: HOC KY CHI CO GIA TRI TU 1 DEN 3 

ALTER TABLE GIANGDAY ADD CHECK(HOCKY BETWEEN 1 AND 3)

-- CAU 8: HOC VI CUA GIAO VIEN CHI CO THE LA "CN", "KS","Ths","TS","PTS"

ALTER TABLE GIAOVIEN ADD CHECK(HOCVI = 'CN' OR HOCVI = 'KS' OR HOCVI = 'Ths' OR HOCVI = 'TS' OR HOCVI = 'PTS')
--ALTER TABLE GIAOVIEN ADD CHECK(HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))

---------------------------------------------BAI TAP 3-----------------------------------------------------------------------
/*
SELECT *FROM SANPHAM1
SELECT *FROM KHACHHANG1
*/

--2.Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.

USE QuanLyBanHang
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG
GO
/*
CREATE TABLE SANPHAM1 AS SELECT * FROM SANPHAM;
CREATE TABLE KHACHHANG1 AS SELECT * FROM KHACHHANG;
*/
--3.Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)

UPDATE SANPHAM1 SET GIA += GIA * 0.05 
WHERE NUOCSX = 'Thai Lan' 
GO
/*UPDATE SANPHAM1
SET GIA = GIA * 1.05
WHERE NUOCSX = 'Thai Lan';*/
--SELECT *FROM SANPHAM1

--4.Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).

UPDATE SANPHAM1 SET GIA -= GIA * 0.05 
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000
GO
/*UPDATE SANPHAM1
SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000;*/
--SELECT *FROM SANPHAM1

--5.Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 
-- trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).

UPDATE KHACHHANG1 SET LOAIKH = 'VIP' 
WHERE (NGDK < '1/1/2007' AND DOANHSO >= 10000000) OR (NGDK > '1/1/2007' AND DOANHSO >= 2000000)
GO

---------------------------------------------BAI TAP 4-----------------------------------------------------------------------

--11.	Học viên ít nhất là 18 tuổi.

USE QuanLyGiaoVu
GO
ALTER TABLE HOCVIEN ADD CONSTRAINT CHECK_HOCVIEN_TUOI CHECK(DATEDIFF(YEAR,NGSINH,GETDATE())>18)
--SELECT *FROM HOCVIEN

--12.	Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).

SELECT * FROM GIANGDAY WHERE TUNGAY >= DENNGAY

UPDATE GIANGDAY
SET DENNGAY = DATEADD(day, 1, TUNGAY)
WHERE TUNGAY >= DENNGAY

ALTER TABLE GIANGDAY
ADD CONSTRAINT CHECK_GIANGDAY_NGAY CHECK (TUNGAY < DENNGAY)

--SELECT *FROM GIANGDAY

--13.	Giáo viên khi vào làm ít nhất là 22 tuổi.

ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_TUOI_GIAOVIEN_TREN_22 CHECK(DATEDIFF(YEAR,NGSINH,NGVL)>=22)

--14.	Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.

ALTER TABLE MONHOC ADD CONSTRAINT CHECK_TINCHI CHECK(ABS(TCLT-TCTH)<=3)

---------------------------------------------BAI TAP 5-----------------------------------------------------------------------

--1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.

USE QuanLyBanHang
GO
SELECT MASP,TENSP 
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' 

--2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.

SELECT MASP, TENSP
FROM SANPHAM WHERE ( DVT = 'cay' OR DVT = 'quyen' )

/*
SELECT MASP, TENSP
FROM SANPHAM WHERE DVT IN ('cay', 'quyen');
*/
--3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

SELECT MASP, TENSP
FROM SANPHAM WHERE ( LEFT(MASP,1)='B' AND RIGHT(MASP,2)='01')

/*
SELECT MASP, TENSP
FROM SANPHAM WHERE MASP LIKE 'B%01';
*/
--4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000;

--5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan') AND GIA BETWEEN 30000 AND 40000;

--6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

SELECT SOHD, TRIGIA
FROM HOADON WHERE NGHD BETWEEN '2007-01-01' AND '2007-01-02'
/*
SELECT SOHD, TRIGIA
FROM HOADON WHERE NGHD IN ('2007-01-01', '2007-01-02');
*/
--7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).

SELECT SOHD, TRIGIA
FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC;

--8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE HOADON.NGHD = '2007-01-01';

/*SELECT DISTINCT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE HD.NGHD = '2007-01-01';
*/
--9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.

SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON
JOIN NHANVIEN ON HOADON.MANV = NHANVIEN.MANV
WHERE NHANVIEN.HOTEN = 'Nguyen Van B' AND HOADON.NGHD = CONVERT(SMALLDATETIME, '2006-10-28', 120)

--10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.

SELECT DISTINCT SP.MASP, SP.TENSP
FROM SANPHAM SP
JOIN CTHD ON SP.MASP = CTHD.MASP
JOIN HOADON HD ON CTHD.SOHD = HD.SOHD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE KH.HOTEN = 'Nguyen Van A' AND MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006;

--11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.

/*SELECT SOHD 
FROM CTHD WHERE MASP IN ('BB01') 
	UNION
SELECT SOHD 
FROM CTHD WHERE MASP IN ('BB02') 

SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB01' OR MASP = 'BB02';
*/
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02');

---------------------------------------------BAI TAP 6-----------------------------------------------------------------------

--1.	In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.

USE QuanLyGiaoVu
GO
SELECT HV.MAHV, HV.HO, HV.TEN, HV.NGSINH, HV.MALOP
FROM HOCVIEN HV
JOIN LOP L ON HV.MAHV = L.TRGLOP;

--2.	In ra bảng điểm khi thi (mã học viên, họ tên, lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.

SELECT HV.MAHV, HV.HO, HV.TEN, KQ.LANTHI, KQ.DIEM
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP = 'K12' AND KQ.MAMH = 'CTRR'
ORDER BY HV.TEN ASC, HV.HO ASC;

--3.	In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.

SELECT HV.MAHV, HV.HO, HV.TEN, MH.TENMH
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
JOIN MONHOC MH ON KQ.MAMH = MH.MAMH
WHERE KQ.LANTHI = 1 AND KQ.KQUA = 'Dat';

--4.	In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).

SELECT HV.MAHV, HV.HO, HV.TEN
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP = 'K11' AND KQ.MAMH = 'CTRR' AND KQ.LANTHI = 1 AND KQ.KQUA = 'Khong Dat';

--5.	* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).

SELECT DISTINCT HV.MAHV, HV.HO, HV.TEN
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP LIKE 'K%' AND KQ.MAMH = 'CTRR' AND KQ.KQUA = 'Khong Dat';

