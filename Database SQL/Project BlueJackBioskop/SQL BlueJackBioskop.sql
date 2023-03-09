--Daniel Chandra
--2301888631
--BA05
--UAP 22 Juni 2021
CREATE DATABASE BluejackBioskop
GO
USE BluejackBioskop

--DROP DATABASE BluejackBioskop

CREATE TABLE Customer(
	CustomerID CHAR(5) PRIMARY KEY,
	CustomerName VARCHAR(30),
	CustomerEmail VARCHAR(30),
	CustomerAddress VARCHAR(30),
	CustomerDOB DATE,
	CustomerPhoneNumber CHAR(10)
)
GO
CREATE TABLE StaffRole(
	StaffRoleID CHAR(5) PRIMARY KEY,
	StaffRoleName VARCHAR(30),
	StaffRoleSalary INT,
	StaffRoleWorkHour INT
)
GO
CREATE TABLE Staff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(30),
	StaffEmail VARCHAR(30),
	StaffAddress VARCHAR(30),
	StaffDOB DATE,
	StaffRoleID CHAR(5) FOREIGN KEY REFERENCES StaffRole(StaffRoleID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO
CREATE TABLE FilmGenre(
	FilmGenreID CHAR(5) PRIMARY KEY,
	FilmGenreName VARCHAR(30)
)
GO
CREATE TABLE Film(
	FilmID CHAR(5) PRIMARY KEY,
	FilmName VARCHAR(30),
	FilmShowTime VARCHAR(30),
	FilmPriceTicket INT,
	FilmGenreID CHAR(5) FOREIGN KEY REFERENCES FilmGenre(FilmGenreID) ON UPDATE CASCADE ON DELETE CASCADE
)
GO
CREATE TABLE HeaderTransaction(
	TransactionID CHAR(5) PRIMARY KEY,
	CustomerID CHAR(5) FOREIGN KEY REFERENCES Customer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	StaffID CHAR(5) FOREIGN KEY REFERENCES Staff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	TransactionDate DATE,
)
GO
CREATE TABLE DetailTransaction(
	TransactionID CHAR(5) FOREIGN KEY REFERENCES HeaderTransaction(TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	FilmID CHAR(5) FOREIGN KEY REFERENCES Film(FilmID) ON UPDATE CASCADE ON DELETE CASCADE,
	Quantity INT
	PRIMARY KEY (TransactionID, FilmID)
)

insert into Customer values ('CU001', 'Myrtie', 'mtorfin0@liveinternet.ru', '8 Sunbrook Terrace', '2010-04-18 17:12:10', '9792164596');
insert into Customer values ('CU002', 'Hayes', 'hwinsborrow1@ox.ac.uk', '3 Westport Terrace', '2003-02-18 07:08:31', '2896900758');
insert into Customer values ('CU003', 'Jeff', 'jnehlsen2@instagram.com', '0355 Pepper Wood Parkway', '2016-11-21 08:01:36', '6274531061');
insert into Customer values ('CU004', 'Ainsley', 'amurname3@infoseek.co.jp', '2 Sundown Trail', '2014-07-31 06:40:07', '2658054652');
insert into Customer values ('CU005', 'Berty', 'bdenholm4@mapquest.com', '2973 Spenser Pass', '2003-05-05 02:45:54', '6072345623');
insert into Customer values ('CU006', 'Dorian', 'dbridgens5@yahoo.co.jp', '51 Fairfield Street', '2014-08-15 11:38:22', '1732750782');
insert into Customer values ('CU007', 'Joletta', 'jfirk6@ibm.com', '34 Washington Crossing', '2003-12-08 11:10:25', '7311106328');
insert into Customer values ('CU008', 'Tina', 'tholby7@vk.com', '2710 Dexter Avenue', '2008-06-30 19:38:40', '8888780975');
insert into Customer values ('CU009', 'Waldo', 'wkerfut8@tinypic.com', '0944 Aberg Way', '2008-01-08 20:03:02', '4527349862');
insert into Customer values ('CU010', 'Melisandra', 'mmclagain9@economist.com', '7438 Fuller Drive', '2015-01-21 08:12:57', '3639194117');
insert into Customer values ('CU011', 'Sidney', 'svalianta@ihg.com', '8 Nancy Parkway', '2017-05-17 14:31:48', '5708175171');
insert into Customer values ('CU012', 'Carmina', 'crobbinsb@issuu.com', '0 Tomscot Trail', '2003-01-09 04:27:53', '5376252735');
insert into Customer values ('CU013', 'Prudy', 'ptookc@so-net.ne.jp', '73300 Miller Street', '2010-06-01 21:51:37', '6483819293');
insert into Customer values ('CU014', 'Lonnie', 'lgreaderd@si.edu', '5888 Muir Court', '2003-04-18 10:40:08', '2531125921');
insert into Customer values ('CU015', 'Cindra', 'cbrehenye@delicious.com', '2 8th Hill', '2004-04-17 13:56:23', '4887805858');
insert into Customer values ('CU016', 'Padgett', 'pmctrustyf@altervista.org', '10107 Hudson Trail', '2000-11-23 14:03:08', '2483046481');
insert into Customer values ('CU017', 'Carole', 'ckarchowskig@rambler.ru', '90987 East Avenue', '2009-06-22 12:00:18', '7142352098');
insert into Customer values ('CU018', 'Eliza', 'ekitteringhamh@opera.com', '15 Arrowood Plaza', '2019-10-25 04:57:39', '1303020466');
insert into Customer values ('CU019', 'Hinze', 'hcarolani@blogtalkradio.com', '493 Old Shore Avenue', '2019-11-01 10:12:01', '6926465233');
insert into Customer values ('CU020', 'Datha', 'drenadj@ehow.com', '71767 Shopko Crossing', '2002-12-22 07:25:49', '7256308848');
insert into Customer values ('CU021', 'Jere', 'joxnamk@prnewswire.com', '3034 Armistice Plaza', '2012-06-27 06:17:37', '5574302562');
insert into Customer values ('CU022', 'Tallie', 'toliveyl@cafepress.com', '7 Derek Court', '2007-06-28 11:55:39', '8543009159');
insert into Customer values ('CU023', 'Duncan', 'dwaszczykowskim@google.es', '55442 Heath Road', '2014-03-10 05:37:14', '1992199249');
insert into Customer values ('CU024', 'Stefa', 'slambethn@123-reg.co.uk', '604 Saint Paul Court', '2015-05-18 11:25:07', '8845974490');
insert into Customer values ('CU025', 'Elmo', 'eguiduzzio@4shared.com', '5 Twin Pines Street', '2006-03-04 16:39:07', '7476768671');

insert into StaffRole VALUES ('SR001', 'Manager', 5000000, 10)
insert into StaffRole VALUES ('SR002', 'Cashier', 4000000, 9)
insert into StaffRole VALUES ('SR003', 'Cleaning Service', 3000000, 7)
insert into StaffRole VALUES ('SR004', 'Marketing', 2000000, 8)
insert into StaffRole VALUES('SR005', 'Security', 1500000, 4)

insert into Staff VALUES ('ST001', 'Juliann', 'jjaime0@wufoo.com', '488 Armistice Crossing', '2017-06-08 17:24:11', 'SR002');
insert into Staff VALUES ('ST002', 'Codi', 'cmacdowall1@princeton.edu', '0850 Eagle Crest Park', '2004-09-10 17:47:26', 'SR001');
insert into Staff VALUES ('ST003', 'Hagen', 'hbrennon2@e-recht24.de', '06330 Manley Way', '2012-04-13 03:38:29', 'SR002');
insert into Staff VALUES ('ST004', 'Jerry', 'jkarys3@symantec.com', '90305 Katie Terrace', '2019-06-14 05:51:40', 'SR005');
insert into Staff VALUES ('ST005', 'Barnabas', 'bfadian4@redcross.org', '32 Ohio Parkway', '2010-07-31 22:09:51', 'SR003');
insert into Staff VALUES ('ST006', 'Kirsten', 'kolerenshaw5@newsvine.com', '24 Springs Way', '2019-10-01 14:28:06', 'SR002');
insert into Staff VALUES ('ST007', 'Lissy', 'lquinton6@miitbeian.gov.cn', '377 Mifflin Circle', '2017-07-26 00:47:39', 'SR004');
insert into Staff VALUES ('ST008', 'Flinn', 'fcracknall7@independent.co.uk', '5147 Lyons Crossing', '2012-12-11 13:44:58', 'SR004');
insert into Staff VALUES ('ST009', 'Linnet', 'lselland8@odnoklassniki.ru', '708 Tennessee Terrace', '2017-12-23 11:14:22', 'SR002');
insert into Staff VALUES ('ST010', 'Merv', 'mlougheed9@netvibes.com', '9577 Forest Drive', '2012-03-25 04:12:56', 'SR002');

insert into FilmGenre (FilmGenreID, filmGenreName) values ('GE001', 'Drama');
insert into FilmGenre (FilmGenreID, filmGenreName) values ('GE002', 'Romance');
insert into FilmGenre (FilmGenreID, filmGenreName) values ('GE003', 'Adventure');
insert into FilmGenre (FilmGenreID, filmGenreName) values ('GE004', 'Action');
insert into FilmGenre (FilmGenreID, filmGenreName) values ('GE005', 'Horror');

insert into Film values ('FL001', 'Quarantine 2: Terminal', '07.00', 50000, 'GE001');
insert into Film values ('FL002', 'Dance of the Dead', '08.00', 60000, 'GE003');
insert into Film values ('FL003', 'Rock ''N'' Roll High School', '09.00', 80000, 'GE001');
insert into Film values ('FL004', 'Adam Had Four Sons', '10.00', 70000, 'GE002');
insert into Film values ('FL005', 'The Cyclone', '11.00', 30000, 'GE004');
insert into Film values ('FL006', 'Introduction to Physics, An', '12.00', 40000, 'GE005');
insert into Film values ('FL007', 'Show', '13.00', 20000, 'GE003');
insert into Film values ('FL008', 'Siblings', '14.00', 25000, 'GE002');
insert into Film values ('FL009', 'Pardon Us', '15.00', 45000, 'GE004');
insert into Film values ('FL010', 'Man''s Castle', '16.00', 75000, 'GE005');

insert into HeaderTransaction values ('TR001', 'CU001', 'ST001', '3/2/2021');
insert into HeaderTransaction values ('TR002', 'CU002', 'ST001', '3/2/2021');
insert into HeaderTransaction values ('TR003', 'CU002', 'ST001', '3/3/2021');
insert into HeaderTransaction values ('TR004', 'CU003', 'ST003', '2/28/2021');
insert into HeaderTransaction values ('TR005', 'CU004', 'ST003', '2/27/2021');
insert into HeaderTransaction values ('TR006', 'CU005', 'ST006', '2/27/2021');
insert into HeaderTransaction values ('TR007', 'CU006', 'ST009', '3/3/2021');
insert into HeaderTransaction values ('TR008', 'CU007', 'ST010', '2/27/2021');
insert into HeaderTransaction values ('TR009', 'CU008', 'ST010', '2/27/2021');
insert into HeaderTransaction values ('TR010', 'CU002', 'ST009', '3/3/2021');
insert into HeaderTransaction values ('TR011', 'CU003', 'ST009', '3/1/2021');
insert into HeaderTransaction values ('TR012', 'CU004', 'ST009', '2/28/2021');
insert into HeaderTransaction values ('TR013', 'CU005', 'ST009', '3/2/2021');
insert into HeaderTransaction values ('TR014', 'CU006', 'ST003', '3/3/2021');
insert into HeaderTransaction values ('TR015', 'CU007', 'ST003', '2/27/2021');
insert into HeaderTransaction values ('TR016', 'CU008', 'ST003', '2/27/2021');
insert into HeaderTransaction values ('TR017', 'CU009', 'ST006', '3/2/2021');
insert into HeaderTransaction values ('TR018', 'CU010', 'ST006', '2/27/2021');
insert into HeaderTransaction values ('TR019', 'CU011', 'ST001', '3/2/2021');
insert into HeaderTransaction values ('TR020', 'CU025', 'ST001', '3/3/2021');
insert into HeaderTransaction values ('TR021', 'CU011', 'ST001', '2/27/2021');
insert into HeaderTransaction values ('TR022', 'CU012', 'ST001', '2/28/2021');
insert into HeaderTransaction values ('TR023', 'CU014', 'ST001', '2/28/2021');
insert into HeaderTransaction values ('TR024', 'CU013', 'ST009', '2/28/2021');
insert into HeaderTransaction values ('TR025', 'CU015', 'ST009', '3/1/2021');
insert into HeaderTransaction values ('TR026', 'CU016', 'ST009', '2/27/2021');
insert into HeaderTransaction values ('TR027', 'CU017', 'ST010', '3/1/2021');
insert into HeaderTransaction values ('TR028', 'CU018', 'ST010', '3/3/2021');
insert into HeaderTransaction values ('TR029', 'CU019', 'ST010', '2/28/2021');
insert into HeaderTransaction values ('TR030', 'CU020', 'ST010', '3/3/2021');
insert into HeaderTransaction values ('TR031', 'CU021', 'ST010', '2/28/2021');
insert into HeaderTransaction values ('TR032', 'CU022', 'ST010', '2/28/2021');
insert into HeaderTransaction values ('TR033', 'CU023', 'ST006', '2/28/2021');
insert into HeaderTransaction values ('TR034', 'CU024', 'ST003', '3/2/2021');
insert into HeaderTransaction values ('TR035', 'CU025', 'ST003', '3/3/2021');

insert into DetailTransaction values ('TR001', 'FL001', 2);
insert into DetailTransaction values ('TR001', 'FL002', 1);
insert into DetailTransaction values ('TR002', 'FL002', 3);
insert into DetailTransaction values ('TR002', 'FL003', 5);
insert into DetailTransaction values ('TR002', 'FL004', 2);
insert into DetailTransaction values ('TR003', 'FL001', 4);
insert into DetailTransaction values ('TR004', 'FL002', 5);
insert into DetailTransaction values ('TR005', 'FL003', 7);
insert into DetailTransaction values ('TR005', 'FL004', 5);
insert into DetailTransaction values ('TR006', 'FL004', 3);
insert into DetailTransaction values ('TR007', 'FL006', 5);
insert into DetailTransaction values ('TR007', 'FL007', 6);
insert into DetailTransaction values ('TR007', 'FL008', 3);
insert into DetailTransaction values ('TR008', 'FL008', 2);
insert into DetailTransaction values ('TR009', 'FL009', 1);
insert into DetailTransaction values ('TR010', 'FL010', 1);
insert into DetailTransaction values ('TR011', 'FL010', 1);
insert into DetailTransaction values ('TR011', 'FL009', 2);
insert into DetailTransaction values ('TR012', 'FL009', 2);
insert into DetailTransaction values ('TR013', 'FL010', 2);
insert into DetailTransaction values ('TR013', 'FL006', 3);
insert into DetailTransaction values ('TR014', 'FL001', 2);
insert into DetailTransaction values ('TR015', 'FL002', 5);
insert into DetailTransaction values ('TR015', 'FL003', 2);
insert into DetailTransaction values ('TR016', 'FL006', 6);
insert into DetailTransaction values ('TR017', 'FL006', 4);
insert into DetailTransaction values ('TR018', 'FL006', 3);
insert into DetailTransaction values ('TR019', 'FL007', 4);
insert into DetailTransaction values ('TR019', 'FL008', 3);
insert into DetailTransaction values ('TR019', 'FL009', 4);
insert into DetailTransaction values ('TR020', 'FL001', 1);
insert into DetailTransaction values ('TR021', 'FL002', 1);
insert into DetailTransaction values ('TR021', 'FL003', 1);
insert into DetailTransaction values ('TR022', 'FL004', 1);
insert into DetailTransaction values ('TR023', 'FL004', 10);
insert into DetailTransaction values ('TR023', 'FL005', 11);
insert into DetailTransaction values ('TR024', 'FL006', 12);
insert into DetailTransaction values ('TR025', 'FL006', 8);
insert into DetailTransaction values ('TR025', 'FL007', 2);
insert into DetailTransaction values ('TR025', 'FL008', 3);
insert into DetailTransaction values ('TR026', 'FL008', 3);
insert into DetailTransaction values ('TR027', 'FL009', 3);
insert into DetailTransaction values ('TR028', 'FL001', 6);
insert into DetailTransaction values ('TR028', 'FL010', 6);
insert into DetailTransaction values ('TR029', 'FL010', 5);
insert into DetailTransaction values ('TR030', 'FL010', 8);
insert into DetailTransaction values ('TR031', 'FL001', 8);
insert into DetailTransaction values ('TR032', 'FL001', 8);
insert into DetailTransaction values ('TR032', 'FL002', 3);
insert into DetailTransaction values ('TR033', 'FL003', 5);
insert into DetailTransaction values ('TR034', 'FL004', 4);
insert into DetailTransaction values ('TR035', 'FL005', 4);

--1 (len)
SELECT FilmID, FilmName, FilmShowTime FROM Film
WHERE LEN(FilmName) > 15

--2 (lower, datename, month, join)
SELECT TransactionID, [Name] = LOWER(CustomerName), TransactionDate FROM HeaderTransaction h
JOIN Customer c
ON c.CustomerID = h.CustomerID
WHERE DATENAME(MONTH,TransactionDate) = 'March'

--3 (CAST)
SELECT [Title] = FilmName, Price = 'IDR ' + CAST(FilmPriceTicket AS VARCHAR) + ',-', GrossProfit = 'IDR ' + CAST((SUM(Quantity*FilmPriceTicket)) AS VARCHAR) + ',-'
FROM Film f
JOIN DetailTransaction d
ON d.FilmID = f.FilmID
WHERE FilmName LIKE '% %'
GROUP BY FilmName, FilmPriceTicket

--4 (convert, sum, cast, order by, year, len	
SELECT CustomerName, h.TransactionID, [Transaction Date] = convert(varchar,TransactionDate,107), [Total of Film] = CAST(COUNT(d.FilmID) AS VARCHAR) + ' film(s)', [Total of Quantity] = SUM(Quantity) FROM Customer c
JOIN HeaderTransaction h
ON h.CustomerID = c.CustomerID
JOIN DetailTransaction d
ON d.TransactionID = h.TransactionID
WHERE YEAR(CustomerDOB) % 2 = 0
GROUP BY CustomerName, h.TransactionID, TransactionDate
union
SELECT CustomerName, h.TransactionID, [Transaction Date] = convert(varchar,TransactionDate,107), [Total of Film] = CAST(COUNT(d.FilmID) AS VARCHAR) + ' film(s)', [Total of Quantity] = SUM(Quantity) FROM Customer c
JOIN HeaderTransaction h
ON h.CustomerID = c.CustomerID
JOIN DetailTransaction d
ON d.TransactionID = h.TransactionID
WHERE LEN(CustomerName) > 7
GROUP BY CustomerName, h.TransactionID, TransactionDate
ORDER BY SUM(Quantity) DESC

--5 (convert, month, in)
SELECT CustomerName, CustomerAddress, CustomerEmail, [CustomerDOB] = convert(varchar,CustomerDOB, 106) FROM Customer c
JOIN HeaderTransaction h
ON h.CustomerID = c.CustomerID
JOIN DetailTransaction d
ON d.TransactionID = h.TransactionID
JOIN Film f
ON f.FilmID = d.FilmID
JOIN FilmGenre g
ON g.FilmGenreID = f.FilmGenreID
WHERE MONTH(TransactionDate) = 2 and  FilmGenreName IN('Action')
ORDER BY CustomerAddress

--6 (alias subquery, avg, like, order by, distinct)
SELECT DISTINCT c.CustomerID, CustomerName, CustomerPhoneNumber, CustomerEmail FROM Customer c
JOIN HeaderTransaction h
ON h.CustomerID = c.CustomerID
JOIN DetailTransaction d
ON d.TransactionID = h.TransactionID,
(
	SELECT DISTINCT AVG(Quantity) AS Average
	FROM DetailTransaction
) x
WHERE Quantity > x.Average and CustomerName LIKE('%a%')
GROUP BY c.CustomerID, CustomerName, CustomerPhoneNumber, CustomerEmail
ORDER BY CustomerName
go

--7 (convert, right, create view)
--convert masih belum
CREATE VIEW ContractRoleView
AS
	SELECT StaffID = 'Staff '+ RIGHT(StaffID,1),StaffName,StaffAddress, StaffRoleName, StaffRoleSalary FROM Staff s
	JOIN StaffRole r
	ON r.StaffRoleID = s.StaffRoleID
	where StaffRoleName not like 'Cashier'
GO

SELECT * FROM ContractRoleView
go

--8 (datename, create view, order by, sum, weekday)
CREATE VIEW TransactionDataOfRomanceFilm
AS
	SELECT h.TransactionID, [Day of Transaction] = DATENAME(WEEKDAY,TransactionDate), TransactionDate, [Film Ttitle] = FilmName, [Total of Quantity] = SUM(Quantity)
	FROM HeaderTransaction h
	JOIN DetailTransaction d
	ON d.TransactionID = h.TransactionID
	JOIN Film f
	ON f.FilmID = d.FilmID
	JOIN FilmGenre g
	ON g.FilmGenreID = f.FilmGenreID
	WHERE FilmGenreName IN('Romance')
	GROUP BY h.TransactionID, TransactionDate, FilmName
	--di dalam create view tidak boleh ada order by karena jadi error ?
--	ORDER BY TransactionDate ASC
GO

SELECT * FROM TransactionDataOfRomanceFilm
ORDER BY TransactionDate ASC

go

--9 (alter table, add, add constraint, between)
--PAKE LEN ?
BEGIN TRAN
ALTER TABLE Customer
ADD [CustomerSocialMedia] varchar(30)
ROLLBACK

SELECT * FROM Customer

BEGIN TRAN
ALTER TABLE Customer
ADD CONSTRAINT CheckCustomerSocialMedia
CHECK (LEN(CustomerSocialMedia) between 5 and 25)
ROLLBACK

--10 (delete, join, month)
BEGIN TRAN
DELETE c FROM Customer c
JOIN HeaderTransaction h
ON h.CustomerID = c.CustomerID
JOIN DetailTransaction d
ON d.TransactionID = h.TransactionID
WHERE Quantity > 8 and MONTH(TransactionDate) % 2 = 0
ROLLBACK

SELECT * FROM Customer



