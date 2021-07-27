-- Your submission should contain ALL the queries required to implement ALL the
-- functionalities listed in the Project Specs.

-- get all Planet IDs and Names to populate the Homeworld dropdown
SELECT planet_id, name FROM bsg_planets

-- get all characters and their homeworld name for the List People page
SELECT bsg_people.character_id, fname, lname, bsg_planets.name AS homeworld, age FROM bsg_people INNER JOIN bsg_planets ON homeworld = bsg_planets.planet_id

-- get a single character's data for the Update People form
SELECT character_id, fname, lname, homeworld, age FROM bsg_people WHERE character_id = :character_ID_selected_from_browse_character_page

-- get all character's data to populate a dropdown for associating with a certificate  
SELECT character_id AS pid, fname, lname FROm bsg_people 
-- get all certificates to populate a dropdown for associating with people
SELECT certification_id AS cid, title FROM bsg_cert

-- get all peoople with their current associated certificates to list
SELECT pid, cid, CONCAT(fname,' ',lname) AS name, title AS certificate 
FROM bsg_people 
INNER JOIN bsg_cert_people ON bsg_people.character_id = bsg_cert_people.pid 
INNER JOIN bsg_cert on bsg_cert.certification_id = bsg_cert_people.cid 
ORDER BY name, certificate

-- add a new character
INSERT INTO bsg_people (fname, lname, homeworld, age) VALUES (:fnameInput, :lnameInput, :homeworld_id_from_dropdown_Input, :ageInput)

-- associate a character with a certificate (M-to-M relationship addition)
INSERT INTO bsg_cert_people (pid, cid) VALUES (:character_id_from_dropdown_Input, :certification_id_from_dropdown_Input)

-- update a character's data based on submission of the Update Character form 
UPDATE bsg_people SET fname = :fnameInput, lname= :lnameInput, homeworld = :homeworld_id_from_dropdown_Input, age= :ageInput WHERE id= :character_ID_from_the_update_form

-- delete a character
DELETE FROM bsg_people WHERE id = :character_ID_selected_from_browse_character_page

-- dis-associate a certificate from a person (M-to-M relationship deletion)
DELETE FROM bsg_cert_people WHERE pid = :character_ID_selected_from_certificate_and_character_list AND cid = :certification_ID_selected_from-certificate_and_character_list


------------------------------- INSERT our stuff here -------------------------------
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


