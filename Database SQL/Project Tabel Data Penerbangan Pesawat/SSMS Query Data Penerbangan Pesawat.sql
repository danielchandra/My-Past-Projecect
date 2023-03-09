CREATE DATABASE PenerbanganPesawat
USE PenerbanganPesawat

--JadwalPenerbangan
CREATE TABLE JadwalPenerbangan(
	KodePenerbangan CHAR(5) NOT NULL,
	KodeBandara CHAR(3) NOT NULL,
	KodePesawat CHAR(2) NOT NULL,
	Pilot VARCHAR(50) NOT NULL,
	BandaraAsal VARCHAR(50)NOT NULL,
	BandaraTujuan VARCHAR(50) NOT NULL,
	WaktuBerangkat time(4) NOT NULL,
	WaktuTiba time(4) NOT NULL
)

SELECT * FROM JadwalPenerbangan
DROP TABLE JadwalPenerbangan	

--Bandara
CREATE TABLE Bandara(
	KodeBandara CHAR(3) NOT NULL,
	NamaBandara VARCHAR(50) NOT NULL,
	NamaKota VARCHAR(50) NOT NULL
)

SELECT * FROM Bandara
DROP TABLE 	Bandara

--Pesawat
CREATE TABLE Pesawat(
	KodePesawat CHAR(2) NOT NULL,
	KodePenerbangan CHAR(5) NOT NULL,
	KodeBandara CHAR(3) NOT NULL,
	NamaPesawat VARCHAR(50) NOT NULL,
	Kapasitas int NOT NULL
)

SELECT * FROM Pesawat
DROP TABLE Pesawat

--Transaksi
CREATE TABLE Transaksi(
	KodeTransaksi CHAR(6) NOT NULL,
	NamaPenumpang VARCHAR(50) NOT NULL,
	Alamat VARCHAR(50) NOT NULL,
	Kontak VARCHAR(50),
	Email VARCHAR(50),
	KodePenerbangan CHAR(5) NOT NULL,
	KodeBandara CHAR(3) NOT NULL,
	KodePesawat CHAR(2) NOT NULL,
	JumlahPembayaran int NOT NULL,
	WaktuTransaksi time(7) NOT NULL
)

SELECT * FROM Transaksi
DROP TABLE Transaksi

--Penumpang
CREATE TABLE Penumpang(
	NamaPenumpang VARCHAR(50) NOT NULL,
	KodePenerbangan CHAR(5) NOT NULL,
	KodeBandara CHAR(3) NOT NULL,
	KodePesawat CHAR(2) NOT NULL,
	KodeTransaksi CHAR(6) NOT NULL,
	KodeKursi CHAR(3) NOT NULL,
	Alamat VARCHAR(50) NOT NULL,
	Kontak VARCHAR(50),
	Email VARCHAR(50),
)

SELECT * FROM Penumpang
DROP TABLE Penumpang

--PRIMARY KEY
ALTER TABLE JadwalPenerbangan
ADD CONSTRAINT PK_KodePenerbangan
PRIMARY KEY(KodePenerbangan)

ALTER TABLE Bandara
ADD CONSTRAINT PK_KodeBandara
PRIMARY KEY(KodeBandara)

ALTER TABLE Transaksi
ADD CONSTRAINT PK_KodeTransaksi
PRIMARY KEY(KodeTransaksi)

--FOREIGN KEY REFERENCES
--Pesawat
ALTER TABLE Pesawat
ADD CONSTRAINT FK_PesawatKodePenerbangan
FOREIGN KEY (KodePenerbangan) REFERENCES JadwalPenerbangan(KodePenerbangan)

ALTER TABLE Pesawat
ADD CONSTRAINT FK_PesawatKodeBandara
FOREIGN KEY (KodeBandara) REFERENCES Bandara(KodeBandara)

--Jadwal
ALTER TABLE JadwalPenerbangan
ADD CONSTRAINT FK_JadwalPenerbanganKodeBandara
FOREIGN KEY (KodeBandara) REFERENCES Bandara(KodeBandara)

--Penumpang
ALTER TABLE Penumpang
ADD CONSTRAINT FK_PenumpangKodePenerbangan
FOREIGN KEY (KodePenerbangan) REFERENCES JadwalPenerbangan(KodePenerbangan)

ALTER TABLE Penumpang
ADD CONSTRAINT FK_PenumpangKodeTransaksi
FOREIGN KEY (KodeTransaksi) REFERENCES Transaksi(KodeTransaksi)

--Transaksi
ALTER TABLE Transaksi
ADD CONSTRAINT FK_TransaksiKodePenerbangan
FOREIGN KEY (KodePenerbangan) REFERENCES JadwalPenerbangan(KodePenerbangan)

--INSERT
--INSERT JADWAL
INSERT INTO JadwalPenerbangan VALUES
('GI150','CGK','GI','Wawan','Soekarno Hatta','Kualanamo','10:00','12:15'),
('GI990','CGK','GI','Alex','Soekarno Hatta','Ahmad Yani','19:30','21:45'),
('LA537','KNO','LA','Dadang','Kualanamo','Soekarno Hatta','11:00','13:10'),
('CT773','SRG','CT','Budi','Ahmad Yani','Soekarno Hatta','13:30','15:50')

SELECT * FROM JadwalPenerbangan

--INSERT BANDARA
INSERT INTO Bandara VALUES
('CGK','Soekarno Hatta','Medan'),
('KNO','Kualanamo','Jakarta'),
('SRG','Ahmad Yani','Semarang')

SELECT * FROM Bandara

--INSERT PESAWAT
INSERT INTO Pesawat VALUES
('GI','GI150','KNO','Garuda Indonesia',350),
('GI','GI990','SRG','Garuda Indonesia',350),
('LA','LA537','CGK','Lion Air',320),
('CT','CT773','CGK','Citilink',335)

SELECT * FROM Pesawat

--INSERT TRANSAKSI
INSERT INTO Transaksi VALUES
('GIALVI','Alvin Harjadi','Jakarta Barat','081234567890','alvinharjadi@gmail.com','GI150','CGK','GI',1500000,'09:00'),
('GIJONA','Jonathan Valiant','Jakarta Barat','081234567891','jonathanvaliant@gmail.com','GI990','CGK','GI',2000000,'08:00'),
('LADANI','Daniel Chandra','Medan Petisah','081234567892','danielchandra@gmail.com','LA537','KNO','LA',2500000,'10:00'),
('LACHRI','Christianto Herpin','Medan Kota','081234567893','christiantoherpin@gmail.com','LA537','KNO','LA',1750000,'11:00'),
('CTIWAN','Iwan','Semarang','081234567894','iwan@gmail.com','CT773','SRG','CT',1800000,'12:00'),
('CTMART','Martin','Semarang','081234567895','martin@gmail.com','CT773','SRG','CT',2000000,'13:00')

SELECT * FROM Transaksi

--INSERT PENUMPANG
INSERT INTO Penumpang VALUES
('Alvin Harjadi','GI150','CGK','GI','GIALVI','10A','Jakarta Barat','081234567890','alvinharjadi@gmail.com'),
('Jonathan Valiant','GI990','CGK','GI','GIJONA','10B','Jakarta Barat','081234567891','jonathanvaliant@gmail.com'),
('Daniel Chandra','LA537','KNO','LA','LADANI','10C','Medan Petisah','081234567892','danielchandra@gmail.com'),
('Christianto Herpin','LA537','KNO','LA','LACHRI','10D','Medan Kota','081234567893','christiantoherpin@gmail.com'),
('Iwan','CT773','SRG','CT','CTIWAN','10E','Semarang','081234567894','iwan@gmail.com'),
('Martin','CT773','SRG','CT','CTMART','10F','Semarang','081234567895','martin@gmail.com')

SELECT * FROM Penumpang


