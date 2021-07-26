
-- MySQL dump for project database.
-- -------------------------------------


-- PART A ----------------------------
--

DROP TABLE IF EXISTS order_products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS supply_products;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS sales_representatives;
DROP TABLE IF EXISTS products;


--
-- Table structure for table contacts
--

CREATE TABLE contacts(
    contactID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fName varchar(255) NOT NULL,
    lName varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(255) NOT NULL

);

--
-- Table structure for table sales_representatives
--


CREATE TABLE sales_representatives(
    repID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    fName varchar(255) NOT NULL,
    lName varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(255) NOT NULL

);

--
-- Table structure for table clients
--

CREATE TABLE clients(
    clientID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(255) NOT NULL,
    contactID int(11) NOT NULL,
    repID int(11) NOT NULL,

    FOREIGN KEY clients_ibfk_1  (contactID) REFERENCES contacts(contactID),
    FOREIGN KEY clients_ibfk_2 (repID) REFERENCES sales_representatives(repID)

);


--
-- Table structure for table orders
--


CREATE TABLE orders(
    orderID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    repID int(11) NOT NULL,
    clientID int(11) NOT NULL,
    FOREIGN KEY orders_ibfk_1 (clientID) REFERENCES clients(clientID),
    FOREIGN KEY orders_ibfk_2 (repID) REFERENCES sales_representatives(repID)


);


--
-- Table structure for table products
--


CREATE TABLE products(
    productID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    item varchar(255) NOT NULL,
    cost int(11) NOT NULL

);


--
-- Table structure for table order_products
--


CREATE TABLE order_products(
    orderID int(11) NOT NULL,
    productID int(11) NOT NULL,
    quantity int(11) NOT NULL,
    FOREIGN KEY order_prods_ibfk_1 (orderID) REFERENCES orders(orderID),
    FOREIGN KEY order_prods_ibfk_2 (productID) REFERENCES products (productID),
    PRIMARY KEY (productID,orderID)

);

--
-- Table structure for table suppliers
--

CREATE TABLE suppliers(
    supplierID int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    phone varchar(255) NOT NULL,
    contactID int(11) NOT NULL,
    FOREIGN KEY suppliers_ibfk_1 (contactID) REFERENCES contacts (contactID)

);


--
-- Table structure for table supply_products
--


CREATE TABLE supply_products(
    supplierID int(11) NOT NULL,
    productID int(11) NOT NULL,

    FOREIGN KEY sup_prods_ibfk_1 (supplierID) REFERENCES suppliers (supplierID),
    FOREIGN KEY sup_prods_ibfk_2 (productID) REFERENCES products (productID),
    PRIMARY KEY (productID,supplierID)

);

--
-- PART B ----------------------------
--
--

INSERT INTO contacts VALUES (1, "Elvis", "Presley", "epresley@aol.com", "323-555-5555");
INSERT INTO contacts VALUES (2, "Elvis", "Costello", "ecostello@aol.com", "310-222-2222");
INSERT INTO contacts VALUES (3, "Buddy", "Holly", "bholly@gmail.com", "323-191-9151");

INSERT INTO sales_representatives VALUES (1, "John", "Lennon", "jlennon@gmail.com", "323-616-6626");
INSERT INTO sales_representatives VALUES (2, "Paul", "McCartney", "pmccartney@gmail.com", "323-881-1888");
INSERT INTO sales_representatives VALUES (3, "Ringo", "Starr", "rstarr@gmail.com", "323-255-5225");

INSERT INTO clients VALUES (1, "Big Grocers", "151 North Ln, Des Moines, IA 50061", "biggrocers@gmail.com", "515-789-9987", 1, 1);
INSERT INTO clients VALUES (2, "Best Stuff", "997 West Dr, Houston, TX 77002", "beststuff@gmail.com", "281-753-1159", 2, 2);
INSERT INTO clients VALUES (3, "Wholesome Foods", "636 Downtown Blvd, San Francisco, CA 94108", "wholesomefoods@gmail.com", "415-395-2252", 3, 3);

INSERT INTO orders VALUES (1, 1, 1);
INSERT INTO orders VALUES (2, 2, 2);
INSERT INTO orders VALUES (3, 3, 3);

INSERT INTO products VALUES (1, "Banana", 1);
INSERT INTO products VALUES (2, "Apple", 1);
INSERT INTO products VALUES (3, "Chicken", 10);
INSERT INTO products VALUES (4, "Salmon", 20);
INSERT INTO products VALUES (5, "Bread", 3);
INSERT INTO products VALUES (6, "Milk", 4);
INSERT INTO products VALUES (7, "Carton of Eggs", 2);
INSERT INTO products VALUES (8, "Coffee Beans", 8);
INSERT INTO products VALUES (9, "Broccoli", 3);
INSERT INTO products VALUES (10, "Carrots", 2);

INSERT INTO order_products VALUES (1, 1, 100);
INSERT INTO order_products VALUES (2, 5, 50);
INSERT INTO order_products VALUES (3, 8, 25);

