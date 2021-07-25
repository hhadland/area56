
-- MySQL dump for project database.
-- -------------------------------------


-- PART A ----------------------------
--

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients`(
    `clientID` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `address` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    `contactID` int(11) NOT NULL,
    `repID` int(11) NOT NULL,
    PRIMARY KEY (`clientID`),
    CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `contacts`,
    CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`repID`) REFERENCES `sales_representatives`
);


--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`(
    `contactID` int(11) NOT NULL AUTO_INCREMENT,
    `fName` varchar(255) NOT NULL,
    `lName` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    PRIMARY KEY (`contactID`)
);

--
-- Table structure for table `sales_representatives`
--

DROP TABLE IF EXISTS `sales_representatives`;
CREATE TABLE `sales_representatives`(
    `repID` int(11) NOT NULL AUTO_INCREMENT,
    `fName` varchar(255) NOT NULL,
    `lName` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    PRIMARY KEY (`repID`)
);

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`(
    `orderID` int(11) NOT NULL AUTO_INCREMENT,
    `repID` int(11) NOT NULL,
    `clientID` int(11) NOT NULL,
    PRIMARY KEY (`orderID`),
    CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `clients`,
    CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`repID`) REFERENCES `sales_representatives`,

);


--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`(
    `productID` int(11) NOT NULL AUTO_INCREMENT,
    `item` varchar(255) NOT NULL,
    `cost` int(11) NOT NULL,
    PRIMARY KEY (`productID`),

);


--
-- Table structure for table `order_products`
--

DROP TABLE IF EXISTS `order_products`;
CREATE TABLE `order_products`(
    `orderID` int(11) NOT NULL,
    `productID` int(11) NOT NULL,
    `quantity` int(11) NOT NULL,
    PRIMARY KEY (`productID`,`orderID`),
    CONSTRAINT `order_prods_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders`,
    CONSTRAINT `order_prods_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products`

);

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers`(
    `supplierID` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `address` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `phone` varchar(255) NOT NULL,
    `contactID` int(11) NOT NULL,
    PRIMARY KEY (`supplierID`),
    CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`contactID`) REFERENCES `contacts`,

);


--
-- Table structure for table `supply_products`
--

DROP TABLE IF EXISTS `supply_products`;
CREATE TABLE `supply_products`(
    `supplierID` int(11) NOT NULL,
    `productID` int(11) NOT NULL,
    PRIMARY KEY (`productID`,`supplierID`),
    CONSTRAINT `sup_prods_ibfk_1` FOREIGN KEY (`supplierID`) REFERENCES `suppliers`,
    CONSTRAINT `sup_prods_ibfk_2` FOREIGN KEY (`productID`) REFERENCES `products`

);


-- PART B ----------------------------
--