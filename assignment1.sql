DROP DATABASE IF EXISTS SaleManagement;
Create database SaleManagement;
Use SaleManagement;

Drop table if exists Customer;
Create table Customer(
	customer_id BIGINT primary key,
    first_name NVARCHAR(50),
    last_name nvarchar(50),
    email nvarchar(50),
    number_of_complaints int

);
Drop table if exists Sale;
Create table Sale(
	purchase_number BIGINT primary key,
    date_of_purchase date,
    customer_id BIGINT,
    item_code nvarchar(50),
    foreign key(customer_id) references Customer(customer_id)
);

Drop table if exists Item;
Create table Item(
	item_code nvarchar(50) primary key,
    item nvarchar(50),
    unit_price_usd int,
    company_id int,
    headquarters_phone_number varchar(50)
);


