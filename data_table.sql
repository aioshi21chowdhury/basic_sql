
-- DROP DATABASE IF EXISTS one_shot;
CREATE DATABASE one_shot;
USE one_shot;


-- =========================
-- CUSTOMERS
-- =========================
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- =========================
-- RESTAURANTS
-- =========================
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine_type VARCHAR(50),
    address TEXT NULL,
    contact_number VARCHAR(15) NULL
);

-- =========================
-- DELIVERY AGENTS
-- =========================
CREATE TABLE Delivery_Agents (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    vehicle_type VARCHAR(30) NULL,
    status VARCHAR(20) DEFAULT 'Available'
);

-- =========================
-- MENU ITEMS
-- =========================
CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10,2) NOT NULL,
    availability BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- =========================
-- ORDERS
-- =========================
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    agent_id INT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    order_status VARCHAR(30) DEFAULT 'Placed',
    delivery_address TEXT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (agent_id) REFERENCES Delivery_Agents(agent_id)
);

-- =========================
-- ORDER ITEMS
-- =========================
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);

-- =========================
-- PAYMENTS
-- =========================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_method VARCHAR(30) NULL,
    payment_status VARCHAR(20) DEFAULT 'Pending',
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- =========================
-- INSERT CUSTOMERS
-- =========================
INSERT INTO Customers (full_name,email,phone,address) VALUES
('Aarav Sen','aarav@gmail.com','9000000001','Kolkata'),
('Priya Das','priya@gmail.com','9000000002','Howrah'),
('Rohan Roy','rohan@gmail.com','9000000003','Salt Lake'),
('Neha Paul','neha@gmail.com','9000000004','Barrackpore'),
('Sourav Ghosh','sourav@gmail.com','9000000005','Dum Dum'),
('Ananya Dey','ananya@gmail.com','9000000006','New Town'),
('Rahul Mitra','rahul@gmail.com','9000000007','Behala'),
('Mita Bose','mita@gmail.com','9000000008','Park Street'),
('Abhishek Kar','abhishek@gmail.com','9000000009','Tollygunge'),
('Sneha Mondal','sneha@gmail.com','9000000010','Barasat'),
('Kunal Shah','kunal@gmail.com','9000000011','Bidhannagar'),
('Riya Singh','riya@gmail.com','9000000012','Garia'),
('Tanmoy Dutta','tanmoy@gmail.com','9000000013','Rajarhat'),
('Puja Sen','puja@gmail.com','9000000014','Shyambazar'),
('Arjun Nandi','arjun@gmail.com','9000000015','Sealdah'),
('Moumita Roy','moumita@gmail.com','9000000016','Kasba'),
('Vikram Jain','vikram@gmail.com','9000000017','Bally'),
('Nisha Khan','nisha@gmail.com','9000000018','Belgharia'),
('Deep Roy','deep@gmail.com','9000000019','Kestopur'),
('Sayan Ghosh','sayan@gmail.com','9000000020','Madhyamgram');

-- =========================
-- INSERT RESTAURANTS
-- =========================
INSERT INTO Restaurants (restaurant_name,cuisine_type,address,contact_number) VALUES
('Spice Hub','Indian','Salt Lake','8011111111'),
('Pizza Point','Italian','Park Street','8011111112'),
('Sushi World','Japanese','New Town','8011111113'),
('Burger Town','Fast Food','Howrah','8011111114'),
('Biryani House','Mughlai','Barrackpore','8011111115'),
('Green Bowl','Healthy',NULL,'8011111116'),
('Tandoori Flames','North Indian','Garia','8011111117'),
('Noodle Nest','Chinese','Dum Dum','8011111118'),
('Cafe Aroma','Cafe','Rajarhat','8011111119'),
('Sweet Cravings','Desserts','Kasba','8011111120'),
('Food Villa','Multi Cuisine','Behala','8011111121'),
('Kebab King','Turkish','Bally','8011111122'),
('Roll Express','Street Food','Barasat','8011111123'),
('Ocean Grill','Seafood','Belgharia','8011111124'),
('Pasta Place','Italian','Tollygunge','8011111125'),
('Veg Delight','Vegetarian','Kolkata','8011111126'),
('Royal Feast','Indian','Shyambazar','8011111127'),
('Momo Spot','Tibetan','Madhyamgram','8011111128'),
('Juice Junction','Beverages','Sealdah',NULL),
('BBQ Nation Mini','Barbecue','New Town','8011111130');

-- =========================
-- INSERT DELIVERY AGENTS
-- =========================
INSERT INTO Delivery_Agents (full_name,phone,vehicle_type,status) VALUES
('Raj Kumar','7000000001','Bike','Available'),
('Amit Das','7000000002','Scooter','Busy'),
('Sahil Roy','7000000003','Bike','Available'),
('Pintu Singh','7000000004','Cycle','Available'),
('Rakesh Paul','7000000005','Bike','Offline'),
('Imran Ali','7000000006','Scooter','Busy'),
('Subham Kar','7000000007','Bike','Available'),
('Bikash Shaw','7000000008','Bike','Busy'),
('Suman Dey','7000000009','Cycle','Available'),
('Akash Roy','7000000010','Scooter','Offline'),
('Karan Jain','7000000011','Bike','Available'),
('Ravi Sen','7000000012','Bike','Busy'),
('Nitin Das','7000000013','Cycle','Available'),
('Arif Khan','7000000014','Bike','Available'),
('Mohan Roy','7000000015','Scooter','Busy'),
('Deepak Ghosh','7000000016','Bike','Available'),
('Rohit Dey','7000000017','Bike','Offline'),
('Anil Kumar','7000000018','Cycle','Available'),
('Soham Paul','7000000019','Scooter','Busy'),
('Nilesh Singh','7000000020','Bike','Available');

-- =========================
-- INSERT MENU ITEMS
-- =========================
INSERT INTO Menu_Items (restaurant_id,item_name,description,price,availability) VALUES
(1,'Butter Chicken','Creamy chicken curry',320,TRUE),
(2,'Margherita Pizza','Cheese pizza',250,TRUE),
(3,'Sushi Platter',NULL,480,TRUE),
(4,'Veg Burger','Loaded burger',180,FALSE),
(5,'Chicken Biryani','Spicy biryani',220,TRUE),
(6,'Quinoa Salad','Healthy salad',190,TRUE),
(7,'Paneer Tikka','Grilled paneer',240,TRUE),
(8,'Hakka Noodles','Veg noodles',170,TRUE),
(9,'Cold Coffee','Iced coffee',120,TRUE),
(10,'Chocolate Cake','Slice',140,TRUE),
(11,'Fried Rice','Egg fried rice',160,TRUE),
(12,'Chicken Kebab','Grilled kebab',260,TRUE),
(13,'Egg Roll','Street style',90,TRUE),
(14,'Grilled Fish',NULL,350,FALSE),
(15,'White Sauce Pasta','Cream pasta',230,TRUE),
(16,'Veg Thali','Indian meal',210,TRUE),
(17,'Mutton Curry','Rich gravy',380,TRUE),
(18,'Chicken Momo','Steamed momo',150,TRUE),
(19,'Orange Juice','Fresh juice',100,TRUE),
(20,'BBQ Wings','Spicy wings',300,TRUE);

-- =========================
-- INSERT ORDERS
-- =========================
INSERT INTO Orders (customer_id,restaurant_id,agent_id,total_amount,order_status,delivery_address) VALUES
(1,1,1,320,'Delivered','Kolkata'),
(2,2,2,250,'Delivered','Howrah'),
(3,3,3,480,'Preparing','Salt Lake'),
(4,4,NULL,180,'Cancelled','Barrackpore'),
(5,5,5,220,'Delivered','Dum Dum'),
(6,6,6,190,'Delivered','New Town'),
(7,7,7,240,'Out for Delivery','Behala'),
(8,8,8,170,'Delivered','Park Street'),
(9,9,9,120,'Delivered','Tollygunge'),
(10,10,NULL,140,'Pending','Barasat'),
(11,11,11,160,'Delivered','Bidhannagar'),
(12,12,12,260,'Preparing','Garia'),
(13,13,13,90,'Delivered','Rajarhat'),
(14,14,14,350,'Cancelled','Shyambazar'),
(15,15,15,230,'Delivered','Sealdah'),
(16,16,16,210,'Delivered','Kasba'),
(17,17,17,380,'Out for Delivery','Bally'),
(18,18,18,150,'Delivered','Belgharia'),
(19,19,19,100,'Pending','Kestopur'),
(20,20,20,300,'Delivered','Madhyamgram');

-- =========================
-- INSERT ORDER ITEMS
-- =========================
INSERT INTO Order_Items (order_id,item_id,quantity,subtotal) VALUES
(1,1,1,320),(2,2,1,250),(3,3,1,480),(4,4,1,180),(5,5,1,220),
(6,6,1,190),(7,7,1,240),(8,8,1,170),(9,9,1,120),(10,10,1,140),
(11,11,1,160),(12,12,1,260),(13,13,1,90),(14,14,1,350),(15,15,1,230),
(16,16,1,210),(17,17,1,380),(18,18,1,150),(19,19,1,100),(20,20,1,300);

-- =========================
-- INSERT PAYMENTS
-- =========================
INSERT INTO Payments (order_id,payment_method,payment_status) VALUES
(1,'UPI','Paid'),
(2,'Card','Paid'),
(3,'Cash','Pending'),
(4,'UPI','Refunded'),
(5,'Card','Paid'),
(6,'Cash','Paid'),
(7,'UPI','Paid'),
(8,'Card','Paid'),
(9,'UPI','Paid'),
(10,'Cash','Pending'),
(11,'Card','Paid'),
(12,'UPI','Paid'),
(13,'Cash','Paid'),
(14,'Card','Refunded'),
(15,'UPI','Paid'),
(16,'Cash','Paid'),
(17,'Card','Paid'),
(18,'UPI','Paid'),
(19,'Cash','Pending'),
(20,'Card','Paid');

