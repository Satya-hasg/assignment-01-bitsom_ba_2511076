# Anomaly Analysis

## Insert Anomaly

In the dataset, product information is stored only within order records.
For example:
- Row 0 → product_id = P004, product_name = Notebook
- Row 1 → product_id = P007, product_name = Pen Set
Columns involved:
- product_id
- product_name
- category
- unit_price
If a new product (e.g., P010) needs to be added but no order exists yet, it cannot be inserted into the dataset without creating a fake order.
This is an insert anomaly, as product data depends on order existence.

---

## Update Anomaly

Customer data is repeated across multiple rows.
For example:
- Row 0 → customer_id = C002, customer_name = Priya Sharma, customer_city = Delhi
- Row 3 → customer_id = C002, customer_name = Priya Sharma, customer_city = Delhi
Columns involved:
- customer_id
- customer_name
- customer_email
- customer_city
If Priya Sharma changes her city or email, all rows containing C002 must be updated.
If only one row is updated and others are missed, inconsistent data will occur.
This is an example of update anomaly.

---

## Delete Anomaly

All product and sales representative information exists only within order rows.
For example:
- Row 0 → order_id = ORD1027 contains product P004 (Notebook)
Columns involved:
- order_id
- product_id
- product_name
- sales_rep_id
If row 0 is deleted, and it is the only row containing product P004, then all information about that product will be lost.
Similarly, sales rep data may also be lost if it exists only in that row.
This is an example of delete anomaly.


## Normalization Justification
I would refute the manager’s position. Keeping everything in one table may look simpler at first, but in this dataset it quickly creates maintenance and data-quality problems. The flat file mixes customers, products, orders, and sales representatives in the same row, which means the same information is repeated again and again. For example, customer C002 (Priya Sharma) appears in multiple orders such as ORD1027 and ORD1002. If her city or email changes, every related row must be updated. Missing even one row creates inconsistent customer data. In real work, this is exactly how reporting errors and trust issues start.
The same problem exists for products and sales representatives. Product details such as P007 - Pen Set are tied to order rows. That means a new product cannot be stored unless an order already exists, which is not practical for a business that wants to maintain a product catalog separately. Similarly, deleting an order can accidentally remove useful product or sales-rep information if that row was the only place where it appeared.
Normalization is not over-engineering here; it is a way to protect data quality and make the system easier to manage as the business grows. By separating the data into customers, products, sales_reps, orders, and order_items, each fact is stored only once in the right place. This reduces duplication, avoids accidental data loss, and makes updates safer. In practice, normalization makes the database more reliable, easier to query, and far less error-prone than keeping everything in one large table.