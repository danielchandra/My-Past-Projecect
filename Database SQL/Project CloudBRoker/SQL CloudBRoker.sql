--Daniel Chandra - 2301888631
--Alvin Harjadi
--Leonardo Dylan
--Christianto Herpin

DROP DATABASE PROJECTDB
CREATE DATABASE PROJECTDB
USE PROJECTDB

--Proses Pembuatan Tabel--
CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY
	CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	--Jumlah minimal 2 kata
	CustomerName VARCHAR(255)
	CHECK (CustomerName LIKE '_%'),
	CustomerEmail VARCHAR(255),
	[Address] VARCHAR(255),
	DateOfBirth date,
	--Male / Female
	CustomerGender VARCHAR(255)
	CHECK (CustomerGender IN ('Male' , 'Female')),
	--12 Angka
	PhoneNumber CHAR(12),
	[Password] VARCHAR(255),
	CustomerBalance int
)

CREATE TABLE CloudProvider(
	CloudID CHAR(5) PRIMARY KEY
	CHECK (CloudID LIKE 'CP[0-9][0-9][0-9]'),
	CloudName VARCHAR(255),
	CloudEmail VARCHAR(255),
	Region VARCHAR(255),
	CloudURL VARCHAR(255)
)

CREATE TABLE Processor(
	ProcessorID CHAR(5) PRIMARY KEY
	CHECK (ProcessorID LIKE 'PR[0-9][0-9][0-9]'),
	ProcessorName VARCHAR(255),
	Cores int,
	BaseClockSpeed VARCHAR(255),
	BoostClockSpeed VARCHAR(255)
)

CREATE TABLE OperatingSystem(
	OperatingID CHAR(5) PRIMARY KEY
	CHECK (OperatingID LIKE 'OS[0-9][0-9][0-9]'),
	OperatingName VARCHAR(255),
	Family VARCHAR(255),
	--Operating system price must be between 500000 and 1500000
	OperatingPrice int
	CHECK (OperatingPrice BETWEEN 500000 and 1500000)
)

CREATE TABLE DBMS(
	DBMSID CHAR(5) PRIMARY KEY
	CHECK (DBMSID LIKE 'DS[0-9][0-9][0-9]'),
	DBMSName VARCHAR(255),
	DBMSUrl VARCHAR(255)
)

CREATE TABLE [Database](
	DatabaseID CHAR(5) PRIMARY KEY
	CHECK (DatabaseID LIKE 'DB[0-9][0-9][0-9]'),
	DBMSID CHAR(5) 
	FOREIGN KEY REFERENCES DBMS(DBMSID),
	--Database storage must be more than 0
	DatabaseStorage int
	CHECK (DatabaseStorage > 0),
	DatabasePrice int
)

CREATE TABLE [Server](
	ServerID CHAR(5) PRIMARY KEY
	CHECK (ServerID LIKE 'SV[0-9][0-9][0-9]'),
	DatabaseID CHAR(5) 
	FOREIGN KEY REFERENCES [Database](DatabaseID),
	ProcessorID CHAR(5)
	FOREIGN KEY REFERENCES Processor(ProcessorID),
	OperationID CHAR(5)
	FOREIGN KEY REFERENCES OperatingSystem(OperatingID),
	ServerName VARCHAR(255),
	--Server memory must be any number that is divisible by 2 (even numbers).
	Memory int
	CHECK (Memory %2 = 0),
	--Server price must be between 10000 and 300000
	ServerPrice int
	CHECK (ServerPrice between 10000 and 300000),
	ServerStorage int
)

CREATE TABLE [Transaction](
	TransactionID CHAR(5) PRIMARY KEY
	CHECK (TransactionID LIKE 'TR[0-9][0-9][0-9]'),
	CustomerID CHAR(5)
	FOREIGN KEY REFERENCES Customer(CustomerID),
	CloudID CHAR(5)
	FOREIGN KEY REFERENCES CloudProvider(CloudID),
	DatabaseID CHAR(5)
	FOREIGN KEY REFERENCES [Database](DatabaseID),
	ServerID CHAR(5)
	FOREIGN KEY REFERENCES [Server](ServerID),
	TransactionHistory date
)

--Proses Insert 15 Data pada Tabel--
INSERT INTO Processor VALUES
('PR001','Ryzen 1',1,10000,11000),
('PR002','Ryzen 2',2,12000,20000),
('PR003','Ryzen 3',3,13000,30000),
('PR004','Ryzen 4',4,14000,40000),
('PR005','Ryzen 5',5,15000,50000),
('PR006','Intel 1',1,10500,11000),
('PR007','Intel 2',2,12500,22000),
('PR008','Intel 3',3,13500,33000),
('PR009','Intel 4',4,14500,44000),
('PR010','Intel 5',5,15500,55000),
('PR011','Apple M1',1,10000,20000),
('PR012','Apple M2',2,20000,30000),
('PR013','Apple M3',3,30000,40000),
('PR014','Apple M4',4,40000,50000),
('PR015','Apple M5',5,50000,60000)


INSERT INTO OperatingSystem VALUES
('OS001','Radeon 1','AMD 1',510000),
('OS002','Radeon 2','AMD 2',520000),
('OS003','Radeon 3','AMD 3',530000),
('OS004','Radeon 4','AMD 4',540000),
('OS005','Radeon 5','AMD 5',550000),
('OS006','Atom 1','Xeon 1',610000),
('OS007','Atom 2','Xeon 2',620000),
('OS008','Atom 3','Xeon 3',630000),
('OS009','Atom 4','Xeon 4',640000),
('OS010','Atom 5','Xeon 5',650000),
('OS011','Apple 1','iMac 1',710000),
('OS012','Apple 2','iMac 2',720000),
('OS013','Apple 3','iMac 3',730000),
('OS014','Apple 4','iMac 4',740000),
('OS015','Apple 5','iMac 5',750000)


INSERT INTO DBMS VALUES
('DS001','semut DBMS','https://semut.com'),
('DS002','rayap DBMS','https://rayap.com'),
('DS003','DBMS katak','https://katak.com'),
('DS004','kodok','https://kodok.com'),
('DS005','kelinci','https://kelinci.com'),
('DS006','salmon','https://salmon.com'),
('DS007','teri','https://teri.com'),
('DS008','nyamuk','https://nyamuk.com'),
('DS009','bangau','https://bangau.com'),
('DS010','gajah DBMS','https://gajah.com'),
('DS011','singa','https://singa.com'),
('DS012','harimau DBMS','https://harimau.com'),
('DS013','tikus','https://tikus.com'),
('DS014','DBMS monyet','https://monyet.com'),
('DS015','DBMS kucing','https://kucing.com')


INSERT INTO [Database] VALUES 
('DB001','DS001',1,500000),
('DB002','DS002',2,600000),
('DB003','DS003',2,650000),
('DB004','DS004',3,500000),
('DB005','DS005',4,850000),
('DB006','DS006',6,550000),
('DB007','DS007',7,950000),
('DB008','DS008',8,1000000),
('DB009','DS009',10,1200000),
('DB010','DS010',11,1250000),
('DB011','DS011',9,1300000),
('DB012','DS012',7,1400000),
('DB013','DS013',11,1500000),
('DB014','DS014',3,1600000),
('DB015','DS015',2,1700000)


INSERT INTO [Server] VALUES
('SV001','DB001','PR001','OS001','Lisa Su Server',2,110000,4),
('SV002','DB002','PR002','OS002','Susan Lisa Server',6,120000,6),
('SV003','DB003','PR003','OS003','North Server',8,130000,8),
('SV004','DB004','PR004','OS004','South Su Server',10,140000,10),
('SV005','DB005','PR005','OS005','West Su Server',12,150000,10),
('SV006','DB006','PR006','OS006','Pat Gelsinger Server',2,210000,14),
('SV007','DB007','PR007','OS007','Google Drive Server',6,220000,16),
('SV008','DB008','PR008','OS008','Lastpass Server',8,230000,20),
('SV009','DB009','PR009','OS009','Glass Wire Server',10,240000,10),
('SV010','DB010','PR010','OS010','Chandra Server',12,250000,12),
('SV011','DB011','PR011','OS011','Tim Cook Server',2,211000,4),
('SV012','DB012','PR012','OS012','Iphone Server',6,222000,6),
('SV013','DB013','PR013','OS013','Ipad Server ',8,233000,8),
('SV014','DB014','PR014','OS014','Macbook Cook Server',10,244000,1),
('SV015','DB015','PR015','OS015','Apple Exclusive Cook Server',12,255000,12)


INSERT INTO Customer VALUES 
('CU001','Alvin Harjadi','alvin@gmail.com','jalan kemanggisan blok 1','2001-3-10','Male','081234567890','12345678',900000),
('CU002','Christianto Herpin','herpin@gmail.com','jalan syahdan blok 2','2001-5-6','Male','081728827176','12345678',650000),
('CU003','Daniel Chandra','daniel@gmail.com','jalan kijang blok 3','2001-5-5','Male','081927362828','12345678',800000),
('CU004','Leonardo Dylan','dylan@gmail.com','jalan kemanggisan blok 4','2001-6-12','Male','087281927336','12345678',700000),
('CU005','Amira Wijaya','amir@gmail.com','jalan syahdan blok 5','2000-5-20','Female','083272582336','12345678',750000),
('CU006','Bono Cahyadi','bono@gmail.com','jalan pelangi blok 6','2000-4-12','Male','088912637456','12345678',650000),
('CU007','Cana Hartanto','cana@gmail.com','jalan hujan indah 7','2000-5-12','Female','081728364536','12345678',800000),
('CU008','Dono Egil','dono@gmail.com','jalan pondok lagun blok 8','2000-5-30','Male','089102837738','12345678',670000),
('CU009','Eria Fasah','eria@gmail.com','jalan gunung merah blok 9','2000-6-28','Female','088193762818','12345678',650000),
('CU010','Fara Kevin','fara@gmail.com','jalan kaki seratus blok 10','2000-9-18','Female','087812536452','12345678',1000000),
('CU011','Gana Ilen','gana@gmail.com','jalan merah tanah blok 11','2000-8-11','Male','086817162781','12345678',600000),
('CU012','Heri Olong','heri@gmail.com','jalan batu berbatu blok 12','2000-7-13','Male','081826281720','12345678',800000),
('CU013','Inem Markus','inem@gmail.com','jalan kolong langit blok 13','2000-6-14','Female','081926382212','12345678',800000),
('CU014','Jana Alim','jana@gmail.com','jalan kemanggiasn raya blok 14','2000-7-7','Female','081028162791','12345678',900000),
('CU015','Kara Swanto','kara@gmail.com','jalan alam sutra blok 15','2000-4-30','Female','081926353797','12345678',850000)


INSERT INTO CloudProvider VALUES
('CP001','Apple Cloud','appleTree@gmail.com','America','https://Apple.com'),
('CP002','Orange Cloud','orangeTree@gmail.com','Brazil','https://Orange.com'),
('CP003','Manggo Tree','manggoTree@gmail.com','China','https://manggo.com'),
('CP004','Melon Tree','melonTree@gmail.com','Denmark','https://Melon.com'),
('CP005','Watermelon Cloud','watermelonTree@gmail.com','Egypt','https://Watermelon.com'),
('CP006','Peach Tree','peachTree@gmail.com','Filipino','https://Peach.com'),
('CP007','Pineapple Tree Cloud','pineappleTree@gmail.com','Ghana','https://Pineapple.com'),
('CP008','Grape Tree Cloud','grapeTree@gmail.com','Havana','https://Grape.com'),
('CP009','Lemon Tree Cloud','lemonTree@gmail.com','Indonesia','https://Lemon.com'),
('CP010','Guava Tree Cloud','guavaTree@gmail.com','Japan','https://Guava.com'),
('CP011','Peer Tree','peerTree@gmail.com','Korea','https://Peer.com'),
('CP012','Banana Tree Cloud','bananaTree@gmail.com','Laos','https://Banana.com'),
('CP013','Blueberry Tree','blueberryTree@gmail.com','mexico','https://Blueberry.com'),
('CP014','Tomato Tree','tomatoTree@gmail.com','Nepal','https://Tomato.com'),
('CP015','Strawberry Tree','strawberryTree@gmail.com','Orlando','https://Strawberry.com')


INSERT INTO [Transaction] VALUES
-- masing masing customer 1
('TR001','CU001','CP001','DB001','SV001','2021-5-5'),
('TR002','CU002','CP012','DB002','SV002','2021-1-4'),
('TR003','CU003','CP003','DB003','SV003','2021-2-14'),
('TR004','CU004','CP005','DB004','SV004','2021-3-10'),
('TR005','CU005','CP005','DB005','SV005','2021-3-1'),
('TR006','CU006','CP008','DB006','SV006','2021-4-26'),
('TR007','CU007','CP007','DB007','SV007','2021-1-30'),
('TR008','CU008','CP008','DB008','SV008','2021-1-18'),
('TR009','CU009','CP008','DB009','SV009','2021-2-4'),
('TR010','CU010','CP010','DB010','SV010','2021-4-14'),
('TR011','CU011','CP011','DB011','SV011','2021-5-19'),
('TR012','CU012','CP012','DB012','SV012','2021-6-21'),
('TR013','CU013','CP013','DB013','SV013','2021-1-18'),
('TR014','CU014','CP014','DB014','SV014','2021-1-22'),
('TR015','CU015','CP015','DB015','SV015','2021-2-26'),
--Transaksi customer selanjutnya, (lebih dari 1)
('TR016','CU001','CP009','DB001','SV001','2021-5-6'),
('TR017','CU002','CP002','DB002','SV002','2021-1-8'),
('TR018','CU002','CP003','DB004','SV005','2021-1-10'),
('TR019','CU002','CP003','DB005','SV005','2021-2-1'),
('TR020','CU003','CP003','DB003','SV003','2021-2-20'),
('TR021','CU004','CP004','DB004','SV004','2021-3-12'),
('TR022','CU005','CP005','DB005','SV005','2021-3-15'),
('TR023','CU005','CP005','DB006','SV005','2021-5-10'),
('TR024','CU007','CP007','DB007','SV007','2021-1-31'),
('TR025','CU007','CP009','DB007','SV007','2021-2-10'),
('TR026','CU008','CP008','DB008','SV008','2021-2-12'),
('TR027','CU009','CP009','DB009','SV009','2021-2-6'),
('TR028','CU010','CP010','DB010','SV010','2021-4-18'),
('TR029','CU010','CP009','DB011','SV011','2021-5-10'),
('TR030','CU010','CP012','DB012','SV012','2021-5-11'),
('TR031','CU013','CP013','DB013','SV013','2021-1-20'),
('TR032','CU013','CP013','DB013','SV013','2021-1-22'),
('TR033','CU013','CP014','DB013','SV015','2021-1-30'),
('TR034','CU015','CP015','DB015','SV015','2021-2-20')

SELECT*FROM Customer
SELECT*FROM [Database]
SELECT*FROM CloudProvider
SELECT*FROM DBMS
SELECT*FROM [Transaction]
SELECT*FROM [Server]
SELECT*FROM Processor
SELECT*FROM OperatingSystem

--10 Select Soal Pertanyaan

--1. Display customer name and Cloud Providers Count
--SELESAI
--Pake CountCloudID dari Trans
SELECT CustomerName, CloudProviderCount = COUNT(t.CloudID) FROM Customer
JOIN [Transaction] t
ON Customer.CustomerID = t.CustomerID
JOIN CloudProvider cp
ON t.CloudID = cp.CloudID
WHERE CustomerName LIKE '%e%' and DATEDIFF(DAY,DateOfBirth,GETDATE()) % 2 = 0
GROUP BY CustomerName

--CEK JAWABAN
SELECT * FROM [Transaction]
SELECT * FROM Customer
WHERE CustomerName LIKE '%e%' and DATEDIFF(DAY,DateOfBirth,GETDATE()) % 2 = 0

--2. Display server name and Total Price 
--SELESAI
SELECT ServerName, + 'Rp.' + CAST(ServerPrice + OperatingPrice + DatabasePrice AS VARCHAR) + ',-' AS TotalPrice FROM [Server]
JOIN OperatingSystem
ON [Server].OperationID = [OperatingSystem].OperatingID
JOIN [Database]
ON [Server].DatabaseID = [Database].DatabaseID
WHERE Memory > 2 and DatabaseStorage > 1

--CEK JAWABAN
SELECT * FROM [Server]
SELECT * FROM OperatingSystem
SELECT * FROM [Database]

--3. Display Initial, Database Price and Transaction Count 
--Pake Count ID
--DataPrice masih belum digabung (databaseId), mau pake sum tapi error
SELECT LEFT(CustomerName,1) + LEFT(PARSENAME(REPLACE(CustomerName, ' ', '.'), 1),1) AS InitialName, DatabasePrice = DatabasePrice*COUNT(t.DatabaseID) , TransactionCount = Count(t.DatabaseID) FROM [Customer]
JOIN [Transaction] t
ON  Customer.CustomerID = t.CustomerID
JOIN [Database] db
ON db.DatabaseID = t.DatabaseID
WHERE DatabaseStorage > 2 AND CustomerGender LIKE('Female')
GROUP BY db.Databaseid,CustomerName, DatabasePrice

--CEK JAWABAN
SELECT * FROM Customer
SELECT * FROM [Transaction]
SELECT * FROM [Database]

--4. Display Cloud Company, Total Transaction and Customer Average Account Balance
--SELESAI
--Masalah Where Count harus pake HAVING, kalau taruh di where gak bisa jalan
--Pake Count
SELECT LEFT(CloudName,charindex(' ',CloudName)) + 'Company' as CloudCompany, TotalTransaction = COUNT(t.CloudID), CustomerBalance = AVG(cu.CustomerBalance) FROM CloudProvider c
JOIN [Transaction] t
ON c.CloudID = t.CloudID
JOIN [Customer] cu
ON t.CustomerID = cu.CustomerID
WHERE CloudName LIKE ('%Cloud%')
GROUP BY CloudName
HAVING COUNT(t.CloudID) > 1

--5. Display Server Initial, processor name, and server storage 
--SELESAI
SELECT UPPER(LEFT(ServerName,5) + '-' + RIGHT(ServerID,3)) AS ServerIntial, ProcessorName, ServerStorage FROM [Server]
JOIN Processor
ON [Server].ProcessorID = Processor.ProcessorID
JOIN [Database]
ON [Server].DatabaseID = [Database].DatabaseID
WHERE ServerStorage > (SELECT MAX(DatabaseStorage) FROM [Database] AS MAXDB) and CORES >= 4

--CEK JAWABAN
SELECT DatabasePrice FROM [Database]
WHERE DatabasePrice > (SELECT AVG(DatabasePrice) FROM [Database])

--CEK JAWABAN
SELECT * FROM [Server]
SELECT * FROM Processor

--6. Display DBMS software name, database price, database storage “GB”, and DBMS software website URL 
--SELESAI
SELECT DBMSName, DatabasePrice, CAST(DatabaseStorage AS VARCHAR) + 'GB' AS DatabaseStorage, (SELECT REPLACE(DBMSUrl,'https://','')) AS WebsiteURL FROM DBMS
JOIN [Database]
ON DBMS.DBMSID = [Database].DBMSID
JOIN [Server]
ON [Database].DatabaseID = [Server].DatabaseID
WHERE DatabasePrice > (SELECT AVG(ServerPrice) FROM [Server]) and DBMSName LIKE '%DB%'

--CEK JAWABAN
SELECT AVG(ServerPrice) FROM [Server]
 
--7. Display Server Code ,Storage and Price 
--SELESAI
--Hasil tidak akan muncul karena Operating 500.000-1.500.000 sedangkan ServerPrice 10.000-300.000,
--soalnya mau muncul server price yang lebih besar dari max nilai operating
SELECT UPPER(LEFT(Servername,5) + '-' + RIGHT(ServerID,2) + '-' + CAST(DatabaseStorage AS VARCHAR)) AS ServerCode, CAST(DatabaseStorage AS VARCHAR) + 'GB' AS Storage, 'Rp.' + CAST(DatabasePrice AS VARCHAR) AS PRICE
FROM [Server]
JOIN [Database]
ON [Database].DatabaseID = [Server].DatabaseID
JOIN OperatingSystem
ON OperatingSystem.OperatingID = [Server].OperationID
WHERE ServerPrice > (SELECT MAX(OperatingPrice) FROM OperatingSystem) and ServerStorage > (SELECT AVG(DatabaseStorage) FROM [Database])

--CEK JAWABAN
SELECT MAX(OperatingPrice) FROM OperatingSystem
SELECT AVG(DatabaseStorage) FROM [Database]

--8. Display Database Code, and DBMS software ID 
--SELESAI
--disini mau pake a & b karena kedua ID mengandung string yang sama
SELECT RIGHT(a.[DatabaseID],3) + '-' + RIGHT(b.[DBMSID],3)  + '-' + CAST(DatabaseStorage AS VARCHAR) + 'GB' AS DatabaseCode FROM [Database] a
JOIN DBMS b
ON a.DBMSID = b.DBMSID
JOIN [Server]
ON a.DatabaseID = [Server].DatabaseID
JOIN OperatingSystem
ON	[Server].OperationID = OperatingSystem.OperatingID
WHERE DatabasePrice BETWEEN (SELECT MIN(ServerPrice) FROM [Server]) AND (SELECT AVG(OperatingPrice) FROM OperatingSystem) and b.DBMSID IN ('DS006','DS007')

--CEK JAWABAN
SELECT MIN(ServerPrice) FROM [Server]
SELECT AVG(OperatingPrice) FROM OperatingSystem

--9. Create a view named as “Affordable Server View” 
--SELESAI
CREATE VIEW Affordable_Server_VIEW
as
	SELECT ServerName, ProcessorName, OperatingName, CAST(Memory AS VARCHAR) + 'GB' AS ServerMemory FROM [Server]
	JOIN Processor
	ON [Server].ProcessorID = Processor.ProcessorID
	JOIN OperatingSystem
	ON [Server].OperationID = OperatingSystem.OperatingID
	WHERE ServerPrice BETWEEN (SELECT MIN(ServerPrice) FROM [Server]) AND (SELECT AVG(ServerPrice) FROM [Server]) and Memory >= 4
go
SELECT * FROM Affordable_Server_VIEW

--CEK JAWABAN

--10. Create a view named as “Popular Cheap Databases View” \
--SELESAI
--Pake Count ID
CREATE VIEW Popular_Cheap_Database_View
as
	SELECT DBMSName, DBMSURL, CAST(DatabaseStorage AS VARCHAR) + 'GB' AS Storage, TransactionCount = COUNT(t.DatabaseID) FROM [Database] db
	JOIN DBMS ds
	ON db.DBMSID = ds.DBMSID
	JOIN [Transaction] t
	ON t.DatabaseID = db.DatabaseID
	WHERE DatabasePrice <= (SELECT AVG(DatabasePrice) FROM [Database])
	GROUP BY DBMSName,DBMSUrl,DatabaseStorage
	HAVING COUNT(t.DatabaseID) > 2
go
SELECT * FROM Popular_Cheap_Database_View















