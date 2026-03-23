## ETL Decisions
### Decision 1 — Standardizing Date Formats
Problem:
The raw dataset contained inconsistent date formats such as DD-MM-YYYY, YYYY/MM/DD, and text-based representations. This inconsistency made it difficult to perform time-based aggregations and caused ambiguity in month and year extraction.
Resolution:
All date values were transformed into a standardized ISO format (YYYY-MM-DD). Additionally, derived attributes such as month and year were extracted and stored in the dim_date table. This ensured consistent temporal analysis and improved query performance for aggregations like monthly revenue trends.
### Decision 2 — Handling NULL and Missing Values
Problem:
Certain records had NULL or missing values in critical fields such as category, revenue, and product_id. These fields are essential for joins and aggregations, and NULL values could lead to incorrect results or data loss during analysis.
Resolution:
Missing categorical values were replaced with a default value such as "Unknown" where appropriate, while records with missing critical transactional values (e.g., revenue or product_id) were excluded to maintain data integrity. This ensured that all analytical queries produced accurate and reliable results without skewed aggregations.
### Decision 3 — Normalizing Category Values
Problem:
Product categories appeared in inconsistent formats such as "electronics", "Electronics", and "ELECTRONICS". This caused fragmentation during group-by operations, leading to incorrect aggregation results.
Resolution:
All category values were normalized to a consistent format (capitalized case, e.g., "Electronics", "Clothing", "Groceries") before loading into the dim_product table. This ensured proper grouping and accurate category-level analysis in reporting queries.