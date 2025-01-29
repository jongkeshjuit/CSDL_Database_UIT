﻿------------------------------------------------------LAB1-----------------------------------------------------------------------------
/*
USE master
DROP DATABASE QuanLyBanHang
GO
USE master
DROP DATABASE QuanLyGiaoVu
GO
*/
--------------------------------------------------QUAN LY BAN HANG---------------------------------------------------------------------

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

--Sinh viên hoàn thành Phần I bài tập QuanLyBanHang từ câu 2 đến câu 10.
--I. 2.	Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.

ALTER TABLE SANPHAM ADD GHICHU varchar(20)

--I.  3.	Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.

ALTER TABLE KHACHHANG ADD LOAIKH tinyint

--I.  4.	Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).

ALTER TABLE SANPHAM ALTER COLUMN GHICHU varchar(100)

--I. 5.	Xóa thuộc tính GHICHU trong quan hệ SANPHAM.

ALTER TABLE SANPHAM DROP COLUMN GHICHU

--I. 6.	Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”…

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(20)

--I.  7.	Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)

ALTER TABLE SANPHAM ADD CHECK (DVT = 'cay' OR DVT = 'hop' OR DVT = 'cai' OR DVT = 'quyen' OR DVT = 'chuc')

--ALTER TABLE SANPHAM ADD CHECK(DVT in ('cay', 'hop', 'cai', 'quyen', 'chuc'))

--I. 8.	Giá bán của sản phẩm từ 500 đồng trở lên.

ALTER TABLE SANPHAM ADD CHECK(GIA>=500)

--I. 9.	Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.

ALTER TABLE CTHD ADD CHECK(SL>=1)

--I.  10.	Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.

ALTER TABLE KHACHHANG ADD CHECK(NGDK > NGSINH)

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH varchar(10)

------------------------------------------------------LAB2-----------------------------------------------------------------------------
--3. Sinh viên hoàn thành Phần II bài tập QuanLyBanHang từ câu 2 đến câu 5.
/*
SELECT *FROM SANPHAM1
SELECT *FROM KHACHHANG1
*/

--II. 2.Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.

USE QuanLyBanHang
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG
GO
/*
CREATE TABLE SANPHAM1 AS SELECT * FROM SANPHAM;
CREATE TABLE KHACHHANG1 AS SELECT * FROM KHACHHANG;
*/
--II. 3.Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)

UPDATE SANPHAM1 SET GIA += GIA * 0.05 
WHERE NUOCSX = 'Thai Lan' 
GO
/*UPDATE SANPHAM1
SET GIA = GIA * 1.05
WHERE NUOCSX = 'Thai Lan';*/
--SELECT *FROM SANPHAM1

--II. 4.Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).

UPDATE SANPHAM1 SET GIA -= GIA * 0.05 
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000
GO
/*UPDATE SANPHAM1
SET GIA = GIA * 0.95
WHERE NUOCSX = 'Trung Quoc' AND GIA <= 10000;*/
--SELECT *FROM SANPHAM1

--II. 5.Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 
-- trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).

UPDATE KHACHHANG1 SET LOAIKH = 'VIP' 
WHERE (NGDK < '1/1/2007' AND DOANHSO >= 10000000) OR (NGDK > '1/1/2007' AND DOANHSO >= 2000000)
GO

--5. Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 1 đến câu 11
--III. 1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.

USE QuanLyBanHang
GO
SELECT MASP,TENSP 
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' 

--III. 2.	In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.

SELECT MASP, TENSP
FROM SANPHAM WHERE ( DVT = 'cay' OR DVT = 'quyen' )

/*
SELECT MASP, TENSP
FROM SANPHAM WHERE DVT IN ('cay', 'quyen');
*/
--III. 3.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.

SELECT MASP, TENSP
FROM SANPHAM WHERE ( LEFT(MASP,1)='B' AND RIGHT(MASP,2)='01')

/*
SELECT MASP, TENSP
FROM SANPHAM WHERE MASP LIKE 'B%01';
*/
--III. 4.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' AND GIA BETWEEN 30000 AND 40000;

--III. 5.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.

SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan') AND GIA BETWEEN 30000 AND 40000;

--III. 6.	In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

SELECT SOHD, TRIGIA
FROM HOADON WHERE NGHD BETWEEN '2007-01-01' AND '2007-01-02'
/*
SELECT SOHD, TRIGIA
FROM HOADON WHERE NGHD IN ('2007-01-01', '2007-01-02');
*/
--III. 7.	In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).

SELECT SOHD, TRIGIA
FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC;

--III. 8.	In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT KHACHHANG.MAKH, KHACHHANG.HOTEN
FROM KHACHHANG
JOIN HOADON ON KHACHHANG.MAKH = HOADON.MAKH
WHERE HOADON.NGHD = '2007-01-01';

/*SELECT DISTINCT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE HD.NGHD = '2007-01-01';
*/
--III. 9.	In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.

SELECT HOADON.SOHD, HOADON.TRIGIA
FROM HOADON
JOIN NHANVIEN ON HOADON.MANV = NHANVIEN.MANV
WHERE NHANVIEN.HOTEN = 'Nguyen Van B' AND HOADON.NGHD = CONVERT(SMALLDATETIME, '2006-10-28', 120)

--III. 10.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.

SELECT DISTINCT SP.MASP, SP.TENSP
FROM SANPHAM SP
JOIN CTHD ON SP.MASP = CTHD.MASP
JOIN HOADON HD ON CTHD.SOHD = HD.SOHD
JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE KH.HOTEN = 'Nguyen Van A' AND MONTH(HD.NGHD) = 10 AND YEAR(HD.NGHD) = 2006;

--III. 11.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.

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

------------------------------------------------------LAB3-----------------------------------------------------------------------------
--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang câu 12 và câu 13.

--III. 12.	Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

SELECT HD.SOHD
FROM CTHD 
JOIN SANPHAM SP  ON CTHD.MASP  = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE SP.MASP = 'BB01' AND SL BETWEEN 10 AND 20
	UNION
SELECT HD.SOHD
FROM CTHD 
JOIN SANPHAM SP  ON CTHD.MASP  = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE SP.MASP = 'BB02' AND SL BETWEEN 10 AND 20

--III. 13.	Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.

SELECT HD.SOHD
FROM CTHD 
JOIN SANPHAM SP  ON CTHD.MASP  = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE SP.MASP = 'BB01' AND SL BETWEEN 10 AND 20
	INTERSECT
SELECT HD.SOHD
FROM CTHD 
JOIN SANPHAM SP  ON CTHD.MASP  = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE SP.MASP = 'BB02' AND SL BETWEEN 10 AND 20

--Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 14 đến 18.
--III. 14.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.

SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NUOCSX = 'Trung Quoc'
	UNION
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
JOIN CTHD ON CTHD.MASP = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE NGHD = '1/1/2007'

--III. 15.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

SELECT SP1.MASP, SP1.TENSP
FROM SANPHAM SP1
	EXCEPT
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
JOIN CTHD ON SP2.MASP = CTHD.MASP

--III.16.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.

SELECT SP1.MASP, SP1.TENSP
FROM SANPHAM SP1
	EXCEPT
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
JOIN CTHD ON SP2.MASP = CTHD.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(HD.NGHD) = 2006

--III.17.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.

SELECT SP1.MASP, SP1.TENSP
FROM SANPHAM SP1
WHERE SP1.NUOCSX = 'Trung Quoc'
	EXCEPT
SELECT SP2.MASP, SP2.TENSP
FROM SANPHAM SP2
JOIN CTHD ON SP2.MASP = CTHD.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(HD.NGHD) = 2006

--III.18.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
-- HOADON TRONG NAM 2006 KHONG DO SINGAPORE SX KHONG MUA

SELECT HD.SOHD
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006
AND NOT EXISTS( SELECT *
				FROM SANPHAM SP
				WHERE NUOCSX = 'Singapore'
				AND NOT EXISTS( SELECT*
								FROM CTHD 
								WHERE HD.SOHD = CTHD.SOHD
								AND SP.MASP = CTHD.MASP))
------------------------------------------------------LAB4-----------------------------------------------------------------------------
USE QuanLyBanHang
GO
--Bài tập 1 Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 19 đến 30

--19.	Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
-- CACH 1
SELECT COUNT(*) SOHOADON
FROM HOADON HD
WHERE HD.MAKH NOT IN(
					SELECT KH.MAKH
					FROM KHACHHANG KH
					WHERE KH.MAKH = HD.MAKH
)
-- CACH 2
SELECT COUNT(*) SOHOADON
FROM HOADON HD
WHERE NOT EXISTS(
	SELECT *
	FROM KHACHHANG KH
	WHERE HD.MAKH = KH.MAKH
)
-- CACH 3
SELECT COUNT(*) SOHOADON
FROM HOADON 
WHERE MAKH IS NULL

--20.	Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
-- CACH 1
SELECT COUNT(DISTINCT CTHD.MASP)  SOSANPHAM
FROM CTHD, HOADON HD 
WHERE CTHD.SOHD = HD.SOHD AND YEAR(HD.NGHD) = 2006
-- CACH 2
WITH SOSANPHAM AS(
	SELECT MASP
	FROM CTHD C, HOADON HD
	WHERE C.SOHD = HD.SOHD AND YEAR(HD.NGHD) = 2006
	GROUP BY MASP
)
SELECT COUNT(*) SOSANPHAM
FROM SOSANPHAM

--21.	Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
SELECT MAX(HD.TRIGIA) AS GIAMAX, MIN(HD.TRIGIA) AS GIAMIN
FROM HOADON HD

--22.	Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(HD.TRIGIA) AS GIATRUNGBINH2006
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006

--23.	Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(HD.TRIGIA) AS TONGDOANHTHU2006
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006

--24.	Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
-- CACH 1
SELECT HD.SOHD
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006 AND TRIGIA = (
											SELECT MAX(HD.TRIGIA)
											FROM HOADON HD
)
-- CACH 2
SELECT TOP 1 SOHD 
FROM HOADON 
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC

--25.	Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
-- CACH 1
SELECT KH.HOTEN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH AND YEAR(HD.NGHD) = 2006 AND TRIGIA = (
																SELECT MAX(HD.TRIGIA)
																FROM HOADON HD
)
-- CACH 2
SELECT TOP 1 WITH TIES K.HOTEN
FROM KHACHHANG K, HOADON H
WHERE K.MAKH = H.MAKH
AND YEAR(H.NGHD) = 2006
ORDER BY H.TRIGIA DESC

--26.	In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
-- CACH 1
SELECT  TOP 3 KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
ORDER BY KH.DOANHSO DESC
-- CACH 2
SELECT TOP 3 K.MAKH, K.HOTEN, SUM(H.TRIGIA) AS DoanhSo
FROM KHACHHANG K
JOIN HOADON H ON K.MAKH = H.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SUM(H.TRIGIA) DESC;

--27.	In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
-- CACH 1
SELECT SP.MASP, SP.TENSP, SP.GIA
FROM SANPHAM SP
WHERE GIA IN (
				SELECT DISTINCT TOP 3 SP.GIA 
				FROM SANPHAM SP
				ORDER BY SP.GIA DESC
				)

--28.	In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
-- CACH 1
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'Thai Lan' AND GIA IN (
										  SELECT DISTINCT TOP 3 SP.GIA 
										  FROM SANPHAM SP
										  ORDER BY SP.GIA DESC
										)
-- CACH 2
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan'
AND GIA IN (
    SELECT TOP 3 GIA
    FROM SANPHAM
    ORDER BY GIA DESC
);

--29.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
-- CACH 1
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'Trung Quoc' AND GIA IN (
											SELECT  DISTINCT TOP 3 SP.GIA
											FROM SANPHAM SP
											WHERE SP.NUOCSX = 'Trung Quoc'
											ORDER BY SP.GIA DESC
											)
-- CACH 2
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
AND GIA IN (
    SELECT TOP 3 GIA
    FROM SANPHAM
    WHERE NUOCSX = 'Trung Quoc'
    ORDER BY GIA DESC
);

--30.	* In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
-- CACH 1
SELECT TOP 3 KH.MAKH, KH.HOTEN, RANK() OVER (ORDER BY KH.DOANHSO DESC) RANK_KH
FROM KHACHHANG KH
-- CACH 2
SELECT TOP 3 WITH TIES K.MAKH, K.HOTEN, SUM(H.TRIGIA) AS DoanhSo
FROM KHACHHANG K
JOIN HOADON H ON K.MAKH = H.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SUM(H.TRIGIA) DESC;

--Bài tập 3 Sinh viên hoàn thành Phần III bài tập QuanLyBanHang từ câu 31 đến 45.
--31.	Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
-- CACH 1 LA DEM MASP
SELECT COUNT(SP.MASP) AS TONGSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'Trung Quoc'
-- CACH 2 LA DEM SO LUONG TRONG CTHD
SELECT SUM(SL) AS TotalProducts
FROM CTHD C
JOIN SANPHAM S ON C.MASP = S.MASP
WHERE S.NUOCSX = 'Trung Quoc';
-- DAP AN KHAC NHAU--> CACH 2 CO VE HOP LY

--32.	Tính tổng số sản phẩm của từng nước sản xuất.
-- CACH 1
SELECT SP.NUOCSX, COUNT(SP.MASP) AS TONGSP
FROM SANPHAM SP
GROUP BY SP.NUOCSX
-- CACH 2
SELECT S.NUOCSX, SUM(C.SL) AS TotalProducts
FROM CTHD C
JOIN SANPHAM S ON C.MASP = S.MASP
GROUP BY S.NUOCSX;
-- UU TIEN CACH 2

--33.	Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT SP.NUOCSX, MAX(SP.GIA) GIAMAX, MIN(SP.GIA) GIAMIN, AVG(SP.GIA) GIATB 
FROM SANPHAM SP
GROUP BY SP.NUOCSX

--34.	Tính doanh thu bán hàng mỗi ngày.
SELECT HD.NGHD, SUM(HD.TRIGIA) AS DOANHTHU
FROM HOADON HD
GROUP BY HD.NGHD

--35.	Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT CTHD.MASP, SUM(CTHD.SL) AS SOLUONG
FROM CTHD, HOADON HD
WHERE CTHD.SOHD = HD.SOHD AND YEAR(HD.NGHD) = 2006 AND MONTH(HD.NGHD) = 10
GROUP BY CTHD.MASP

--36.	Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(HD.NGHD) THANG, SUM(HD.TRIGIA) DOANHTHU
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006
GROUP BY MONTH(HD.NGHD)

--37.	Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT CTHD.SOHD
FROM CTHD 
GROUP BY CTHD.SOHD
HAVING COUNT(DISTINCT CTHD.MASP) >= 4

--38.	Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT CT.SOHD
FROM SANPHAM SP, CTHD CT
WHERE CT.MASP = SP.MASP AND SP.NUOCSX = 'Viet Nam'
GROUP BY CT.SOHD
HAVING COUNT(SP.MASP) = 3

--39.	Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
-- CACH 1
SELECT TOP 1 WITH TIES KH.MAKH, KH.HOTEN, COUNT(HD.SOHD) SOLAN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
GROUP BY KH.MAKH, KH.HOTEN
ORDER BY SOLAN DESC
-- CACH 2
SELECT MAKH, HOTEN FROM (
	SELECT HD.MAKH, HOTEN, RANK() OVER (ORDER BY COUNT(HD.MAKH) DESC) RANK_SOLAN 
	FROM HOADON HD INNER JOIN KHACHHANG KH 
	ON HD.MAKH = KH.MAKH
	GROUP BY HD.MAKH, HOTEN
) A
WHERE RANK_SOLAN = 1
-- CACH 3
SELECT KH.MAKH, KH.HOTEN, COUNT(HD.SOHD) SOLAN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
GROUP BY KH.MAKH, KH.HOTEN
HAVING COUNT(HD.SOHD) >= ALL (
				SELECT COUNT(HD.SOHD) SOLAN
				FROM KHACHHANG KH, HOADON HD
				WHERE KH.MAKH = HD.MAKH
				GROUP BY KH.MAKH, KH.HOTEN	
)

--40.	Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
-- CACH 1
SELECT TOP 1 WITH TIES MONTH(HD.NGHD) THANG, SUM(HD.TRIGIA) DOANHSO
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006
GROUP BY MONTH(HD.NGHD)
ORDER BY SUM(HD.TRIGIA) DESC

--CACH 2
SELECT THANG FROM (
	SELECT MONTH(NGHD) THANG, RANK() OVER (ORDER BY SUM(TRIGIA) DESC) RANK_TRIGIA FROM HOADON
	WHERE YEAR(NGHD) = '2006' 
	GROUP BY MONTH(NGHD)
) A
WHERE RANK_TRIGIA = 1

--41.	Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
-- CACH 1
SELECT DISTINCT TOP 1 WITH TIES SP.MASP, SP.TENSP, SUM(CTHD.SL) TONGSANPHAM
FROM SANPHAM SP, CTHD, HOADON HD
WHERE SP.MASP = CTHD.MASP AND CTHD.SOHD = HD.SOHD AND YEAR(HD.NGHD) = '2006' 
GROUP BY SP.MASP, SP.TENSP
ORDER BY SUM(CTHD.SL) ASC

--CACH 2 
SELECT A.MASP, TENSP FROM (
	SELECT MASP, RANK() OVER (ORDER BY SUM(SL)) RANK_SL
	FROM CTHD CT INNER JOIN HOADON HD
	ON CT.SOHD = HD.SOHD
	WHERE YEAR(NGHD) = '2006'
	GROUP BY MASP
) A INNER JOIN SANPHAM SP
ON A.MASP = SP.MASP
WHERE RANK_SL = 1

--42.	*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
--CACH 1
SELECT TOP 1 WITH TIES NUOCSX, MASP, TENSP, GIA
FROM SANPHAM
ORDER BY ROW_NUMBER() OVER (PARTITION BY NUOCSX ORDER BY GIA DESC);
--CACH 2
SELECT NUOCSX, MASP, TENSP FROM (
	SELECT NUOCSX, MASP, TENSP, GIA, RANK() OVER (PARTITION BY NUOCSX ORDER BY GIA DESC) RANK_GIA FROM SANPHAM
) A 
WHERE RANK_GIA = 1

--43.	Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
SELECT NUOCSX FROM SANPHAM 
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

--44.	*Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
--CACH 1
SELECT TOP 1 K.MAKH, K.HOTEN, COUNT(HD.SOHD) SOLAN
FROM 
(
SELECT TOP 10  KH.MAKH, KH.HOTEN, SUM(DOANHSO) DOANHSO
FROM KHACHHANG KH
GROUP BY KH.MAKH,KH.HOTEN
ORDER BY DOANHSO DESC
)K, HOADON HD
WHERE K.MAKH = HD.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SOLAN DESC
/*
CO THE DUNG WITH ... AS DE THAY THE BANG K CHO TUONG MINH HON
WITH K AS(
	SELECT TOP 10  KH.MAKH, KH.HOTEN, SUM(DOANHSO) DOANHSO
	FROM KHACHHANG KH
	GROUP BY KH.MAKH,KH.HOTEN
	ORDER BY DOANHSO DESC
)
SELECT TOP 1 K.MAKH, K.HOTEN, COUNT(HD.SOHD) SOLAN
FROM K, HOADON HD
WHERE K.MAKH = HD.MAKH
GROUP BY K.MAKH, K.HOTEN
ORDER BY SOLAN DESC
*/
--CACH 2
SELECT MAKH, HOTEN FROM (
	SELECT TOP 10 HD.MAKH, HOTEN, DOANHSO, RANK() OVER (ORDER BY COUNT(HD.MAKH) DESC) RANK_SOLAN 
	FROM HOADON HD INNER JOIN KHACHHANG KH 
	ON HD.MAKH = KH.MAKH
	GROUP BY HD.MAKH, HOTEN, DOANHSO
	ORDER BY DOANHSO DESC
) A
WHERE RANK_SOLAN = 1
-- CACH 3
SELECT TOP 1 K.MAKH, K.HOTEN, COUNT(H.SOHD) AS PurchaseCount
FROM KHACHHANG K
JOIN HOADON H ON K.MAKH = H.MAKH
WHERE K.MAKH IN (
    SELECT TOP 10 K1.MAKH
    FROM KHACHHANG K1
    JOIN HOADON H1 ON K1.MAKH = H1.MAKH
    GROUP BY K1.MAKH
    ORDER BY SUM(H1.TRIGIA) DESC
)
GROUP BY K.MAKH, K.HOTEN
ORDER BY COUNT(H.SOHD) DESC;

------------------------------------------------------LAB5-----------------------------------------------------------------------------
USE QuanLyBanHang
GO
--Bài tập 1 Sinh viên hoàn thành Phần I bài tập QuanLyBanHang từ câu 11 đến 14.
--11.	Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK).
-- CACH 1
CREATE TRIGGER trg_ins_hd ON HOADON
AFTER INSERT
AS
BEGIN 
	IF EXISTS(SELECT *
		FROM INSERTED, KHACHHANG
		WHERE INSERTED.MAKH = KHACHHANG.MAKH
		AND NGHD < NGDK)
	BEGIN 
		RAISERROR('LOI: NGAY HOA DON KHONG HOP LE!', 16, 1);
		ROLLBACK TRANSACTION
	END
	ELSE 
	BEGIN
		PRINT 'THEM MOI HOA DON THANH CONG!'
	END
END
-- CACH 2
GO
CREATE TRIGGER TRG_INS_HD_1 ON HOADON
AFTER INSERT
AS 
BEGIN
	IF(
		(SELECT COUNT(*)
		FROM INSERTED, KHACHHANG 
		WHERE INSERTED.MAKH = KHACHHANG.MAKH
		AND NGHD < NGDK) > 0
		)
	BEGIN 
		RAISERROR('LOI: NGAY HOA DON KHONG HOP LE', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM MOI HOA DON THANH CONG'
	END
END
-- CACH 3
GO
CREATE TRIGGER TRG_NGHD_2 ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @NGHD SMALLDATETIME, @MAKH CHAR(4), @NGDK SMALLDATETIME
	SELECT @NGHD = NGHD, @MAKH = MAKH FROM INSERTED 
	SELECT @NGDK = NGDK FROM KHACHHANG WHERE MAKH = @MAKH
	IF (@NGHD < @NGDK)
	BEGIN
		RAISERROR('LOI: NGAY HOA DON KHONG HOP LE', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM MOI HOA DON THANH CONG'
	END
END
GO

--12.	Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm.
CREATE TRIGGER TRG_CHECK_NGHD_NGVL ON HOADON
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED, NHANVIEN
		WHERE INSERTED.MANV = NHANVIEN.MANV
		AND INSERTED.NGHD < NHANVIEN.NGVL
	)
	BEGIN
		RAISERROR('LOI: NGAY BAN HANG KHONG HOP LE!', 16, 1);
		ROLLBACK TRANSACTION;
	END
	ELSE
	BEGIN 
		PRINT 'NGAY BAN HANG HOP LE!';
	END
END;
GO

--13.	Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
-- CACH 1
CREATE TRIGGER HOADON_TRIGIA ON HOADON 
AFTER UPDATE 
AS
BEGIN
	DECLARE @TRIGIA INT, @TONGCTHD_CU INT
	SELECT @TRIGIA = TRIGIA FROM INSERTED 
	SELECT @TONGCTHD_CU = SUM(SL*GIA) FROM DELETED, SANPHAM, CTHD 
	WHERE CTHD.SOHD = DELETED.SOHD AND SANPHAM.MASP = CTHD.MASP 
	GROUP BY DELETED.SOHD
	IF(@TONGCTHD_CU != @TRIGIA)
	BEGIN	
		RAISERROR('LOI: TONG TIEN != SL * DON GIA', 16, 1);
		ROLLBACK TRANSACTION;
	END
	ELSE
	BEGIN 
		PRINT 'TONG TIEN HOP LE!';
	END
END
-- CACH 2
GO
CREATE TRIGGER TRG_UPD_CTHD ON CTHD
AFTER UPDATE
AS
BEGIN 
	UPDATE HOADON 
	SET TRIGIA = TRIGIA
		-(SELECT SUM(SL*GIA)
			FROM DELETED D JOIN SANPHAM S ON D.MASP = S.MASP
			WHERE D.SOHD = HOADON.SOHD
			)
	FROM DELETED D
	WHERE HOADON.SOHD = D.SOHD

	UPDATE HOADON
	SET TRIGIA = TRIGIA
		+(SELECT SUM(SL * GIA)
			FROM INSERTED I JOIN SANPHAM S ON I.MASP = S.MASP
			WHERE I.SOHD = HOADON.SOHD
			)
	FROM INSERTED I
	WHERE HOADON.SOHD = I.SOHD
	PRINT 'TRI GIA CUA CAC HOA DON DA DUOC CAP NHAT!'
END


--14.	Doanh số của một khách hàng là tổng trị giá các hóa đơn mà khách hàng thành viên đó đã mua.
-- CACH 1
GO
CREATE TRIGGER TRG_UPDATE_DOANHSO ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE KHACHHANG
	SET DOANHSO = DOANHSO
		-(SELECT SUM(TRIGIA) FROM DELETED D
			WHERE KHACHHANG.MAKH = D.MAKH
			)
	UPDATE KHACHHANG
	SET DOANHSO = DOANHSO
		+(SELECT SUM(TRIGIA) FROM INSERTED I
			WHERE I.MAKH = KHACHHANG.MAKH
			)
	FROM INSERTED I
	WHERE KHACHHANG.MAKH = I.MAKH
	PRINT 'TRI GIA CUA CAC HOA DON DA DUOC CAP NHAT!'
END
-- CACH 2
GO
CREATE TRIGGER TRG_UPDATE_DOANSO1 ON HOADON
AFTER INSERT, UPDATE
AS
BEGIN
	UPDATE KHACHHANG
	SET DOANHSO = (
	SELECT SUM(TRIGIA)
	FROM HOADON
	WHERE HOADON.MAKH = KHACHHANG.MAKH
	)
	WHERE KHACHHANG.MAKH IN (
	SELECT DISTINCT MAKH FROM INSERTED
	WHERE MAKH IS NOT NULL 
	)
END
------------------------------------------------------LAB1-----------------------------------------------------------------------------
--------------------------------------------------QUAN LY BAN HANG---------------------------------------------------------------------
GO
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

-- Sinh viên hoàn thành Phần I bài tập QuanLyGiaoVu từ câu 3 đến câu 8.
--I. 1. Thêm vào 3 thuộc tính GHICHU, DIEMTB, XEPLOAI cho quan hệ HOCVIEN.

ALTER TABLE HOCVIEN ADD GHICHU varchar(20)

ALTER TABLE HOCVIEN ADD DIEMTB numeric(4,2)

ALTER TABLE HOCVIEN ADD XEPLOAI varchar(15)

--I.  3.	Thuộc tính GIOITINH chỉ có giá trị là “Nam” hoặc “Nu”.

ALTER TABLE HOCVIEN ADD CHECK(GIOITINH ='NAM' OR GIOITINH ='NU')
--ALTER TABLE HOCVIEN ADD CHECK(GIOITINH IN ('NAM', 'NU'))

ALTER TABLE GIAOVIEN ADD CHECK(GIOITINH ='NAM' OR GIOITINH ='NU')
--ALTER TABLE GIAOVIEN ADD CHECK(GIOITINH IN ('NAM', 'NU'))

--I.  4.	Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
--SELECT MAX(DIEM) AS MaxDiem FROM KETQUATHI;
ALTER TABLE KETQUATHI ALTER COLUMN DIEM numeric(4,2)

--I. 5.	Kết quả thi là “Dat” nếu điểm từ 5 đến 10  và “Khong dat” nếu điểm nhỏ hơn 5.

ALTER TABLE KETQUATHI ADD CHECK(KQUA = IIF(DIEM BETWEEN 5 AND 10, 'Dat', 'Khong dat'))

--I.  6.	Học viên thi một môn tối đa 3 lần.

ALTER TABLE KETQUATHI ADD CHECK(LANTHI<=3)

--I.  7.	Học kỳ chỉ có giá trị từ 1 đến 3.

ALTER TABLE GIANGDAY ADD CHECK(HOCKY BETWEEN 1 AND 3)

--I.  8.	Học vị của giáo viên chỉ có thể là “CN”, “KS”, “Ths”, ”TS”, ”PTS”.

ALTER TABLE GIAOVIEN ADD CHECK(HOCVI = 'CN' OR HOCVI = 'KS' OR HOCVI = 'Ths' OR HOCVI = 'TS' OR HOCVI = 'PTS')
--ALTER TABLE GIAOVIEN ADD CHECK(HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS'))

------------------------------------------------------LAB2-----------------------------------------------------------------------------

--4. Sinh viên hoàn thành Phần I bài tập QuanLyGiaoVu từ câu 11 đến câu 14.
--I. 11.	Học viên ít nhất là 18 tuổi.

USE QuanLyGiaoVu
GO
ALTER TABLE HOCVIEN ADD CONSTRAINT CHECK_HOCVIEN_TUOI CHECK(DATEDIFF(YEAR,NGSINH,GETDATE())>18)
--SELECT *FROM HOCVIEN

--I. 12.	Giảng dạy một môn học ngày bắt đầu (TUNGAY) phải nhỏ hơn ngày kết thúc (DENNGAY).

SELECT * FROM GIANGDAY WHERE TUNGAY >= DENNGAY

UPDATE GIANGDAY
SET DENNGAY = DATEADD(day, 1, TUNGAY)
WHERE TUNGAY >= DENNGAY

ALTER TABLE GIANGDAY
ADD CONSTRAINT CHECK_GIANGDAY_NGAY CHECK (TUNGAY < DENNGAY)

--SELECT *FROM GIANGDAY

--I. 13.	Giáo viên khi vào làm ít nhất là 22 tuổi.

ALTER TABLE GIAOVIEN ADD CONSTRAINT CHECK_TUOI_GIAOVIEN_TREN_22 CHECK(DATEDIFF(YEAR,NGSINH,NGVL)>=22)

--I. 14.	Tất cả các môn học đều có số tín chỉ lý thuyết và tín chỉ thực hành chênh lệch nhau không quá 3.

ALTER TABLE MONHOC ADD CONSTRAINT CHECK_TINCHI CHECK(ABS(TCLT-TCTH)<=3)

--6. Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 1 đến câu 5.
--III. 1.	In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.

USE QuanLyGiaoVu
GO
SELECT HV.MAHV, HV.HO, HV.TEN, HV.NGSINH, HV.MALOP
FROM HOCVIEN HV
JOIN LOP L ON HV.MAHV = L.TRGLOP;

--III. 2.	In ra bảng điểm khi thi (mã học viên, họ tên, lần thi, điểm số) môn CTRR của lớp “K12”, sắp xếp theo tên, họ học viên.

SELECT HV.MAHV, HV.HO, HV.TEN, KQ.LANTHI, KQ.DIEM
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP = 'K12' AND KQ.MAMH = 'CTRR'
ORDER BY HV.TEN ASC, HV.HO ASC;

--III. 3.	In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi lần thứ nhất đã đạt.

SELECT HV.MAHV, HV.HO, HV.TEN, MH.TENMH
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
JOIN MONHOC MH ON KQ.MAMH = MH.MAMH
WHERE KQ.LANTHI = 1 AND KQ.KQUA = 'Dat';

--III. 4.	In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở lần thi 1).

SELECT HV.MAHV, HV.HO, HV.TEN
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP = 'K11' AND KQ.MAMH = 'CTRR' AND KQ.LANTHI = 1 AND KQ.KQUA = 'Khong Dat';

--III. 5.	* Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả các lần thi).

SELECT DISTINCT HV.MAHV, HV.HO, HV.TEN
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE HV.MALOP LIKE 'K%' AND KQ.MAMH = 'CTRR' AND KQ.KQUA = 'Khong Dat';

------------------------------------------------------LAB3-----------------------------------------------------------------------------

--Sinh viên hoàn thành Phần II bài tập QuanLyGiaoVu từ câu 1 đến câu 4.

--II. 1.	Tăng hệ số lương thêm 0.2 cho những giáo viên là trưởng khoa.

UPDATE GIAOVIEN
SET GIAOVIEN.HESO += 0.2
WHERE GIAOVIEN.MAGV IN ( SELECT TRGKHOA
						 FROM KHOA)

--II. 2.	Cập nhật giá trị điểm trung bình tất cả các môn học (DIEMTB) của mỗi học viên (tất cả các môn học đều có hệ số 1 và nếu học viên thi một môn nhiều lần, chỉ lấy điểm của lần thi sau cùng).

UPDATE HocVien
SET DiemTB =
(
	SELECT AVG(Diem)
	FROM KetQuaThi
	WHERE LanThi = (SELECT MAX(LanThi) FROM KetQuaThi KQ WHERE MaHV = KetQuaThi.MaHV GROUP BY MaHV)
	GROUP BY MaHV
	HAVING MaHV = HocVien.MaHV
)


--II. 3.	Cập nhật giá trị cho cột GHICHU là “Cam thi” đối với trường hợp: học viên có một môn bất kỳ thi lần thứ 3 dưới 5 điểm.

UPDATE HOCVIEN
SET GHICHU = 'Cam thi'
WHERE MAHV IN 
(
	SELECT MAHV
	FROM KETQUATHI
	WHERE LANTHI = 3 AND DIEM < 5
)

/*
  II. 4.	Cập nhật giá trị cho cột XEPLOAI trong quan hệ HOCVIEN như sau:
o	Nếu DIEMTB >= 9 thì XEPLOAI =”XS”
o	Nếu  8 <= DIEMTB < 9 thì XEPLOAI = “G”
o	Nếu  6.5 <= DIEMTB < 8 thì XEPLOAI = “K”
o	Nếu  5  <=  DIEMTB < 6.5 thì XEPLOAI = “TB”
o	Nếu  DIEMTB < 5 thì XEPLOAI = ”Y”
*/

UPDATE HOCVIEN
SET XEPLOAI =
(
	CASE 
		WHEN DIEMTB >= 9 THEN 'XS'
		WHEN DIEMTB >= 8 AND DIEMTB < 9 THEN 'G'
		WHEN DIEMTB >= 6.5 AND DIEMTB < 8 THEN 'K'
		WHEN DIEMTB >= 5 AND DIEMTB < 6.5 THEN 'TB'
		WHEN DIEMTB < 5 THEN 'Y'
	END
)

--Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 6 đến câu 10.

--III. 6.	Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm 2006.

SELECT DISTINCT MH.TENMH
FROM MONHOC MH
JOIN GIANGDAY GD ON GD.MAMH = MH.MAMH
JOIN GIAOVIEN GV ON GV.MAGV = GD.MAGV
WHERE GV.HOTEN = 'Tran Tam Thanh' AND GD.HOCKY = 1 AND GD.NAM = 2006

--III. 7.	Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy trong học kỳ 1 năm 2006.

SELECT DISTINCT MH.MAMH, MH.TENMH
FROM MONHOC MH
JOIN GIANGDAY GD ON GD.MAMH = MH.MAMH
JOIN GIAOVIEN GV ON GV.MAGV = GD.MAGV
JOIN LOP L ON L.MAGVCN = GV.MAGV
WHERE L.MALOP = 'K11' AND GD.HOCKY = 1 AND GD.NAM = 2006

--III. 8.	Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So Du Lieu”.

SELECT DISTINCT  HV.HO+' '+ HV.TEN HOTEN
FROM HOCVIEN HV
JOIN LOP L ON L.TRGLOP = HV.MAHV
JOIN GIANGDAY GD ON GD.MALOP = L.MALOP
JOIN GIAOVIEN GV ON GV.MAGV = GD.MAGV
JOIN MONHOC MH ON MH.MAMH = GD.MAMH
WHERE GV.HOTEN = 'Nguyen To Lan' AND MH.TENMH = 'Co So Du Lieu'

--III. 9.	In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So Du Lieu”.

SELECT DK.MAMH_TRUOC, MH.TENMH
FROM DIEUKIEN DK
JOIN MONHOC MH ON MH.MAMH = DK.MAMH_TRUOC
WHERE DK.MAMH = 'CSDL'
	
--III. 10.	Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học, tên môn học) nào.

SELECT DK.MAMH, MH.TENMH
FROM DIEUKIEN DK
JOIN MONHOC MH ON MH.MAMH = DK.MAMH
WHERE DK.MAMH_TRUOC = 'CTRR'

--III. 11.	Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1 năm 2006.
--CACH 1
SELECT DISTINCT GV.HOTEN
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MAGV = GV.MAGV
WHERE GD.MALOP IN ('K11', 'K12') AND GD.HOCKY = 1 AND GD.NAM = 2006 AND GD.MAMH = 'CTRR'
--CACH 2
/*
SELECT HoTen
FROM
	GiaoVien, GiangDay
WHERE
	GiaoVien.MaGV = GiangDay.MaGV
	AND MaLop = 'K11'
	AND HocKy = 1 AND Nam = 2006
INTERSECT 
	(SELECT HoTen
	FROM
		GiaoVien, GiangDay
	WHERE
		GiaoVien.MaGV = GiangDay.MaGV
		AND MaLop = 'K12' AND HocKy = 1 AND Nam = 2006)
*/
	
--III. 12.	Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.

SELECT HV.MAHV, HV.HO+' '+HV.TEN HOTEN
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON KQT.MAHV = HV.MAHV
WHERE KQT.KQUA = 'Khong Dat' AND KQT.MAMH = 'CSDL' AND KQT.LANTHI = 1 
	  AND KQT.MAHV NOT IN (
          SELECT MAHV
          FROM KETQUATHI
          WHERE MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = 'Co So Du Lieu') AND LANTHI > 1
      )

--III. 13.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
-- CACH 1
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV NOT IN ( SELECT GD.MAGV
					   FROM GIANGDAY GD)
/* CACH 2
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS ( SELECT *
				   FROM GIANGDAY GD
				   JOIN MONHOC MH ON MH.MAMH = GD.MAMH
				   WHERE GD.MAGV = GV.MAGV
				   AND MH.MAKHOA = GV.MAKHOA)
*/
--III. 14.	Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
-- GIAOVIEN KHONG MONHOC THUOC KHOA GIAO VIEN KHONG DUOC GIANG DAY MON HOC

SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE NOT EXISTS ( SELECT *
				   FROM MONHOC MH
				   WHERE MH.MAKHOA = GV.MAKHOA
				   AND NOT EXISTS ( SELECT *
									  FROM GIANGDAY GD
									  WHERE GD.MAGV = GV.MAGV
									  AND GD.MAMH = MH.MAMH ))

--III. 15.	Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
-- HOCVIEN THUOC LOP K11   VA    LANTHI > 3 KHONG DAT     HOAC     LANTHI = 2  CTRR DIEM =5

SELECT HV.HO + ' ' + HV.TEN HOTEN
FROM HOCVIEN HV
WHERE HV.MALOP IN ( SELECT DISTINCT L.MALOP
					FROM LOP L
					WHERE L.MALOP = 'K11'
					)
	AND HV.MAHV IN ( SELECT DISTINCT KQT.MAHV
					 FROM KETQUATHI KQT
					 WHERE KQT.LANTHI >= 3 AND KQT.KQUA = 'Khong dat'
					 OR (KQT.LANTHI IN ( SELECT DISTINCT KQT.LANTHI
										FROM KETQUATHI KQT
										WHERE KQT.LANTHI = 2 AND KQT.DIEM = 5
										))
					 AND KQT.MAMH = 'CTRR')

--III. 16.	Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
-- TEN GIAOVIEN  GIANGDAY CTRR  CO BO LOP >=2  TRONG HOCKY

SELECT GV.HOTEN
FROM GIAOVIEN GV
JOIN GIANGDAY GD ON GD.MAGV = GV.MAGV
WHERE GD.MAMH = 'CTRR'
GROUP BY GV.MAGV, GV.HOTEN, GD.HOCKY
HAVING COUNT (*) >= 2

--III. 17.	Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
-- CACH 1

SELECT HV.MAHV, HV.HO + ' ' +HV.TEN HOTEN, MAX(KQT.DIEM) AS DIEMCUOICUNG
FROM KETQUATHI KQT
JOIN HOCVIEN HV ON KQT.MAHV = HV.MAHV
WHERE KQT.MAMH = ( SELECT MH.MAMH
				   FROM MONHOC MH
			       WHERE MH.TENMH = 'Co So Du Lieu')
GROUP BY HV.MAHV, HV.HO, HV.TEN

/*  CACH 2
SELECT HV.MAHV, HV.HO + ' ' +HV.TEN HOTEN, KQT1.DIEM
FROM KETQUATHI KQT1
LEFT OUTER JOIN HOCVIEN HV ON KQT1.MAHV = HV.MAHV
WHERE LANTHI = ( SELECT TOP 1 KQT2.LANTHI --LAN THI CUOI
				 FROM KETQUATHI KQT2
				 WHERE KQT1.MAMH = KQT2.MAMH
				 AND   KQT2.MAHV = KQT1.MAHV
				 GROUP BY KQT2.MAMH, KQT2.LANTHI, KQT2.MAHV
				 ORDER BY LANTHI DESC)
	AND MAMH = 'CSDL'

SELECT
	HocVien.*, Diem AS 'Điểm thi CSDL sau cùng'
FROM
	HocVien, KetQuaThi
WHERE
	HocVien.MaHV = KetQuaThi.MaHV
	AND MaMH = 'CSDL'
	AND LanThi = 
	(
		SELECT MAX(LanThi) 
		FROM KetQuaThi 
		WHERE MaMH = 'CSDL' AND KetQuaThi.MaHV = HocVien.MaHV 
		GROUP BY MaHV
	)
*/
--III. 18.	Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).

SELECT KQT.MAHV, HV.HO+' '+ HV.TEN HOTEN, MAX(KQT.DIEM) AS DIEM
FROM HOCVIEN HV
JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE KQT.MAMH = (SELECT MAMH FROM MONHOC WHERE TENMH = 'Co So Du Lieu')
GROUP BY KQT.MAHV, HV.HO, HV.TEN;

/* CACH 2
SELECT HV.MAHV, HO + ' ' + TEN AS HOTEN, DIEM 
FROM HOCVIEN HV INNER JOIN (
	SELECT MAHV, MAX(DIEM) AS DIEM FROM KETQUATHI 
	WHERE MAMH IN (
		SELECT MAMH FROM MONHOC 
		WHERE TENMH = 'Co So Du Lieu'
	) 
	GROUP BY MAHV, MAMH
) DIEM_CSDL_MAX
ON HV.MAHV = DIEM_CSDL_MAX.MAHV
 
 CACH 3
SELECT
	HocVien.*, Diem AS 'Điểm thi CSDL cao nhất'
FROM
	HocVien, KetQuaThi, MonHoc
WHERE
	HocVien.MaHV = KetQuaThi.MaHV
	AND KetQuaThi.MaMH = MonHoc.MaMH
	AND TenMH = 'Co So Du Lieu'
	AND Diem = 
	(
		SELECT MAX(Diem) 
		FROM KetQuaThi, MonHoc
		WHERE
			KetQuaThi.MaMH = MonHoc.MaMH
			AND MaHV = HocVien.MaHV
			AND TenMH = 'Co So Du Lieu'
		GROUP BY MaHV
	)
*/

------------------------------------------------------LAB4-----------------------------------------------------------------------------
--Bài tập 2 Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 19 đến câu 25.
--19.	Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
USE QuanLyGiaoVu
GO
--CACH 1
SELECT MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (SELECT MIN(NGTLAP) FROM KHOA);
--CACH 2
SELECT MAKHOA, TENKHOA FROM (
	SELECT MAKHOA, TENKHOA, RANK() OVER (ORDER BY NGTLAP) RANK_NGTLAP FROM KHOA 
) A
WHERE RANK_NGTLAP = 1
-- CACH 3
SELECT TOP 1 WITH TIES MAKHOA, TENKHOA
FROM KHOA 
ORDER BY NGTLAP ASC

--20.	Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
-- CACH 1
SELECT HOCHAM, COUNT(HOCHAM) SL 
FROM GIAOVIEN 
WHERE HOCHAM IN ('GS', 'PGS') 
GROUP BY HOCHAM
--CACH 2
SELECT COUNT(*) AS SOLUONG
FROM GIAOVIEN 
WHERE HOCHAM IN ('GS', 'PGS')

--21.	Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
--CACH 1
SELECT MAKHOA, HOCVI, COUNT(HOCVI) SL
FROM GIAOVIEN 
GROUP BY MAKHOA, HOCVI
-- CACH 2
SELECT MAKHOA, HOCVI, COUNT(*) AS SOLUONG
FROM GIAOVIEN 
WHERE HOCVI IN ('CN', 'KS', 'Ths', 'TS', 'PTS')
GROUP BY MAKHOA, HOCVI

--22.	Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
-- CACH 1
SELECT MAMH, KQUA, COUNT(MAHV) SL
FROM KETQUATHI A
WHERE NOT EXISTS (
	SELECT *
	FROM KETQUATHI B 
	WHERE A.MAHV = B.MAHV AND A.MAMH = B.MAMH AND A.LANTHI < B.LANTHI
)
GROUP BY MAMH, KQUA
-- CACH 2
SELECT MAMH, KQUA, COUNT(*) AS SOLUONG
FROM KETQUATHI
GROUP BY MAMH, KQUA

--23.	Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
-- CACH 1
SELECT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV
WHERE GV.MAGV IN (
					SELECT DISTINCT GD.MAGV
					FROM GIANGDAY GD, LOP L
					WHERE L.MALOP = GD.MALOP AND L.MAGVCN = GV.MAGV
)
-- CACH 2
SELECT DISTINCT GV.MAGV, GV.HOTEN 
FROM GIAOVIEN GV 
WHERE EXISTS(
				SELECT *
				FROM LOP L
				WHERE L.MAGVCN = GV.MAGV
				AND EXISTS(
							SELECT *
							FROM GIANGDAY GD
							WHERE GD.MAGV = GV.MAGV
							AND GD.MALOP = L.MALOP
							)
				)
-- CACH 3
SELECT DISTINCT GV.MAGV, GV.HOTEN
FROM GIAOVIEN GV, LOP L, GIANGDAY GD
WHERE GD.MAGV = GV.MAGV AND L.MALOP = GD.MALOP AND L.MAGVCN = GV.MAGV

--24.	Tìm họ tên lớp trưởng của lớp có sỉ số cao nhất.
-- CACH 1
SELECT HO + ' ' + TEN AS HOTEN 
FROM LOP L, HOCVIEN HV
WHERE L.TRGLOP = HV.MAHV
AND SISO = (
			SELECT MAX(SISO) FROM LOP
)
-- CACH 2
SELECT HV.HO + ' ' + HV.TEN HOTEN
FROM HOCVIEN HV
WHERE HV.MAHV IN (
					SELECT LOP.TRGLOP
					FROM LOP
					WHERE SISO IN (SELECT MAX(SISO) FROM LOP)
				)
-- CACH 3
SELECT TOP 1 WITH TIES HV.HO + ' ' + HV.TEN HOTEN
FROM HOCVIEN HV, LOP L
WHERE L.TRGLOP = HV.MAHV
ORDER BY L.SISO DESC

--25.	* Tìm họ tên những LOPTRG thi không đạt quá 3 môn (mỗi môn đều thi không đạt ở tất cả các lần thi).
-- CACH 1 
SELECT HO + ' ' + TEN HOTEN FROM HOCVIEN
WHERE MAHV IN (
	SELECT MAHV FROM KETQUATHI KQ1
	WHERE MAHV IN (
		SELECT TRGLOP FROM LOP
	) AND NOT EXISTS (
		SELECT 1 FROM KETQUATHI KQ2 
		WHERE KQ1.MAHV = KQ2.MAHV AND KQ1.MAMH = KQ2.MAMH AND KQ1.LANTHI < KQ2.LANTHI
	) AND KQUA = 'Khong Dat'
	GROUP BY MAHV
	HAVING COUNT(MAMH) >= 3
)
-- CACH 2
SELECT HV.HO + ' ' + HV.TEN HOTEN
FROM HOCVIEN HV, LOP L 
WHERE HV.MAHV = L.TRGLOP
AND HV.MAHV IN (
					SELECT KQ.MAHV
					FROM KETQUATHI KQ
					WHERE KQ.KQUA = 'Khong Dat'
					GROUP BY KQ.MAHV, KQ.MAMH
					HAVING COUNT(DISTINCT KQ.MAMH) >= 3
				)

--Bài tập 4 Sinh viên hoàn thành Phần III bài tập QuanLyGiaoVu từ câu 26 đến câu 35.
--26.	Tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất.
-- Đề chỉ nói 9 hoặc 10 chứ không nói trong khoảng 9, 10

-- CACH 1
SELECT TOP 1 WITH TIES H.MAHV, H.HO, H.TEN, COUNT(*) AS SoMonDat
FROM KETQUATHI KQ
JOIN HOCVIEN H ON KQ.MAHV = H.MAHV
WHERE KQ.DIEM IN (9, 10)
GROUP BY H.MAHV, H.HO, H.TEN
ORDER BY SoMonDat DESC

-- CACH 2
SELECT HV.MAHV, HV.HO + ' ' + HV.TEN HOTEN
FROM HOCVIEN HV
WHERE HV.MAHV IN (
					SELECT KQT.MAHV
					FROM KETQUATHI KQT
					WHERE  KQT.DIEM IN (9, 10)
					GROUP BY KQT.MAHV
					HAVING COUNT(KQT.MAHV) = (
												SELECT MAX(SOMON)
												FROM(
														SELECT KQT.MAHV, COUNT(MAMH) SOMON
														FROM KETQUATHI KQT
														WHERE DIEM IN (9 , 10)
														GROUP BY MAHV
													) AS SUBQUERY
												)
					)

--27.	Trong từng lớp, tìm học viên (mã học viên, họ tên) có số môn đạt điểm 9, 10 nhiều nhất.
SELECT H.MALOP, H.MAHV,H.HO +' '+H.TEN HOTEN, COUNT(K.DIEM) SODIEM
FROM HOCVIEN H, KETQUATHI K
WHERE H.MAHV = K.MAHV AND K.DIEM >=9
GROUP BY H.MALOP, H.MAHV,H.HO +' '+H.TEN
HAVING COUNT(K.DIEM) >= ALL(
							SELECT COUNT(K.DIEM) SODIEM
							FROM HOCVIEN H1, KETQUATHI K
							WHERE H1.MAHV = K.MAHV AND K.DIEM IN(9, 10)
							AND H1.MALOP = H.MALOP
							GROUP BY H1.MALOP, H1.MAHV
)

--28.	Trong từng học kỳ của từng năm, mỗi giáo viên phân công dạy bao nhiêu môn học, bao nhiêu lớp.
SELECT GD.HOCKY, GD.NAM, GD.MAGV, COUNT(DISTINCT GD.MAMH) AS SoMon, COUNT(DISTINCT GD.MALOP) AS SoLop
FROM GIANGDAY GD
GROUP BY HOCKY, NAM, MAGV;

--29.	Trong từng học kỳ của từng năm, tìm giáo viên (mã giáo viên, họ tên) giảng dạy nhiều nhất.
SELECT HOCKY, NAM, GV.MAGV, GV.HOTEN, COUNT(MALOP) SOLOPDAY
FROM GIANGDAY GD, GIAOVIEN GV
WHERE GV.MAGV = GD.MAGV
GROUP BY HOCKY, NAM, GV.MAGV, GV.HOTEN
HAVING COUNT(MALOP) >= ALL(
							SELECT COUNT(MALOP) SOLOPDAY
							FROM GIANGDAY GDS
							WHERE GDS.HOCKY = GD.HOCKY
							AND GDS.NAM = GD.NAM
							GROUP BY GDS.MAGV
)

--30.	Tìm môn học (mã môn học, tên môn học) có nhiều học viên thi không đạt (ở lần thi thứ 1) nhất.
-- CACH 1
SELECT TOP 1 WITH TIES M.MAMH, M.TENMH, COUNT(*) AS SoHocVienKhongDat
FROM KETQUATHI KQ
JOIN MONHOC M ON KQ.MAMH = M.MAMH
WHERE KQ.LANTHI = 1 AND KQ.KQUA = 'Khong Dat'
GROUP BY M.MAMH, M.TENMH
ORDER BY SoHocVienKhongDat DESC
-- GON HON
SELECT TOP 1 WITH TIES KQ.MAMH, COUNT(*) SoHocVienKhongDat
FROM KETQUATHI KQ
WHERE KQ.LANTHI = 1 AND KQ.KQUA = 'Khong Dat'
GROUP BY MAMH 
ORDER BY COUNT(*) DESC
-- CACH 2
SELECT K.MAMH, M.TENMH, COUNT(*) SOHOCVIENKHONGDAT
FROM KETQUATHI K, MONHOC M
WHERE K.MAMH = M.MAMH
AND LANTHI = 1 AND KQUA = 'Khong Dat'
GROUP BY K.MAMH, M.TENMH
HAVING COUNT(*) >= ALL (
	SELECT COUNT(*) SOHOCVIENKHONGDAT
	FROM KETQUATHI
	WHERE LANTHI = 1 AND KQUA = 'Khong Dat'
	GROUP BY MAMH
)

--31.	Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi thứ 1).
-- CACH 1
WITH DAT AS(
	SELECT MAHV, COUNT(KQUA) SODAT
	FROM KETQUATHI
	WHERE LANTHI = 1 AND KQUA = 'Dat'
	GROUP BY MAHV 
		INTERSECT
	SELECT MAHV, COUNT(KQUA) SODAT
	FROM KETQUATHI
	WHERE LANTHI = 1 
	GROUP BY MAHV
)
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM DAT, HOCVIEN HV
WHERE DAT.MAHV = HV.MAHV
-- CACH 2
SELECT H.MAHV, H.HO, H.TEN
FROM HOCVIEN H
JOIN KETQUATHI KQ ON H.MAHV = KQ.MAHV
WHERE KQ.LANTHI = 1
GROUP BY H.MAHV, H.HO, H.TEN
HAVING COUNT(CASE WHEN KQ.KQUA = 'Dat' THEN 1 END) = COUNT(KQ.MAMH);
-- CACH 3
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM KETQUATHI K, HOCVIEN HV
WHERE K.MAHV = HV.MAHV AND LANTHI = 1
	EXCEPT
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM KETQUATHI K, HOCVIEN HV
WHERE K.MAHV = HV.MAHV AND LANTHI = 1 AND K.KQUA = 'Khong Dat'
-- CACH 4
SELECT DISTINCT H.MAHV, H.HO +' '+ H.TEN HOTEN
FROM KETQUATHI K, HOCVIEN H
WHERE K.MAHV = H.MAHV AND LANTHI = 1
	AND H.MAHV NOT IN(
	SELECT MAHV
	FROM KETQUATHI 
	WHERE LANTHI = 1 AND KQUA = 'Khong Dat'
)

--32.	* Tìm học viên (mã học viên, họ tên) thi môn nào cũng đạt (chỉ xét lần thi sau cùng).
-- CACH 1
WITH DAT AS(
	SELECT MAHV, COUNT(KQUA) SODAT FROM KETQUATHI A
	WHERE NOT EXISTS (
		SELECT 1 
		FROM KETQUATHI B 
		WHERE A.MAHV = B.MAHV AND A.MAMH = B.MAMH AND A.LANTHI < B.LANTHI
	) AND KQUA = 'Dat'
	GROUP BY MAHV
	INTERSECT
	SELECT MAHV, COUNT(MAMH) SOMH FROM KETQUATHI 
	WHERE LANTHI = 1
	GROUP BY MAHV
)
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM DAT, HOCVIEN HV
WHERE DAT.MAHV = HV.MAHV
-- CACH 2
SELECT H.MAHV, H.HO, H.TEN
FROM HOCVIEN H
JOIN KETQUATHI KQ ON H.MAHV = KQ.MAHV
WHERE KQ.LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI WHERE MAHV = H.MAHV)
GROUP BY H.MAHV, H.HO, H.TEN
HAVING COUNT(CASE WHEN KQ.KQUA = 'Dat' THEN 1 END) = COUNT(KQ.MAMH);
-- CACH 3
SELECT H.MAHV, H.HO +' '+ H.TEN HOTEN
FROM KETQUATHI K, HOCVIEN H
WHERE K.MAHV = H.MAHV
AND LANTHI = (
	SELECT MAX(LANTHI) 
	FROM KETQUATHI KQ 
	WHERE KQ.MAHV = K.MAHV AND KQ.MAMH = K.MAMH
)
	EXCEPT
SELECT H.MAHV, H.HO +' '+ H.TEN HOTEN
FROM KETQUATHI K, HOCVIEN H
WHERE K.MAHV = H.MAHV
AND KQUA = 'Khong Dat'
AND LANTHI = (
	SELECT MAX(LANTHI) 
	FROM KETQUATHI KQ 
	WHERE KQ.MAHV = K.MAHV AND KQ.MAMH = K.MAMH
)
-- CACH 5
SELECT DISTINCT K.MAHV, H.HO +' '+ H.TEN HOTEN
FROM KETQUATHI K, HOCVIEN H
WHERE K.MAHV = H.MAHV
AND LANTHI = (
	SELECT MAX(LANTHI) 
	FROM KETQUATHI KQ 
	WHERE KQ.MAHV = K.MAHV AND KQ.MAMH = K.MAMH
)
AND H.MAHV NOT IN(
	SELECT MAHV
	FROM KETQUATHI KK
	WHERE KK.LANTHI = (
						SELECT MAX(LANTHI) 
						FROM KETQUATHI KQ 
						WHERE KQ.MAHV = KK.MAHV AND KQ.MAMH = KK.MAMH
					)
	AND KK.KQUA = 'Khong Dat'
)

--33.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn và đều đạt (chỉ xét lần thi thứ 1).
-- CACH 1
WITH DAT AS(
	SELECT MAHV, COUNT(KQUA) SODAT FROM KETQUATHI 
	WHERE LANTHI = 1 AND KQUA = 'Dat'
	GROUP BY MAHV
		INTERSECT
	SELECT MAHV, COUNT(MAMH) SOMH FROM KETQUATHI 
	WHERE LANTHI = 1
	GROUP BY MAHV
)
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM DAT, HOCVIEN HV
WHERE DAT.MAHV = HV.MAHV

--34.	* Tìm học viên (mã học viên, họ tên) đã thi tất cả các môn và đều đạt (chỉ xét lần thi sau cùng).
SELECT H.MAHV, H.HO +' '+ H.TEN HOTEN
FROM HOCVIEN H
WHERE NOT EXISTS(
	SELECT *
	FROM MONHOC M
	WHERE NOT EXISTS(
		SELECT *
		FROM KETQUATHI K
		WHERE K.KQUA = 'Dat'
		AND H.MAHV = K.MAHV
		AND M.MAMH = K.MAMH
	)
)
-- CACH 2
SELECT H.MAHV, HO +' '+ TEN HOTEN
FROM HOCVIEN H, KETQUATHI K
WHERE H.MAHV = K.MAHV
GROUP BY H.MAHV, HO +' '+ TEN
HAVING COUNT(DISTINCT MAMH) = (
								SELECT COUNT(MAMH)
								FROM MONHOC
	) 

--35.	** Tìm học viên (mã học viên, họ tên) có điểm thi cao nhất trong từng môn (lấy điểm ở lần thi sau cùng).
-- CACH 1
WITH DAT AS(
	SELECT B.MAMH, MAHV, DIEM, DIEMMAX
	FROM KETQUATHI B INNER JOIN (
		SELECT MAMH, MAX(DIEM) DIEMMAX FROM KETQUATHI
		GROUP BY MAMH
	) C 
	ON B.MAMH = C.MAMH
	WHERE NOT EXISTS (
		SELECT 1 FROM KETQUATHI D 
		WHERE B.MAHV = D.MAHV AND B.MAMH = D.MAMH AND B.LANTHI < D.LANTHI
	) AND DIEM = DIEMMAX
)
SELECT HV.MAHV, HV.HO +' '+ HV.TEN HOTEN
FROM DAT, HOCVIEN HV
WHERE DAT.MAHV = HV.MAHV
-- CACH 2
SELECT DISTINCT KQ.MAHV, HV.HO, HV.TEN, KQ.MAMH, KQ.DIEM
FROM KETQUATHI KQ
JOIN HOCVIEN HV ON KQ.MAHV = HV.MAHV
WHERE KQ.LANTHI = (SELECT MAX(LANTHI)
                   FROM KETQUATHI KQ2
                   WHERE KQ2.MAHV = KQ.MAHV AND KQ2.MAMH = KQ.MAMH)
AND KQ.DIEM = (SELECT MAX(DIEM)
               FROM KETQUATHI KQ3
               WHERE KQ3.MAMH = KQ.MAMH
               AND KQ3.LANTHI = (SELECT MAX(LANTHI)
                                 FROM KETQUATHI KQ4
                                 WHERE KQ4.MAHV = KQ3.MAHV AND KQ4.MAMH = KQ3.MAMH));
-- CACH 3
SELECT K.MAMH, H.MAHV, H.HO +' '+H.TEN HOTEN, DIEM, LANTHI
FROM KETQUATHI K, HOCVIEN H
WHERE K.MAHV = H.MAHV
AND LANTHI = (
	SELECT MAX(LANTHI)
	FROM KETQUATHI KS
	WHERE KS.MAHV = H.MAHV AND KS.MAMH = K.MAMH
)
GROUP BY K.MAMH, H.MAHV, H.HO +' '+H.TEN, DIEM, LANTHI
HAVING DIEM >= ALL(
		SELECT DIEM
		FROM KETQUATHI KSS
		WHERE KSS.LANTHI = (
			SELECT MAX(LANTHI)
			FROM KETQUATHI KSSS
			WHERE KSSS.MAHV = KSS.MAHV AND KSSS.MAMH = KSS.MAMH
		) AND KSS.MAMH = K.MAMH 
		GROUP BY KSS.MAHV, DIEM
)

------------------------------------------------------LAB5-----------------------------------------------------------------------------
--Bài tập 2 Sinh viên hoàn thành Phần I bài tập QuanLyGiaoVu câu 9, 10 và từ câu 15 đến câu 24. 
--9.	Lớp trưởng của một lớp phải là học viên của lớp đó.
USE QuanLyGiaoVu
GO
CREATE TRIGGER TRG_CHECK_TRGLOP ON LOP
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, HOCVIEN V
		WHERE I.MALOP = V.MALOP
	)
	BEGIN
		RAISERROR('LOI: LOP TRUONG KHONG THUOC LOP!', 16, 1);
		ROLLBACK TRANSACTION;
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG'
	END
END

--10.	Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”.
GO
CREATE TRIGGER TRG_CHECK_TRGKHOA ON KHOA
AFTER INSERT, UPDATE
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, GIAOVIEN G
		WHERE G.MAGV = I.TRGKHOA AND I.MAKHOA = G.MAKHOA
		AND G.MAGV IS NULL OR G.HOCVI NOT IN ('TS','PTS')
	)
	BEGIN 
		RAISERROR('LOI: TRUONG KHOA KHONG HOP LE!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG'
	END
END

--15.	Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này.
GO
CREATE TRIGGER TRG_CHECK_THI ON KETQUATHI
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT * 
		FROM INSERTED I, HOCVIEN V, GIANGDAY G
		WHERE I.MAHV = V.MAHV AND I.MAMH = G.MAMH AND V.MALOP = G.MALOP
		AND I.NGTHI < G.DENNGAY
	)
	BEGIN 
		RAISERROR('LOI: HOC VIEN CHUA HOC XONG MON HOC!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG'
	END
END

--16.	Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
GO
CREATE TRIGGER TRG_CHECK_MAX_MON ON GIANGDAY
AFTER INSERT, UPDATE
AS 
BEGIN
	IF EXISTS(
		SELECT MALOP, HOCKY, NAM 
		FROM INSERTED
		GROUP BY MALOP, HOCKY, NAM
		HAVING COUNT(MAMH) > 3
	)
	BEGIN
		RAISERROR('LOI: MOT LOP CHI DUOC HOC TOI DA 3 MON MOI HOC KY!', 16,1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG'
	END
END


--17.	Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
GO
CREATE TRIGGER TRG_CHECK_SISO ON HOCVIEN
AFTER INSERT, DELETE
AS
BEGIN
	UPDATE LOP 
	SET SISO = (
		SELECT COUNT(*)
		FROM HOCVIEN
		WHERE MALOP = LOP.MALOP
	)
	WHERE MALOP IN(
		SELECT DISTINCT MALOP FROM INSERTED
			UNION
		SELECT DISTINCT MALOP FROM DELETED
	)
END

--18.	Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
GO
CREATE TRIGGER TRG_CHECK_DIEUKIEN ON DIEUKIEN
AFTER INSERT
AS
BEGIN 
	IF EXISTS(
		SELECT *
		FROM INSERTED I
		WHERE I.MAMH = I.MAMH_TRUOC
	)
	BEGIN
		RAISERROR('LOI: MAMH VA MAMH_TRUOC KHONG DUOC GIONG NHAU!', 16,1)
		ROLLBACK TRANSACTION
	END
	IF EXISTS(
		SELECT*
		FROM INSERTED I1, DIEUKIEN D
		WHERE I1.MAMH = D.MAMH_TRUOC AND I1.MAMH_TRUOC = D.MAMH
	)
	BEGIN
		RAISERROR('LOI: TON TAI BO NGHICH DAO!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG!'
	END
END

--19.	Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau.
GO
CREATE TRIGGER TRG_CHECK_MUCLUONG ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN 
	IF EXISTS(
		SELECT *
		FROM GIAOVIEN G1, GIAOVIEN G2
		WHERE G1.HOCVI = G2.HOCVI AND G1.HOCHAM = G2.HOCHAM AND G1.HESO = G2.HESO
		AND G1.MUCLUONG != G2.MUCLUONG
		)
	BEGIN
		RAISERROR('LOI: GIAO VIEN KHONG CUNG MUC LUONG!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG!'
	END
END

--20.	Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5.
GO
CREATE TRIGGER TRG_CHECK_LANTHI ON KETQUATHI
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, KETQUATHI KQT
		WHERE I.MAHV = KQT.MAHV AND I.MAMH = KQT.MAMH AND I.LANTHI = KQT.LANTHI
		AND KQT.DIEM >=5
	)
	BEGIN
		RAISERROR('LOI: HOC VIEN CHI DUOC THI KHI DIEM < 5', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG!'
	END
END

--21.	Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
GO
CREATE TRIGGER TRG_CHECK_NGTHI ON KETQUATHI
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, KETQUATHI KQT
		WHERE I.MAHV = KQT.MAHV AND I.MAMH = KQT.MAMH AND I.LANTHI = KQT.LANTHI + 1
		AND I.NGTHI < KQT.NGTHI
		)
		BEGIN
			RAISERROR('LOI: NGAY THI LAN THI SAU PHAI BE HON NGAY THI LAN TRUOC!', 16, 1)
			ROLLBACK TRANSACTION
		END 
		ELSE
		BEGIN
			PRINT 'THEM THANH CONG!'
		END
END

--22.	Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau khi học xong những môn học phải học trước mới được học những môn liền sau).
GO
CREATE TRIGGER TRG_CHECK_THUTUMONHOC ON GIANGDAY
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, DIEUKIEN DK
		WHERE I.MAMH = DK.MAMH
		AND I.MAMH NOT IN(
				SELECT DISTINCT MAMH 
				FROM GIANGDAY GD
				WHERE GD.DENNGAY <= I.TUNGAY
		)
		)
	BEGIN
		RAISERROR('LOI: MON HOC CHUA HOAN THANH CAC DIEU KIEN BAT BUOC!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN 
		PRINT 'THEM THANH CONG!'
	END
END 

--23.	Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
GO
CREATE TRIGGER TRG_CHECK_PHANCONG ON GIANGDAY
AFTER INSERT
AS
BEGIN
	IF EXISTS(
		SELECT *
		FROM INSERTED I, MONHOC MH, GIAOVIEN GV
		WHERE I.MAMH = MH.MAMH AND I.MAGV = GV.MAGV
		AND MH.MAKHOA != GV.MAKHOA
	)
	BEGIN
		RAISERROR('LOI: GIAO VIEN CHI DUOC DAY MON THUOC KHOA CUA MINH!', 16, 1)
		ROLLBACK TRANSACTION
	END
	ELSE
	BEGIN
		PRINT 'THEM THANH CONG!'
	END
END

