create database sql7challenge;
use sql7challenge;
-- CUSTOMERS TABLE
create table customers 
(customer_id int primary key,
full_name varchar(100) not null,
email varchar(100) not null,
city varchar(50) not null,
signup_date date not  null,
segment varchar(20) not null);

-- PRODUCTS TABLE
create table products
(product_id int primary key,
product_name varchar(40),
category varchar(40),
price decimal(10,2),
cost decimal(10,2));

-- ORDERS TABLE
create table orders(
order_id int primary key,
customer_id int not null,
order_date date not null,
status varchar(20),
channel varchar(20),
foreign key(customer_id) references customers(customer_id)
);

-- ORDER_ITEMS
create table order_items (
item_id int,
order_id int,

product_id int,
quantity int not null,
primary key (order_id, item_id),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

create table payment (
payment_id int primary key,
-- pdate date not null,
type varchar(20) not null,
order_id int,
-- customer_id int,
total decimal(10,2) not null,
foreign key (order_id) references orders(order_id),
foreign key (customer_id) references customers(customer_id)
);

create table delivery (
delivery_id int primary key,
order_id int,
type varchar(30),
status varchar(20),
departure datetime,
arrival datetime,
foreign key (order_id) references orders(order_id)
);
drop table if exists order_items;

create table order_items (
    order_item_id int,
    order_id int,
    product_id int,
    quantity int not null,
    unit_price decimal(10,2) not null,
    primary key (order_id, order_item_id),
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);
drop table if exists payment;
create table payment (
    payment_id int primary key,
    order_id int not null,
    payment_type varchar(20),
    payment_status varchar(20),
    amount decimal(10,2),
    foreign key (order_id) references orders(order_id)
);