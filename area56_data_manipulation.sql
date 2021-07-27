-- Area56 Grocer Supply Database Queries

-- get clients for the client table
SELECT clientID, name, address, email, phone, contactID, repID FROM clients

-- add a new client into clients table
INSERT INTO clients (name, address, email, phone, contactID, repID) VALUES (:clientNameInput, :clientAddressInput, :clientEmailInput, :clientPhoneInput, :contactIDInput, :repIDInput);

-- update existing client in clients table
UPDATE clients SET name = :clientNameInput, address = :clientAddressInput, email = :clientEmailInput, phone = :clientPhoneInput, contactID = :contactIDInput, repID = :repIDInput WHERE clientID = :clientIDInput;

-- delete existing client from clients table
DELETE FROM clients WHERE clientID = :clientIDInput;

-- get sales representative for the sales representative table
SELECT repID, fname, lname, email, phone FROM sales_representatives;

-- add a new sales representative into sales_representatives table
INSERT INTO sales_representatives (fname, lname, email, phone) VALUES (:fNameInput, :lNameInput, :repEmailInput, :repPhoneInput);

-- update existing sales representative in sales_representatives table
UPDATE sales_representatives SET fName = :fNameInput, lName = :lNameInput, email = :repEmailInput, phone = :repPhoneInput WHERE repID = :repIDInput;

-- delete existing sales representative from sales_representatives table
DELETE FROM sales_representatives WHERE repID = :repIDInput;

-- get contacts for the contacts table
SELECT contactID, fname, lname, email, phone FROM contacts;

-- add a new contact into contacts table
INSERT INTO contacts (fname, lname, email, phone) VALUES (:fNameInput, :lNameInput, :contactEmailInput, :contactPhoneInput);

-- update existing contact in contacts table
UPDATE contacts SET fName = :fNameInput, lName = :lNameInput, email = :contactEmailInput, phone = :contactPhoneInput WHERE contactID = :contactIDInput;

-- delete existing contact from contacts table
DELETE FROM contacts WHERE contactID = :contactIDInput;

-- get products for the products table
SELECT productID, item, cost FROM products;

-- add a new product into products table
INSERT INTO products (item, cost) VALUES (:itemInput, :itemCost);

-- update existing product in products table
UPDATE products SET item = :itemInput, cost = itemCost WHERE productID = :productIDInput;

-- delete existing product from products table
DELETE FROM products WHERE productID = :productIDInput;

-- get products for the products table
SELECT orderID, repID, clientID FROM orders;

-- add a new order into orders table
INSERT INTO orders (repID, clientID) VALUES (:repIDInput, :clientIDInput);

-- update existing order in orders table
UPDATE orders SET repID = :repIDInput, clientID = :clientIDInput WHERE orderID = :orderIDInput;

-- delete existing order from orders table
DELETE FROM orders WHERE orderID = :orderIDInput;

-- add a new order_product into order_products table
INSERT INTO order_products (orderID, productID, quantity) VALUES (:orderIDInput, :productIDInput, :quantityInput);

-- update existing order_product in order_products table
UPDATE order_products SET quantity = quantityInput WHERE orderID = :orderIDInput, productID = :productIDInput;

-- delete existing order_product from order_products table
DELETE FROM order_products WHERE orderID = :orderIDInput, productID = :productIDInput;

-- get products, quantity of products and total cost of products in order
SELECT orders.orderID as orderID, products.item as item, order_products.quantity as quantity, order_products.quantity * products.cost as cost from orders
INNER JOIN order_products on orders.orderID = order_products.orderID
INNER JOIN products on products.productID = order_products.productID
ORDER by orderID;
