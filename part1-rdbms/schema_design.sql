
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS sales_reps;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- =========================
-- 1. CUSTOMERS TABLE
-- =========================
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);

-- =========================
-- 2. PRODUCTS TABLE
-- =========================
CREATE TABLE products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

-- =========================
-- 3. SALES REPRESENTATIVES
-- =========================
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);

-- =========================
-- 4. ORDERS (HEADER TABLE)
-- =========================
CREATE TABLE orders (
    order_id VARCHAR(10) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

-- =========================
-- 5. ORDER ITEMS (LINE ITEMS)
-- =========================
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================
-- INSERT DATA
-- =========================

-- CUSTOMERS (5 rows)
INSERT INTO customers VALUES
('C001','Rohan Mehta','rohan@gmail.com','Mumbai'),
('C002','Priya Sharma','priya@gmail.com','Delhi'),
('C003','Amit Verma','amit@gmail.com','Mumbai'),
('C004','Sneha Kapoor','sneha@gmail.com','Bangalore'),
('C006','Neha Gupta','neha@gmail.com','Delhi');

-- PRODUCTS (5 rows)
INSERT INTO products VALUES
('P004','Notebook','Stationery',120),
('P005','Headphones','Electronics',3200),
('P006','Laptop','Electronics',55000),
('P007','Pen Set','Stationery',250),
('P008','Mouse','Electronics',700);

-- SALES REPS (5 rows)
INSERT INTO sales_reps VALUES
('SR01','Deepak Joshi','deepak@corp.com','Mumbai HQ'),
('SR02','Anita Desai','anita@corp.com','Delhi Office'),
('SR03','Rahul Singh','rahul@corp.com','Bangalore Office'),
('SR04','Pooja Nair','pooja@corp.com','Chennai Office'),
('SR05','Karan Malhotra','karan@corp.com','Hyderabad Office');

-- ORDERS (5 rows)
INSERT INTO orders VALUES
('ORD1027','2023-11-02','C002','SR02'),
('ORD1114','2023-08-06','C001','SR01'),
('ORD1153','2023-02-14','C006','SR01'),
('ORD1002','2023-01-17','C002','SR02'),
('ORD1118','2023-11-10','C006','SR02');

-- ORDER ITEMS (5+ rows)
INSERT INTO order_items (order_id, product_id, quantity) VALUES
('ORD1027','P004',4),
('ORD1114','P007',2),
('ORD1153','P007',3),
('ORD1002','P005',1),
('ORD1118','P007',5),
('ORD1118','P008',2);