CREATE DATABASE IF NOT EXISTS `db_sys_development` CHARACTER SET utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE `db_sys_development`;

create table CATEGORY (
id INT UNSIGNED NOT NULL,
name VARCHAR(50) NOT NULL,
description TEXT,
PRIMARY KEY(id)
);

create table SELLER (
ssn CHAR(13) NOT NULL,
firstname VARCHAR(80) NOT NULL,
lastname VARCHAR(80) NOT NULL,
description TEXT,
time_registered DATETIME NOT NULL,
time_updated DATETIME NOT NULL,
username VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
PRIMARY KEY(ssn),
CONSTRAINT DATE_CHECK CHECK(time_updated<=NOW() AND time_registered<=NOW())
);

create table ITEM (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
description TEXT,
price DOUBLE UNSIGNED NOT NULL,
product_name VARCHAR(50) NOT NULL,
product_brand VARCHAR(20) NOT NULL,
time_updated DATETIME NOT NULL,
time_created DATETIME NOT NULL,
supplier VARCHAR(50) NOT NULL,
quantity INT UNSIGNED NOT NULL,
category_id INT UNSIGNED NOT NULL,
seller_ssn CHAR(13) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(category_id) REFERENCES CATEGORY(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(seller_ssn) REFERENCES SELLER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT DATE_CHECK CHECK(time_updated<=NOW() AND time_created<=NOW())
);

create table ITEM_IMAGE(
item_id INT UNSIGNED NOT NULL,
image_url VARCHAR(256) NOT NULL,
PRIMARY KEY(item_id, image_url),
FOREIGN KEY(item_id) REFERENCES ITEM(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table SELLER_EMAIL (
seller_ssn CHAR(13) NOT NULL,
email VARCHAR(80) NOT NULL,
PRIMARY KEY(seller_ssn, email),
FOREIGN KEY(seller_ssn) REFERENCES SELLER(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);

create table SELLER_PHONE (
seller_ssn CHAR(13) NOT NULL,
phone VARCHAR(15) NOT NULL,
PRIMARY KEY(seller_ssn, phone),
FOREIGN KEY(seller_ssn) REFERENCES SELLER(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);

create table CUSTOMER (
ssn CHAR(13) NOT NULL,
firstname VARCHAR(80) NOT NULL,
lastname VARCHAR(80) NOT NULL,
username VARCHAR(50) NOT NULL UNIQUE,
password_hash VARCHAR(255) NOT NULL,
PRIMARY KEY(ssn)
);

create table CUSTOMER_EMAIL (
customer_ssn CHAR(13) NOT NULL,
email VARCHAR(80) NOT NULL,
PRIMARY KEY(customer_ssn, email),
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);

create table CUSTOMER_PHONE(
customer_ssn CHAR(13) NOT NULL,
phone VARCHAR(15) NOT NULL,
PRIMARY KEY(customer_ssn, phone),
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PAYMENT_GATEWAY(
id INT UNSIGNED NOT NULL,
name VARCHAR(40) NOT NULL,
api_url TEXT NOT NULL,
PRIMARY KEY(id)
);

create table COMMENT (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
content TEXT NOT NULL,
time_created DATETIME NOT NULL,
PRIMARY KEY(id),
CONSTRAINT DATE_CHECK CHECK(time_created<=NOW())
);

create table ORDERS (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
status INT NOT NULL,
time_created DATETIME NOT NULL,
customer_ssn CHAR(13) NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT STATUS_CHECK CHECK(status>=0 AND status<=3),
CONSTRAINT DATE_CHECK CHECK(time_created<=NOW())
);

create table POINT_TRANSACTION (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
point DOUBLE NOT NULL,
time_created DATETIME NOT NULL,
order_id INT UNSIGNED NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(order_id) REFERENCES ORDERS(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT DATE_CHECK CHECK(time_created<=NOW())
);

create table PROMOTION (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
title VARCHAR(80) NOT NULL,
description TEXT NOT NULL,
discount_percent DOUBLE,
expired_date DATETIME NOT NULL,
PRIMARY KEY(id),
CONSTRAINT DISCOUNT_CHECK CHECK(discount_percent>=0.0 AND discount_percent<=100.0)
);

create table MESSAGE (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
content TEXT NOT NULL,
time_sent DATETIME NOT NULL,
message_mode BOOLEAN NOT NULL,
PRIMARY KEY(id),
CONSTRAINT DATE_CHECK CHECK(time_sent<=NOW())
);

create table IS_IN (
item_id INT UNSIGNED NOT NULL,
order_id INT UNSIGNED NOT NULL,
price_per_piece DOUBLE UNSIGNED NOT NULL,
amount INT UNSIGNED NOT NULL,
PRIMARY KEY(item_id, order_id),
FOREIGN KEY(item_id) REFERENCES ITEM(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(order_id) REFERENCES ORDERS(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table APPLY_ON (
promotion_id INT UNSIGNED NOT NULL,
item_id INT UNSIGNED NOT NULL,
PRIMARY KEY(promotion_id, item_id),
FOREIGN KEY(promotion_id) REFERENCES PROMOTION(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(item_id) REFERENCES ITEM(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table RATES (
item_id INT UNSIGNED NOT NULL,
customer_ssn CHAR(13) NOT NULL,
score INT UNSIGNED NOT NULL,
PRIMARY KEY(item_id, customer_ssn),
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(item_id) REFERENCES ITEM(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT SCORE_CHECK CHECK(score>=1 AND score<=5)
);

create table SENDS (
seller_ssn CHAR(13) NOT NULL,
customer_ssn CHAR(13) NOT NULL,
message_id INT UNSIGNED NOT NULL,
PRIMARY KEY(seller_ssn, customer_ssn, message_id),
FOREIGN KEY(seller_ssn) REFERENCES SELLER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(message_id) REFERENCES MESSAGE(id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table FOLLOWS (
customer_ssn CHAR(13) NOT NULL,
seller_ssn CHAR(13) NOT NULL,
PRIMARY KEY(customer_ssn, seller_ssn),
FOREIGN KEY(seller_ssn) REFERENCES SELLER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE
);

create table PAID_BY (
order_id INT UNSIGNED NOT NULL,
payment_gateway_id INT UNSIGNED NOT NULL,
time_paid DATETIME NOT NULL,
PRIMARY KEY(order_id),
FOREIGN KEY(order_id) REFERENCES ORDERS(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(payment_gateway_id) REFERENCES PAYMENT_GATEWAY(id) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT DATE_CHECK CHECK(time_paid<=NOW())
);

create table POSTS (
item_id INT UNSIGNED NOT NULL,
customer_ssn CHAR(13) NOT NULL,
comment_id INT UNSIGNED NOT NULL,
PRIMARY KEY(item_id, customer_ssn, comment_id),
FOREIGN KEY(item_id) REFERENCES ITEM(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(customer_ssn) REFERENCES CUSTOMER(ssn) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(comment_id) REFERENCES COMMENT(id) ON DELETE CASCADE ON UPDATE CASCADE
);
