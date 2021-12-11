CREATE TABLE BaiTapHTTT3.HANGHANGKHONG
(
    MAHANG VARCHAR(2) CONSTRAINT PK_HANGHANGKHONG PRIMARY KEY,
    TENHANG VARCHAR(30),
    NGTL DATE,
    DUONGBAY NUMBER(2)
);
CREATE TABLE BaiTapHTTT3.CHUYENBAY
(
    MACB VARCHAR(5) CONSTRAINT PK_CHUYENBAY PRIMARY KEY,
    MAHANG VARCHAR(2),
    XUATPHAT VARCHAR(20),
    DIEMDEN VARCHAR(20),
    BATDAU DATE,
    TGBAY DECIMAL
);
CREATE TABLE BaiTapHTTT3.NHANVIEN
(
    MANV VARCHAR(4) CONSTRAINT PK_NHANVIEN PRIMARY KEY,
    HOTEN VARCHAR(30),
    GIOITINH VARCHAR(3),
    NGSINH DATE,
    NGVL DATE,
    CHUYENMON VARCHAR(10)
);
CREATE TABLE BaiTapHTTT3.PHANCONG 
(
    MACB VARCHAR(5),
    MANV VARCHAR(4),
    NHIEMVU VARCHAR(20),
    CONSTRAINT PK_PHANCONG PRIMARY KEY(MACB, MANV)
);
DROP TABLE BaiTapHTTT3.PHANCONG 

ALTER SESSION SET NLS_DATE_FORMAT =' DD/MM/YYYY HH24:MI:SS ';
ALTER USER BaiTapHTTT3 quota 100M on "USERS";
ALTER TABLE BaiTapHTTT3.CHUYENBAY ADD CONSTRAINT FK_CHUYENBAY_MAHANG FOREIGN KEY(MAHANG) REFERENCES BaiTapHTTT3.HANGHANGKHONG(MAHANG);
ALTER TABLE BaiTapHTTT3.PHANCONG ADD CONSTRAINT FK_PHANCONG_MACB FOREIGN KEY(MACB) REFERENCES BaiTapHTTT3.CHUYENBAY(MACB);
ALTER TABLE BaiTapHTTT3.PHANCONG ADD CONSTRAINT FK_PHANCONG_MANV FOREIGN KEY(MANV) REFERENCES BaiTapHTTT3.NHANVIEN(MANV);

INSERT INTO BaiTapHTTT3.HANGHANGKHONG VALUES ('VN', 'Vietnam Airlines', '15/01/1956', 52);
INSERT INTO BaiTapHTTT3.HANGHANGKHONG VALUES ('VJ', 'Vietjet Air', '25/12/2011', 33);
INSERT INTO BaiTapHTTT3.HANGHANGKHONG VALUES ('BL', 'Jetstar Pacific Airlines', '01/12/1990', 13);

INSERT INTO BaiTapHTTT3.CHUYENBAY VALUES ('VN550', 'VN', 'TP.HCM', 'Singapore', '20/12/2015 13:15:00', 2);
INSERT INTO BaiTapHTTT3.CHUYENBAY VALUES ('VJ331', 'VJ', 'Da Nang', 'Vinh', '28/12/2015 22:30:00', 1);
INSERT INTO BaiTapHTTT3.CHUYENBAY VALUES ('BL696', 'BL', 'TP.HCM', 'Da Lat', '24/12/2015 6:00:00', 0.5);

INSERT INTO BaiTapHTTT3.NHANVIEN VALUES ('NV01', 'Lam Van Ben', 'Nam', '10/09/1978', '05/06/2000', 'Phi cong');
INSERT INTO BaiTapHTTT3.NHANVIEN VALUES ('NV02', 'Duong Thi Luc', 'Nu', '22/03/1989', '12/11/2013', 'Tiep vien');
INSERT INTO BaiTapHTTT3.NHANVIEN VALUES ('NV03', 'Hoang Thanh Tung', 'Nu', '29/07/1983', '11/04/2007', 'Tiep vien');

INSERT INTO BaiTapHTTT3.PHANCONG VALUES ('VN550', 'NV01', 'Co truong');
INSERT INTO BaiTapHTTT3.PHANCONG VALUES ('VN550', 'NV02', 'Tiep vien');
INSERT INTO BaiTapHTTT3.PHANCONG VALUES ('BL696', 'NV03', 'Tiep vien truong');

--Cau 5 
SELECT * 
FROM BaiTapHTTT3.NHANVIEN 
WHERE EXTRACT(MONTH FROM NGSINH) = 7;

--Cau 6
SELECT MACB,COUNT(MANV) AS SONV
FROM BaiTapHTTT3.PHANCONG 
GROUP BY MACB ORDER BY SONV DESC
FETCH FIRST 1 ROWS ONLY;

-- Cau 7
SELECT MAHANG, COUNT(PC.MACB) AS SOCHUYENBAY
FROM BaiTapHTTT3.CHUYENBAY CB, BaiTapHTTT3.PHANCONG PC
WHERE CB.MACB = PC.MACB 
AND CB.XUATPHAT = 'Da Nang'
AND CB.MACB IN 
GROUP BY CB.MAHANG

SELECT MAHANG, COUNT(MACB) AS SOCHUYENBAY
FROM BaiTapHTTT3.CHUYENBAY
WHERE MACB IN 
(
    (SELECT PC.MACB
    FROM BaiTapHTTT3.PHANCONG PC
    GROUP BY PC.MACB HAVING COUNT(MANV) < 2)

) AND XUATPHAT = 'Da Nang'
GROUP BY MAHANG

-- Cau 8
SELECT * 
FROM BaiTapHTTT3.NHANVIEN NV
WHERE NOT EXISTS (
    SELECT *
    FROM BaiTapHTTT3.CHUYENBAY CB
    WHERE NOT EXISTS (
        SELECT * 
        FROM BaiTapHTTT3.PHANCONG PC
        WHERE NV.MANV = PC.MANV 
        AND CB.MACB = PC.MACB
    )
)
        


