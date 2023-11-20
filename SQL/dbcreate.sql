create database bigrolling;
use bigrolling;

create table USER(
	  user_id INT NOT NULL AUTO_INCREMENT,
		username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    gender VARCHAR(5) NOT NULL,
    phonenumber VARCHAR(50),
    PRIMARY KEY(user_id));

create table CATEGORY(
		category_id int not null auto_increment,
		category_name varchar(100) not null,
    primary key(category_id));

create table BRAND(
	  brand_id INT NOT NULL AUTO_INCREMENT,
		brand_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(brand_id));

create table PRODUCT(
	  product_id INT NOT NULL AUTO_INCREMENT,
		product_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
		description TEXT,
		category_id INT NOT NULL,
		brand_id INT NOT NULL,
    PRIMARY KEY(product_id),
		FOREIGN KEY (category_id) REFERENCES CATEGORY (category_id) ON UPDATE CASCADE,
		FOREIGN KEY (brand_id) REFERENCES BRAND (brand_id) ON UPDATE CASCADE);

create table REVIEW(
	  review_id INT NOT NULL AUTO_INCREMENT,
		product_id INT NOT NULL,
		user_id INT NOT NULL,
		rating INT NOT NULL,
		review_text TEXT,
		review_date DATE NOT NULL,
		PRIMARY KEY(review_id),
		FOREIGN KEY (user_id) REFERENCES USER (user_id),
		FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id));

create table INVENTORY(
	  product_id INT NOT NULL,
		stock_quantity INT NOT NULL,
		FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id) ON UPDATE CASCADE);

create table ORDERS(
		order_id INT NOT NULL AUTO_INCREMENT,
	  user_id INT NOT NULL,
		order_date DATE NOT NULL,
		total_price INT NOT NULL,
		PRIMARY KEY(order_id),
		FOREIGN KEY (user_id) REFERENCES USER (user_id));

create table ORDER_ITEMS(
		order_items_id INT NOT NULL AUTO_INCREMENT,
	  product_id INT NOT NULL,
		order_id INT NOT NULL,
		quantity INT NOT NULL,
		PRIMARY KEY(order_items_id),
		FOREIGN KEY (order_id) REFERENCES ORDERS (order_id)ON UPDATE CASCADE,
		FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id) ON UPDATE CASCADE);

create table DISCOUNT(
	  discount_id INT NOT NULL AUTO_INCREMENT,
		discount_code INT NOT NULL,
		discount_amount INT NOT NULL,
		PRIMARY KEY(discount_id));

create table PAYMENT(
		payment_id INT NOT NULL AUTO_INCREMENT,
	  order_id INT NOT NULL,
		discount_id INT NOT NULL,
		payment_date DATE NOT NULL,
		payment_amount INT NOT NULL,
		payment_method VARCHAR(255) NOT NULL,
		PRIMARY KEY(payment_id),
		FOREIGN KEY (order_id) REFERENCES ORDERS (order_id),
		FOREIGN KEY (discount_id) REFERENCES DISCOUNT (discount_id));

create table RETURNS(
	  return_id INT NOT NULL AUTO_INCREMENT,
		order_id INT NOT NULL,
		return_date DATE NOT NULL,
		return_reason TEXT,
		PRIMARY KEY(return_id),
		FOREIGN KEY (order_id) REFERENCES ORDERS (order_id));

create table SHIPPING(
	  shipping_id INT NOT NULL AUTO_INCREMENT,
		order_id INT NOT NULL,
		address TEXT NOT NULL,
		ship_date DATE,
		status VARCHAR(100) NOT NULL,
		PRIMARY KEY(shipping_id),
		FOREIGN KEY (order_id) REFERENCES ORDERS (order_id));
