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