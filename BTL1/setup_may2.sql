--/ as sysdba
CREATE USER cn2 IDENTIFIED BY 123456;
GRANT CONNECT, DBA TO cn2;
-- cn2 123456
--set định dạng ngày
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YY HH24:MI:SS';
--tạo bảng sách
CREATE TABLE SACH(
MaSach varchar2(8) PRIMARY KEY,
TenSach varchar2(100),
NgayXB date,
TacGia varchar2(40),
GiaTien number,
NhaXuatBan varchar2(40),
LanIn number
);
--tạo bảng chi nhánh
CREATE TABLE CHINHANH(
MaChiNhanh varchar2(8) PRIMARY KEY,
TenChiNhanh varchar2(30),
SoDT varchar2(11)
);
--tạo bảng kho sách qlkho
CREATE TABLE KHOSACH_QLKHO(
MaChiNhanh varchar2(8),
MaSach varchar2(8),
SoLuong number,
NgayCapNhat date
);
--tạo bảng kho sách nvbh
CREATE TABLE KHOSACH_NVBH(
MaChiNhanh varchar2(8),
MaSach varchar2(8),
TinhTrang varchar2(10),
KhuyenMai number
);
--tạo bảng nhân viên
CREATE TABLE NHANVIEN(
MaNV varchar2(8) PRIMARY KEY,
TenNV varchar2(30),
DiaChi varchar2(30),
SoDT varchar2(11),
Luong number,
MaChiNhanh varchar2(8)
);

--set khóa ngoại
ALTER TABLE KHOSACH_QLKHO 
ADD CONSTRAINT FK_QLKHO_CHINHANH FOREIGN KEY (MaChiNhanh)
REFERENCES CHINHANH(MaChiNhanh);

ALTER TABLE KHOSACH_NVBH
ADD CONSTRAINT FK_NVBH_CHINHANH FOREIGN KEY (MaChiNhanh)
REFERENCES CHINHANH(MaChiNhanh);

ALTER TABLE KHOSACH_QLKHO 
ADD CONSTRAINT FK_QLKHO_SACH FOREIGN KEY (MaSach)
REFERENCES SACH(MaSach);


ALTER TABLE KHOSACH_NVBH 
ADD CONSTRAINT FK_NVBH_SACH FOREIGN KEY (MaSach)
REFERENCES SACH(MaSach);

--insert dữ liệu
INSERT INTO SACH VALUES ('Book1','Đắc Nhân Tâm', to_date('29/10/2021','dd/mm/yyyy'), 'Dale Carnegie', 75000, 'NXB Tổng hợp TPHCM', 1);
INSERT INTO SACH VALUES ('Book2', 'Mắt Biếc', to_date('22/10/2021','dd/mm/yyyy'), 'Nguyễn Nhật Ánh', 65000, 'Trẻ', 1);
INSERT INTO SACH VALUES ('Book3', 'Tắt Đèn', to_date('19/10/2021','dd/mm/yyyy'), 'Ngô Tất Tố', 35000, 'Văn Học', 1);
INSERT INTO SACH VALUES ('Book4', 'Người Trong Muôn Nghề', to_date('05/11/2021','dd/mm/yyyy'), 'Spiderum', 140000, 'Thế Giới', 1);*
INSERT INTO SACH VALUES ('Book5', 'Thám tử lừng danh Conan', to_date('11/10/2021','dd/mm/yyyy'), 'Aoyama Gosho', 19500, 'Kim Đồng', 2);
INSERT INTO SACH VALUES ('Book6', 'Nhà Giả Kim', to_date('01/10/2021','dd/mm/yyyy'), 'Paulo Coelho', 19500, 'Văn Học', 2);
INSERT INTO SACH VALUES ('Book7', 'Ba người thầy vĩ đại', to_date('12/12/2021','dd/mm/yyyy'), 'Robin Sharma', 86000, 'Lao Động', 1);
INSERT INTO SACH VALUES ('Book8', 'Cha giàu cha nghèo', to_date('11/11/2021','dd/mm/yyyy'), 'Robert Kyosaki', 38000, 'Văn Hoá - Thông Tin', 3);
INSERT INTO SACH VALUES ('Book9', 'Những tấm lòng cao cả', to_date('01/12/2021','dd/mm/yyyy'), 'Edmondo De Amicis', 60000, 'Văn Học', 1);
INSERT INTO SACH VALUES ('Book10', 'Harry Potter và Hòn đá phù thuỷ', to_date('21/10/2021','dd/mm/yyyy'), 'JK Rowling', 108000, 'Trẻ', 4);
INSERT INTO SACH VALUES ('Book11', 'Người giàu có nhất thành Babylon', to_date('26/10/2021','dd/mm/yyyy'), 'George S. Glason', 64500, 'NXB Tổng hợp TPHCM', 5);
INSERT INTO SACH VALUES ('Book12', 'Nhà lãnh đạo không chức danh', to_date('26/11/2021','dd/mm/yyyy'), 'Robin Sharma', 80000, 'Trẻ', 2);
INSERT INTO SACH VALUES ('Book13', 'Mật mã Da Vinci', to_date('11/11/2021','dd/mm/yyyy'), 'Dan Brown', 320000, 'Kim Đồng', 2);
INSERT INTO SACH VALUES ('Book14', 'Không gia đình', to_date('01/12/2021','dd/mm/yyyy'), 'Hector Malot', 160000, 'Trẻ', 4);
INSERT INTO SACH VALUES ('Book15', 'Những cuộc phiêu lưu của Tom Sawyer', to_date('21/11/2021','dd/mm/yyyy'), 'Mark Twain', 89000, 'Văn Học', 2);
INSERT INTO SACH VALUES ('Book16', 'Tuần làm việc 4 giờ', to_date('12/10/2021','dd/mm/yyyy'), 'Timothy Ferriss', 88000, 'Lao Động', 3);
INSERT INTO SACH VALUES ('Book17', 'Người bán hàng vĩ đại nhất thế giới', to_date('14/10/2021','dd/mm/yyyy'), 'Og Mandino', 96000, 'NXB Tổng hợp TPHCM', 1);
INSERT INTO SACH VALUES ('Book18', 'Hành trình về phương đông', to_date('14/11/2021','dd/mm/yyyy'), 'Blair T. Spalding', 100000, 'Thế Giới', 3);
INSERT INTO SACH VALUES ('Book19', 'Think and Grow Rich', to_date('09/11/2021','dd/mm/yyyy'), 'Napoleon Hill', 110000, 'Kim Đồng', 3);
INSERT INTO SACH VALUES ('Book20', 'Đại gia Gatsby ', to_date('09/11/2021','dd/mm/yyyy'), 'F. Scott Fitzgerald', 47000, 'Hội Nhà Văn', 2);


INSERT INTO CHINHANH VALUES ('CN02', 'Quan 1, TPHCM', '0907979816');

INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book1', 180, to_date('29/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book2', 170, to_date('22/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book3', 0, to_date('19/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book4', 0, to_date('05/11/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book6', 45, to_date('01/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book7', 185, to_date('12/12/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book10', 190, to_date('21/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book13', 0, to_date('11/11/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book17', 55, to_date('14/10/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book18', 200, to_date('14/11/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book19', 0, to_date('09/11/2021','dd/mm/yyyy'));
INSERT INTO KHOSACH_QLKHO VALUES ('CN02', 'Book20', 40, to_date('09/11/2021','dd/mm/yyyy'));


INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book1', 'Con Hang', 10);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book2', 'Con Hang', 0);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book3', 'Het Hang', 10);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book4', 'Het Hang', 15);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book6', 'Con Hang', 30);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book7', 'Het Hang', 10);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book10', 'Con Hang', 0);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book13', 'Het Hang', 10);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book17', 'Con Hang', 15);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book18', 'Con Hang', 30);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book19', 'Het Hang', 30);
INSERT INTO KHOSACH_NVBH VALUES ('CN02', 'Book20', 'Con Hang', 30);

INSERT INTO NHANVIEN VALUES ('NV06', 'Nguyen Huy Hoang', 'TPHCM', '0935228258', 4750000, 'CN02');
INSERT INTO NHANVIEN VALUES ('NV07', 'Tran Nhat Linh', 'Gia Lai', '0987370986', 3750000, 'CN02');
INSERT INTO NHANVIEN VALUES ('NV08', 'Nguyen Dinh Y', 'Da Nang', '0905807248', 2750000, 'CN02');
INSERT INTO NHANVIEN VALUES ('NV09', 'Nguyen Hieu', 'Binh Dinh', '0933564782', 3750000, 'CN02');
INSERT INTO NHANVIEN VALUES ('NV10', 'Tran Thi Thu Nguyet', 'Quang Binh', '03727840696', 1750000, 'CN02');
INSERT INTO NHANVIEN VALUES ('NV11', 'Truong Phuong Nhi', 'Hue', '0379436827', 1750000, 'CN02');


--tạo database link
create public database link cn2_link connect to cn1 identified by
cn1 using 'db_link';


--Yêu cầu 1: 10 câu truy vấn:

-- Câu 1: Đưa ra thông tin sách với tı̀nh trạng ‘Con Hang’ của tất cả các chi nhánh. Thông tin hiển thị (MaChiNhanh, MaSach, TenSach)
SELECT MaChiNhanh, MaSach, TenSach 
FROM cn1.SACH JOIN cn1.KHOSACH_NVBH 
USING(MaSach) WHERE TinhTrang = 'Con Hang'
UNION
SELECT MaChiNhanh, MaSach, TenSach 
FROM cn2.SACH@cn2_link JOIN cn2.KHOSACH_NVBH@cn2_link 
USING(MaSach) WHERE TinhTrang = 'Con Hang';

-- Câu 2: Tım sách với tı̀nh trạng ‘Con Hang’ và số lượng sách trong kho lớn hơn 135 tại tất cả chi nhánh. Thông tin hiển thị (MaSach, TenSach)
SELECT MaChiNhanh, MaSach, TenSach
FROM cn1.SACH JOIN cn1.KHOSACH_QLKHO USING(MaSach)
WHERE SoLuong >= 135
UNION
SELECT MaChiNhanh, MaSach, TenSach
FROM cn2.SACH@cn2_link JOIN cn2.KHOSACH_QLKHO@cn2_link USING(MaSach)
WHERE SoLuong >= 135;

-- Câu 3: Đưa ra thông tin sách gồm tên sách, ngày xuất bản, tác giả, giá tiền, số lượng, lần in, ngày nhập với những sách của chi nhánh mınh qu ̀ ản lý của nhà xuất bản 'Tre'
SELECT DISTINCT TenSach, NgayXB, TacGia, SoLuong, NgayCapNhat, LanIn
FROM cn1.KHOSACH_QLKHO join cn1.SACH USING(MaSach)
WHERE NhaXuatBan = 'Trẻ';

-- Câu 4: Đưa ra thông tin sách (Mã sách, tên sách) được phân phối đến tất cả chi nhánh với tình trạng hết hàng
select MaChiNhanh, SACH.MaSach, TenSach from SACH, KHOSACH_QLKHO
where SACH.MaSach = KHOSACH_QLKHO.MaSach
Minus
select MaChiNhanh, SACH.MaSach, TenSach from cn2.SACH@cn2_link,  cn2.KHOSACH_QLKHO@cn2_link
where cn2.SACH.MaSach@cn2_link = cn2.KHOSACH_QLKHO.MaSach@cn2_link;

--Câu 5: Tìm sách được phân phối tại chi nhánh 1 nhưng không có tại chi nhánh 2
select MaSach, TenSach from SACH join KHOSACH_QLKHO using(MaSACH)
where SoLuong = 0
UNION
select MaSach, TenSach from cn2.KHOSACH_QLKHO@cn2_link join cn2.SACH@cn2_link using(MaSach)
where SoLuong = 0;

-- Câu 6: Số Sách của mỗi NXB trong chi nhánh
SELECT MaChiNhanh, NhaXuatBan, count(NhaXuatBan) as SoSach 
FROM KHOSACH_QLKHO join SACH using (MaSach) 
GROUP BY NhaXuatBan, MachiNhanh;

-- Câu 7: Sách ở CN1 "Het Hang" nhưng "Con Hang" ở CN2
SELECT MaSach FROM KHOSACH_NVBH WHERE TINHTRANG = 'Het Hang'
INTERSECT
SELECT MaSach FROM cn2.KHOSACH_NVBH@cn2_link WHERE TINHTRANG = 'Con Hang';

-- Câu 8: Tìm sách có giá tiền cao nhất trong kho
SELECT GiaTien, MaSach, TenSach, SoLuong FROM SACH join KHOSACH_QLKHO using (MaSach)
    GROUP BY MaSach, TenSach, SoLuong, GiaTien
    ORDER BY GiaTien DESC
    FETCH FIRST ROW ONLY;

-- Câu 9: Tìm sách được cập nhật trong khoảng thời gian 20/11 - 1/12
SELECT MaSach, TenSach, SoLuong FROM SACH JOIN KHOSACH_QLKHO USING (MaSach) 
    WHERE NgayCapNhat BETWEEN to_date('20-NOV-2021') AND to_date('1-DEC-2021');

-- Câu 10: 
SELECT MaSach, TenSach FROM SACH WHERE NhaXuatBan = 'NXB Tổng hợp TPHCM';