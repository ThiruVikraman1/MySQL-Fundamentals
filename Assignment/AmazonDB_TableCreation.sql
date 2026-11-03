CREATE DATABASE AmazonDB;
USE AmazonDB;

CREATE TABLE Users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Registered_date DATE NOT NULL,
    Membership ENUM('Basic','Prime') DEFAULT 'Basic'
);

CREATE TABLE Products(
    Product_id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Stock INT NOT NULL
);

CREATE TABLE Orders(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT, 
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

SELECT * FROM users;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails; 

INSERT INTO Users (name, email, registered_date, membership) VALUES 
('Alice Johnson', 'alice.j@example.com', '2024-01-15', 'Prime'), 
('Bob Smith', 'bob.s@example.com', '2024-02-01', 'Basic'), 
('Charlie Brown', 'charlie.b@example.com', '2024-03-10', 'Prime'), 
('Daisy Ridley', 'daisy.r@example.com', '2024-04-12', 'Basic');

INSERT INTO Products (name, price, category, stock) VALUES 
('Echo Dot', 49.99, 'Electronics', 120), 
('Kindle Paperwhite', 129.99, 'Books', 50), 
('Fire Stick', 39.99, 'Electronics', 80), 
('Yoga Mat', 19.99, 'Fitness', 200), 
('Wireless Mouse', 24.99, 'Electronics', 150);

INSERT INTO Orders (user_id, order_date, total_amount) VALUES
(1, '2024-05-01', 79.98), 
(2, '2024-05-03', 129.99), 
(1, '2024-05-04', 49.99), 
(3, '2024-05-05', 24.99);

INSERT INTO OrderDetails (order_id, product_id, quantity) VALUES 
(1, 1, 2), 
(2, 2, 1), 
(3, 1, 1), 
(4, 5, 1);



