CREATE TABLE USER(
UID INT NOT NULL PRIMARY KEY,
NAME VARCHAR(30),
EMAIL VARCHAR(30),
PHONE BIGINT,
DOB DATE,
REG_DATE DATE
);
CREATE TABLE PRODUCT(
PID INT NOT NULL PRIMARY KEY,
PRODUCT_NAME VARCHAR(30),
PRICE FLOAT,
STOCK_QTY INT
);
CREATE TABLE PAYMENT(
PAY_ID INT NOT NULL PRIMARY KEY,
STATUS VARCHAR(15),
MODE VARCHAR(15),
DATEE DATE
);
CREATE TABLE ORDERR(
OID INT NOT NULL PRIMARY KEY,
STATUS VARCHAR(15),
TOTAL_AMOUNT FLOAT,
DATEE DATE
);

CREATE TABLE SHIPPING_DETAILS(
OID INT NOT NULL,
SDID INT NOT NULL,
DATEE DATE,
TRACKING_NO INT,
CARRIER VARCHAR(20),
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
PRIMARY KEY(OID,SDID)
);

CREATE TABLE REVIEW(
RID INT NOT NULL PRIMARY KEY,
RATING INT,
COMMENT VARCHAR(255),
DATEE DATE
);
CREATE TABLE CATEGORY(
CID INT NOT NULL PRIMARY KEY,
NAME VARCHAR(30)
);
CREATE TABLE SELLER(
SID INT NOT NULL PRIMARY KEY,
NAME VARCHAR(30),
EMAIL VARCHAR(30),
PHONE BIGINT,
STREET_NAME VARCHAR(30),
CITY VARCHAR(30),
STATE VARCHAR(30),
COUNTRY VARCHAR(20),
PINCODE INT
);
CREATE TABLE ADDRESS(
AID INT NOT NULL,
HOUSE_NO VARCHAR(15),
STREET_NAME VARCHAR(30),
CITY VARCHAR(30),
STATE VARCHAR(30),
COUNTRY VARCHAR(20),
PINCODE INT,
MOBILE_NO BIGINT,
ALTERNATE_MOBILENO BIGINT,
PRIMARY KEY (AID)
);
CREATE TABLE HAS(
UID INT NOT NULL,
AID INT NOT NULL,
FOREIGN KEY(AID) REFERENCES ADDRESS(AID),
FOREIGN KEY(UID) REFERENCES USER(UID),
PRIMARY KEY(UID,AID)
);

CREATE TABLE LOCATION(
OID INT NOT NULL,
AID INT NOT NULL,
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
FOREIGN KEY(AID) REFERENCES ADDRESS(AID),
PRIMARY KEY(OID,AID)
);
CREATE TABLE WISHLIST(
UID INT NOT NULL,
PID INT NOT NULL,
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
FOREIGN KEY(UID) REFERENCES USER(UID),
PRIMARY KEY(UID,PID)
);
CREATE TABLE CART(
UID INT NOT NULL,
PID INT NOT NULL,
QTY INT,
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
FOREIGN KEY(UID) REFERENCES USER(UID),
PRIMARY KEY(UID,PID)
);
CREATE TABLE REVIEWS(
UID INT NOT NULL,
RID INT NOT NULL,
FOREIGN KEY(UID) REFERENCES USER(UID),
FOREIGN KEY(RID) REFERENCES REVIEW(RID),
PRIMARY KEY(UID,RID)
);
CREATE TABLE OF_PRODUCT(
RID INT NOT NULL,
PID INT NOT NULL,
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
FOREIGN KEY(RID) REFERENCES REVIEW(RID),
PRIMARY KEY(RID,PID)
);
CREATE TABLE BELONGS(
PID INT NOT NULL,
CID INT NOT NULL,
FOREIGN KEY(CID) REFERENCES CATEGORY(CID),
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
PRIMARY KEY(PID,CID)
);

CREATE TABLE ORDER_DETAILS(
OID INT NOT NULL,
PID INT NOT NULL,
QTY INT,
PRICE_PER_UNIT FLOAT,
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
PRIMARY KEY(OID,PID)
);
CREATE TABLE ORDERED(
UID INT NOT NULL,
OID INT NOT NULL,
FOREIGN KEY(UID) REFERENCES USER(UID),
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
PRIMARY KEY(UID,OID)
);
CREATE TABLE SELLS(
PID INT NOT NULL,
SID INT NOT NULL,
FOREIGN KEY(SID) REFERENCES SELLER(SID),
FOREIGN KEY(PID) REFERENCES PRODUCT(PID),
PRIMARY KEY(PID,SID)
);
/*CREATE TABLE SHIPPED(
OID INT NOT NULL,
SDID INT NOT NULL,
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
FOREIGN KEY(SDID) REFERENCES SHIPPING_DETAILS(SDID),
PRIMARY KEY(OID,SDID)
);*/
CREATE TABLE PAID(
OID INT NOT NULL,
PAY_ID INT NOT NULL, 
FOREIGN KEY(OID) REFERENCES ORDERR(OID),
FOREIGN KEY(PAY_ID) REFERENCES PAYMENT(PAY_ID),
PRIMARY KEY(OID,PAY_ID)
);
insert into user values
(1, 'Aarav Gupta', 'aarav@gmail.com', 1234567890, '1990-05-15', '2024-03-24'),
(2, 'Ayesha Patel', 'ayesha@gmail.com', 9876543210, '1995-08-20', '2024-03-24'),
(3, 'Ishaan Singh', 'ishaan@gmail.com', 4567891230, '1985-02-10', '2024-03-24'),
(4, 'Ananya Sharma', 'ananya@gmail.com', 7894561230, '2000-11-30', '2024-03-24'),
(5, 'Advik Verma', 'advik@gmail.com', 6543219870, '1978-07-25', '2024-03-24'),
(6, 'Diya Mishra', 'diya@gmail.com', 3219876540, '1992-04-05', '2024-03-24'),
(7, 'Aryan Tiwari', 'aryan@gmail.com', 8529637410, '1983-09-12', '2024-03-24'),
(8, 'Avani Yadav', 'avani@gmail.com', 3698521470, '1998-06-18', '2024-03-24'),
(9, 'Kabir Kumar', 'kabir@gmail.com', 1472583690, '1980-12-08', '2024-03-24'),
(10, 'Aadhya Singh', 'aadhya@gmail.com', 2581473690, '1993-03-22', '2024-03-24');

INSERT INTO CATEGORY VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Toys & Games'),
(6, 'Beauty & Personal Care'),
(7, 'Sports & Outdoors'),
(8, 'Automotive'),
(9, 'Health & Household'),
(10, 'Grocery'),
(11, 'Movies & TV'),
(12, 'Pet Supplies');

INSERT INTO SELLER VALUES
(1, 'ABC Electronics', 'abc@gmail.com', 9876543210, 'Main Street', 'New Delhi', 'Delhi', 'India', 110001),
(2, 'XYZ Clothing', 'xyz@gmail.com', 8765432109, 'Fashion Avenue', 'Mumbai', 'Maharashtra', 'India', 400001),
(3, 'Bookstore Online', 'books@gmail.com', 7654321098, 'Bookworm Lane', 'Bangalore', 'Karnataka', 'India', 560001),
(4, 'Home Essentials', 'home@gmail.com', 6543210987, 'Comfort Street', 'Chennai', 'Tamil Nadu', 'India', 600001),
(5, 'Toys Galore', 'toys@gmail.com', 5432109876, 'Playtime Road', 'Hyderabad', 'Telangana', 'India', 500001);

INSERT INTO ADDRESS (AID, HOUSE_NO, STREET_NAME, CITY, STATE, COUNTRY, PINCODE, MOBILE_NO, ALTERNATE_MOBILENO) VALUES
(1, '123', 'MG Road', 'Mumbai', 'Maharashtra', 'India', 400001, 912345678901, 919876543210),
(2, '456', 'Park Street', 'Kolkata', 'West Bengal', 'India', 700001, 919876543210, NULL),
(3, '789', 'Brigade Road', 'Bangalore', 'Karnataka', 'India', 560001, 945678123456, NULL),
(4, '1011', 'Indira Nagar', 'Chennai', 'Tamil Nadu', 'India', 600001, 912345678901, 917418529630),
(5, '1213', 'Sarjapur Road', 'Hyderabad', 'Telangana', 'India', 500001, 965432187654, NULL),
(6, '1415', 'Civil Lines', 'Delhi', 'Delhi', 'India', 110001, 932198765432, NULL),
(7, '1617', 'Cantt Area', 'Lucknow', 'Uttar Pradesh', 'India', 226001, 919852369741, NULL),
(8, '1819', 'Station Road', 'Ahmedabad', 'Gujarat', 'India', 380001, 942587963852, NULL),
(9, '2021', 'Gandhi Nagar', 'Jaipur', 'Rajasthan', 'India', 302001, 917258369147, NULL),
(10, '2223', 'Civil Lines', 'Pune', 'Maharashtra', 'India', 411001, 918745632198, NULL),
(11, '2425', 'Jubilee Hills', 'Visakhapatnam', 'Andhra Pradesh', 'India', 530001, 916325874563, NULL),
(12, '2627', 'Sector 17', 'Chandigarh', 'Chandigarh', 'India', 160001, 913254789632, NULL),
(13, '2829', 'Sector 22', 'Gurgaon', 'Haryana', 'India', 122001, 919852367415, NULL),
(14, '3031', 'Baner Road', 'Nagpur', 'Maharashtra', 'India', 440001, 917412589632, NULL),
(15, '3233', 'Chetak Circle', 'Jaipur', 'Rajasthan', 'India', 302001, 919852369147, NULL);

INSERT INTO PRODUCT (PID, PRODUCT_NAME, PRICE, STOCK_QTY) VALUES
-- Electronics
(1, 'LG Smart TV', 499.00, 50),
(2, 'Hp Laptop', 99899.00, 30),
(3, 'One Plus Nord 2', 33699.00, 100),
(4, 'Boat Headphones', 1149.00, 80),
-- Clothing
(5, 'Polo T-Shirt', 199.00, 200),
(6, 'Sparky Jeans', 3999.00, 150),
(7, 'Sparx Sneakers', 599.00, 80),
-- Books
(8, 'The Great Gatsby', 99.00, 300),
(9, 'Harry Potter and the Stone', 129.00, 250),
(10, 'To Kill a Mockingbird', 11.00, 200),
-- Home & Kitchen
(11, 'LG Blender', 3999.00, 100),
(12, 'Usha Cookware Set', 999.00, 80),
(13, 'LG Vacuum Cleaner', 1499.00, 70),
-- Toys & Games
(14, 'LEGO Classic Bricks', 299.00, 150),
(15, 'Monopoly Board Game', 198.00, 200),
(16, 'Barbie Doll', 149.00, 250),
-- Beauty & Personal Care
(17, 'Clinic Plus Shampoo', 7.00, 200),
(18, 'Ponds Facial Cleanser', 9.00, 180),
(19, 'Lakme Lipstick', 12.00, 150),
-- Sports & Outdoors
(20, 'Yoga Mat', 199.00, 150),
(21, 'Soccer Ball', 148.00, 200),
(22, 'Camping Tent', 997.00, 100),
-- Automotive
(23, 'Car Wax', 99.00, 200),
(24, 'Tire Pressure Gauge', 149.00, 180),
-- Health & Household
(25, 'Multivitamin Supplements', 29.00, 150),
(26, 'Hand Sanitizer', 4.00, 300),
-- Grocery
(27, 'Breakfast Cereal', 3.00, 300),
(28, 'Pasta', 1.00, 400),
-- Movies & TV
(29, 'The Godfather', 14.00, 100),
(30, 'Avengers: Endgame', 19.00, 120),
(31, 'The Shawshank Redemption', 9.00, 200),
-- Pet Supplies
(32, 'Dog Food', 19.00, 200),
(33, 'Cat Litter', 9.00, 250);


INSERT INTO WISHLIST (UID, PID) VALUES
(1,12),
(1,29),
(2,31),
(3,6),
(4,4),
(4,29),
(5,15),
(6,18),
(7,12),
(7,29),
(10,21),
(9,22);



INSERT INTO CART (UID, PID,QTY) VALUES
(1,12,2),
(2,31,2),
(3,6,1),
(4,12,1),
(5,15,9),
(7,12,3),
(7,29,4),
(10,21,1),
(9,22,1);


INSERT INTO REVIEW (RID, RATING, COMMENT, DATEE) VALUES
(1, 5, 'Great product! Excellent quality and performance.', '2023-05-10'),
(2, 4, 'Good value for money. Could be better with more features.', '2023-07-22'),
(3, 3, 'Average product. Not too impressed.', '2023-09-15'),
(4, 2, 'Disappointing purchase. Product did not meet expectations.', '2023-10-30'),
(5, 1, 'Terrible experience. Product arrived damaged.', '2023-12-05'),
(6, 5, 'Absolutely love it! Would highly recommend to others.', '2024-02-18'),
(7, 4, 'Satisfied with the purchase. Works as described.', '2024-03-10'),
(8, 3, 'Could be better. Not the best quality.', '2024-04-02'),
(9, 2, 'Not worth the price. Expected better performance.', '2024-05-15'),
(10, 1, 'Worst product ever. Broke within days of use.', '2024-06-28');

INSERT INTO REVIEWS (UID, RID) VALUES
(1, 1),
(1, 2),  
(2, 3),  
(2, 4),  
(3, 5),  
(3, 6),  
(4, 7),  
(5, 8),  
(6, 9),  
(7, 10); 


INSERT INTO OF_PRODUCT (RID, PID) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 3),
(6, 3),
(7, 4),
(8, 5),
(9, 6),
(10, 7);

INSERT INTO HAS (UID, AID) VALUES
(1, 1),(1, 2),
(2, 3),
(3, 4),(3, 5),(3, 6),
(4, 7),
(5, 8),(5, 9),
(6, 10),
(7, 11),
(8, 12),
(9,14),(9,15),
(10,13);

INSERT INTO BELONGS (PID, CID) VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5,2),
(6, 2), (7, 2), (8, 3), (9, 3), (10,3),
(11, 4), (12, 4), (13, 4), (14, 5), (15,5),
(16, 5), (17, 6), (18, 6), (19, 6), (20,7),
(21, 7), (22, 7), (23, 8), (24, 8), (25,9),
(26, 9), (27, 10), (28, 10), (29, 11), (30,11),
(31,12),(32,12);


INSERT INTO ORDERR (OID, STATUS, TOTAL_AMOUNT, DATEE) VALUES
    (1, 'Pending', 133598, '2024-03-25'),
    (2, 'Processing', 4327, '2024-03-26'),
    (3, 'Shipped', 5997, '2024-03-27'),
    (4, 'Delivered', 448, '2024-03-28'),
    (5, 'Pending', 1149, '2024-03-29'),
    (6, 'Processing', 1499, '2024-03-30'),
    (7, 'Shipped', 397, '2024-03-31'),
    (8, 'Delivered', 28, '2024-04-01'), 
    (9, 'Pending', 27, '2024-04-02'),
    (10, 'Processing', 20, '2024-04-03'),
    (11, 'Shipped', 347, '2024-04-04'),
    (12, 'Delivered', 12, '2024-04-05'),
    (13, 'Pending', 7, '2024-04-06'),
    (14, 'Processing', 299, '2024-04-07'),
    (15, 'Shipped', 1499, '2024-04-08');
    
INSERT INTO SHIPPING_DETAILS (OID,SDID,DATEE, TRACKING_NO, CARRIER) VALUES
    (3,1, '2024-03-25', 123456, 'Delhivery'),
    (4,2, '2024-03-26', 234567, 'Bluedart'),
    (7,3, '2024-03-27', 345678, 'Ekart'),
    (8,4, '2024-03-28', 456789, 'Delhivery'),
    (11,5, '2024-03-29', 567890, 'Bluedart'),
    (12,6, '2024-03-30', 678901, 'Ekart'),
    (15,7, '2024-03-31', 789012, 'Delhivery');

INSERT INTO ORDER_DETAILS (OID, PID, QTY, PRICE_PER_UNIT) VALUES
  (1, 2, 1, 99899.00),
  (1, 3, 1, 33699.00),
  (2, 5, 1, 199.00),
  (2, 6, 1, 3999.00),
  (2, 9, 1, 129.00),
  (3, 11, 1, 3999.00),
  (3, 12, 2, 999.00),
  (4, 14, 1, 299.00),
  (4, 16, 1, 149.00),
  (5, 4, 1, 1149.00),
  (6, 13, 1, 1499.00),
  (7, 23, 1, 99.00),
  (7, 24, 2, 149.00),
  (8, 30, 1, 19.00),
  (8, 31, 1, 9.00),
  (9, 31, 3, 9),
  (10, 26, 5, 4),
  (11, 20, 1, 199.00),
  (11, 21, 1, 148.00),
  (12, 19, 1, 12),
  (13, 17, 1, 7),
  (14, 14,1, 299.00),
  (15, 13,1, 1499.00);
  INSERT INTO PAYMENT (PAY_ID, STATUS, MODE, DATEE) VALUES
    (1, 'Pending', 'Credit Card', '2024-03-25'),
    (2, 'Completed', 'Debit Card', '2024-03-26'),
    (3, 'Completed', 'Cash', '2024-03-27'),
    (4, 'Completed', 'UPI', '2024-03-28'),
    (5, 'Pending', 'Bank Transfer', '2024-03-29'),
    (6, 'Completed', 'Credit Card', '2024-03-30'),
    (7, 'Completed', 'Debit Card', '2024-03-31'),
    (8, 'Completed', 'Cash', '2024-04-01'),
    (9, 'Pending', 'UPI', '2024-04-02'),
    (10, 'Completed', 'Bank Transfer', '2024-04-03'),
    (11, 'Completed', 'Credit Card', '2024-04-04'),
    (12, 'Completed', 'Debit Card', '2024-04-05'),
    (13, 'Pending', 'Cash', '2024-04-06'),
    (14, 'Completed', 'UPI', '2024-04-07'),
    (15, 'Completed', 'Bank Transfer','2024-04-08');
INSERT INTO PAID(OID,PAY_ID) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(11,11),
(12,12),
(13,13),
(14,14),
(15,15);
INSERT INTO SELLS (PID, SID) VALUES
(1,1),(2,1),(3,1),(4,2),(5,2),(6,3),(7,3),(8,4),(9,4),
(10,5),(11,1),(12,2),(13,2),(14,3),(15,3),(16,4),(17,5),
(18,5),(19,5),(20,1),(21,2),(22,2),(23,3),(24,3),(25,4),(26,5),
(27,1),(28,2),(29,1),(30,2),(31,2),(32,3);
INSERT INTO ORDERED(UID,OID) VALUES
(1,1),(1,2),
(2,3),
(3,4),(3,5),
(4,6),
(5,7),(5,8),(5,9),
(6,10),
(7,11),
(8,12),(8,15),
(9,13),
(10,14);
INSERT INTO LOCATION(OID,AID) VALUES
(1,1),
(2,2),
(3,3),
(4,5),
(5,6),
(6,7),
(7,8),
(8,9),
(9,8),
(10,10),
(11,11),
(12,12),
(13,14),
(14,13),
(15,12);
select * from wishlist;

-- belongs and sells, order details, ordered, location, paid, payment, shipped, shipping details, 


-- Retrieve all products belonging to a specific category 
SELECT Product.*
FROM Product natural join Belongs natural join Category c
WHERE c.NAME = 'Electronics';

-- List all orders placed by a specific user
SELECT Orderr.OID,Orderr.STATUS,Orderr.Datee, Order_Details.QTY, Product.PRODUCT_NAME, Order_Details.PRICE_PER_UNIT
FROM Orderr natural join Order_details natural join Product natural join Ordered
WHERE Ordered.UID = 5;

-- Retrieve all products in a user's wishlist
SELECT Product.*
FROM Product natural join Wishlist
WHERE Wishlist.UID = 1;

-- Retrieve all products in a user's cart
SELECT Product.*
FROM Product natural join Cart
WHERE Cart.UID=7;



-- Find the total number of reviews and average rating for a product
SELECT COUNT(*) AS Total_Reviews, AVG(r.RATING) AS Avg_Rating
FROM Review r natural join Of_product op
WHERE op.PID = 5;

-- List all orders with their shipping details and payment status:
SELECT Orderr.*, Shipping_Details.TRACKING_NO, Shipping_Details.CARRIER, Payment.STATUS AS Payment_Status
FROM Orderr
LEFT JOIN Shipping_Details ON Orderr.OID = Shipping_Details.OID
JOIN Paid  ON Orderr.OID = Paid.OID
JOIN Payment ON Paid.PAY_ID = Payment.PAY_ID;

-- Retrieve user and their addresses
SELECT User.UID,User.NAME,Address.*
FROM User Natural Join has Natural Join Address;

-- Retrieve all products with their corresponding categories
SELECT Product.*,Category.NAME 
FROM Product Natural Join Belongs Natural Join Category;


-- All orders with user detail and addresses
SELECT User.UID,User.NAME,Orderr.*,Address.*
FROM User Natural Join Ordered Natural Join Orderr
Natural Join Has Natural Join Address Natural Join location;

-- All products with seller details
SELECT Product.*,Seller.*
FROM Product Natural Join Sells Natural Join Seller;

-- All products less than certain price in certain category
SELECT Product.*,Category.NAME
FROM Product Natural Join Belongs Natural Join Category
WHERE Product.PRICE<1000 and Category.NAME='Clothing';

-- All product more than certain average rating in certain category
SELECT Product.*,Category.NAME,Avg(Review.Rating)
FROM Product Natural Join Of_product Natural Join
Review Natural Join Belongs Natural Join Category
WHERE Category.NAME='Electronics'
GROUP BY PID Having Avg(Review.Rating)>3;

