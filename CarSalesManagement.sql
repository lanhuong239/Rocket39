-- Create Data
drop database if exists testing_mysql;
create database			testing_mysql;
use						testing_mysql;

-- Create table customer
drop table if exists Customer;
create table Customer (
	CustomerID			int auto_increment primary key,
    Name				varchar(50) not null,
    Phone				char(13) not null,
    Email				varchar(50) unique not null,
    Address				varchar(100) not null,
    Note				varchar(500) not null
);

-- Create table Car
drop table if exists Car;
create table Car (
	CarID				int auto_increment primary key,
    Maker				enum('HONDA', 'TOYOTA', 'NISSAN') not null,
    Model				varchar(50) not null,
    Year				datetime not null,
    color				varchar(50) not null,
    Note				varchar(500) not null
);

-- Create table car_order
drop table if exists Car_order;
create table Car_order (
	OrderID				int auto_increment primary key,
    CustomerID			int,
    CarID				int,
    Amount				smallint default 1,
    SalePrice			double,
    OrderDate			date,
    DeliveryDate		date,
    DeliveryAddress		varchar(100),
    `Status`			tinyint(2) default 1 not null,
    Note				varchar(500),
    
    foreign key (CustomerID) references  Customer(CustomerID) on delete cascade,
    foreign key (CarID) references Car(CarID) on delete cascade
);


-- Insert data
-- insert table Customer
insert into Customer (Name,			Phone,			Email, 					Address,			Note)
value				('Nguyen Van A',	'090111222',	'nguyena@gmail.com',	'HA NOI',			'a'),
					('Le Van B',		'090333444',	'leb@gmail.com',		'HA NOI',			'ab'),
                    ('Tran Thi C',		'090999123',	'ctran@gmail.com',		'VINH PHUC',		'abc'),
                    ('Hoang Van D',		'090555666',	'dhoang@gmail.com',		'PHU THO',			'xyz'),
                    ('Doan Thi E',		'090777888',	'edoan@gmail.com',		'HAI PHONG',		'acd');
                    
-- Insert table Car
insert into Car (Maker,			Model,			Year,					color,			Note)
values			('HONDA',		'HONDA1',		'2018-11-22',			'BLACK',		'a123'),
				('TOYOTA',		'TOYOTA1',		'2017-10-12',			'WHITE',		'abc1'),
                ('NISSAN',		'NISSAN1',		'2019-01-20',			'BLUE',			'1234'),
                ('HONDA',		'HONDA2',		'2022-11-22',			'BLACK',		'a123');
                
                
                
				
              
-- Insert table Car_order
insert into		Car_order 
				(CustomerID,			CarID,				Amount,					SalePrice, 			OrderDate, 			DeliveryDate, 	DeliveryAddress ,`Status`,		Note)
value                                                                                                                                                        
				(1,						3,					2,						 5.000000,	'2023-03-01',				'2023-03-21',	'HA NOI'        ,	1,			'123'	),
				(2,						2,					3,						 8.000000,	'2023-03-04',				'2023-03-10',   'HAI PHONG'     ,	1,	     	'1234'	),
				(2,						2,					3,						 8.000000,	'2023-03-08',				'2023-03-15',   'PHU THO'       ,	1,	     	'1235'	),
				(3,						1,					6,						 7.000000,	'2023-03-08',				'2023-01-02',   'VINH PHUC'     ,	0,		 	'1235'	),
                (3,						3,					10,						 5.000000,	'2023-03-08',				'2023-03-15',   'THAI NGUYEN'   ,	1,		 	'1235'	);
                
-- q2. Viết lệnh lấy ra thông tin của khách hàng: tên, số lượng oto khách hàng đã mua và sắp sếp tăng dần theo số lượng oto đã mua.
SELECT c.Name, COUNT(co.CustomerID) AS car_num
FROM Car_order co
INNER JOIN Customer c ON co.CustomerID = c.CustomerID
where co.Status = 1
GROUP BY co.CustomerID
ORDER BY car_num ASC;

-- q3. Viết hàm (không có parameter) trả về tên hãng sản xuất đã bán được nhiều oto nhất trong năm nay.
select c.Maker FROM car c JOIN car_order co ON c.CarID = co.CarID
							WHERE co.Status = 1 AND year(co.DeliveryDate) = year(now())
							GROUP BY c.Maker HAVING SUM(co.Amount) = ( SELECT max(SL) FROM ( SELECT SUM(Amount) AS SL FROM car c JOIN car_order co ON c.CarID = co.CarID
							WHERE co.Status = 1 AND year(co.DeliveryDate) = year(now())
							GROUP BY c.Maker) AS temp)

-- cach 2
set global log_bin_trust_function_creators = 1;
drop function if exists Maker;
DELIMITER $$
create function Maker(status_1 int) returns varchar(50)
	BEGIN
		declare maker varchar(50);
		select c.Maker into maker FROM car c JOIN car_order co ON c.CarID = co.CarID
							WHERE co.Status = status_1 AND year(co.DeliveryDate) = year(now())
							GROUP BY c.Maker HAVING SUM(co.Amount) = ( SELECT max(SL) FROM ( SELECT SUM(Amount) AS SL FROM car c JOIN car_order co ON c.CarID = co.CarID
							WHERE co.Status = status_1 AND year(co.DeliveryDate) = year(now())
							GROUP BY c.Maker) AS temp); 
		return maker;
	END$$
DELIMITER $$;
select Maker(1);

-- cách 3
-- Lệnh truy vấn sửa lỗi
SELECT ca.Maker
FROM Car ca
INNER JOIN Car_order co ON ca.CarID = co.CarID
WHERE YEAR(co.DeliveryDate) = YEAR(NOW())
GROUP BY ca.Maker
HAVING SUM(co.Amount) = (
    SELECT MAX(totalAmount)
    FROM (
        SELECT SUM(co2.Amount) AS totalAmount
        FROM Car_order co2
        WHERE YEAR(co2.DeliveryDate) = YEAR(NOW())
        GROUP BY co2.CarID
    ) AS subquery
);





