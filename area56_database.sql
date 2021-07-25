
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