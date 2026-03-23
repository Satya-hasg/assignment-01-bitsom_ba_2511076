-- DIMENSIONS

CREATE TABLE dim_date (
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    month INTEGER,
    year INTEGER
);

CREATE TABLE dim_store (
    store_id TEXT PRIMARY KEY,
    store_name TEXT,
    location TEXT
);

CREATE TABLE dim_product (
    product_id TEXT PRIMARY KEY,
    product_name TEXT,
    category TEXT
);

-- FACT TABLE

CREATE TABLE fact_sales (
    sale_id INTEGER PRIMARY KEY AUTOINCREMENT,
    date_id INTEGER,
    store_id TEXT,
    product_id TEXT,
    quantity INTEGER,
    revenue REAL,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);