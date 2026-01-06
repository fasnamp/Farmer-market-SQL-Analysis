# Farmers Market Database — SQL Query Practice
### Overview

This repository contains a curated collection of SQL practice exercises based on a Farmers Market relational database.
These exercises are designed to help learners strengthen their skills in:

- SQL joins
- Filtering and conditional logic
- Aggregation and grouping
- String manipulation
- Date-based queries
- Real-world analytical reporting

The dataset simulates a realistic farmers market environment, including customers, vendors, products, booths, inventory, and purchase transactions.

---

## Database Schema Overview

The database consists of the following core tables:

- **product ** — Stores detailed product information.
- **vendor_booth_assignments ** — Tracks vendor booth assignments by market date.
- **customer_purchases ** — Records all customer purchase transactions.
- **customer ** — Contains customer demographic details.
- **market_date_info ** — Stores market dates along with weather information.
- **vendor ** — Contains vendor profiles and business types.
- **product_category ** — Classifies products into defined categories.
- **vendor_inventory ** — Maintains vendor inventory levels and pricing data.

  ---

## SQL Practice Tasks

1. Retrieve all products available in the market.
2. Display 10 rows from vendor_booth_assignments, including market_date, vendor_id, and booth_number.
3. Calculate the total amount spent in each purchase (quantity × cost_per_qty), including all purchase details.
4. Combine each customer’s first and last name into a single full-name column.
5. Extract all product names belonging to product category 1.
6. Count the number of products available for sale on each market date.
7. Generate a detailed report of all purchases made by customer_id = 4, sorted by market_date, vendor_id, and product_id.
8. Retrieve product information for product IDs between 3 and 8 (exclusive), or product ID 10.
9. Display all purchases made by customer_id = 4 at vendor_id = 7, including the total amount spent.
10. Find customer details for customers named “Carlos” or with the last name “Diaz.”
11. Retrieve booth assignments for vendor 7 between April 3, 2019, and May 16, 2019.
12. Return customers with the last names: Diaz, Edwards, or Wilson.
13. Analyze purchases made on market days when it rained.
14. List all products that do not have a size value.
15. Retrieve customer records for partial name matches such as “jerry,” “jeremy,” or “jeremiah.”
16. Merge customer first and last names into a single UPPERCASE full-name column.
17. List all booths assigned to vendor 2 on or before April 20, 2019.
18. Identify vendors that primarily sell fresh produce versus other product types.
19. Calculate the total quantity purchased by each customer per market date.
20. Count the number of distinct product types purchased by customer 10 on each market date.

---    
