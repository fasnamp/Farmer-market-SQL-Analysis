
use farmers_market;
select *from customer;
select *from booth;
select *from customer_purchases;
select *from market_date_info;
select *from product;
select *from product_category;
select *from vendor;
select *from vendor_booth_assignments;
select *from vendor_inventory;
select *from zip_data;

#1.	List all the products and their product categories.
select p.product_name,pc.product_category_name from product p join product_category pc on
p.product_category_id=pc.product_category_id;

#2.	Get all the Customers who have purchased nothing from the market yet.
select c.* from customer c left join customer_purchases cp on 
c.customer_id=cp.customer_id where cp.customer_id is null;

#3.	List all the customers and their associated purchases
select c.customer_id,c.customer_first_name,c.customer_last_name,cp.product_id,
cp.vendor_id,cp.market_date,cp.quantity,cp.cost_to_customer_per_qty,cp.transaction_time,p.product_name
 from customer c join customer_purchases cp on c.customer_id=cp.customer_id
 join product p on p.product_id=cp.product_id;

#4.	Write a query that returns a list of all customers who did not purchase on March 2, 2019
select c.customer_first_name,c.customer_last_name,cp.market_date,cp.quantity,
cp.transaction_time,cp.cost_to_customer_per_qty,cp.product_id from customer c
join customer_purchases cp on c.customer_id=cp.customer_id where cp.market_date!='2019-03-02';

#5.	filter out vendors who brought at least 10 items to the farmer’s market over the time period - 2019-05-02 and 2019-05-16
SELECT 
    v.vendor_id,
    v.vendor_name,
    v.vendor_owner_first_name,
    v.vendor_owner_last_name,
    COUNT(vi.product_id) AS total_items_brought
FROM vendor v
JOIN vendor_inventory vi ON v.vendor_id = vi.vendor_id
WHERE vi.market_date BETWEEN '2019-05-02' AND '2019-05-16'
GROUP BY 
    v.vendor_id,
    v.vendor_name
HAVING COUNT(vi.product_id) >= 10;

#6.	Show details about all farmer’s market booths and every vendor booth assignment for every market date
select b.booth_number,b.booth_type,b.booth_description,b.booth_price_level,
ba.vendor_id,ba.market_date from booth b join vendor_booth_assignments ba
on b.booth_number=ba.booth_number order by market_date;

#7.	find out how much this customer had spent at each vendor, regardless of date? (Include customer_first_name, customer_last_name, customer_id, vendor_name, vendor_id, price)
select c.customer_first_name,c.customer_last_name,c.customer_id,v.vendor_name,v.vendor_id,
sum(cp.quantity*cp.cost_to_customer_per_qty) as total_spend from customer c
join customer_purchases cp on c.customer_id=cp.customer_id
join vendor v on cp.vendor_id=v.vendor_id
group by v.vendor_id,v.vendor_name,c.customer_id,c.customer_first_name,c.customer_last_name
order by v.vendor_id, c.customer_id;

#8.	get the lowest and highest prices within each product category include (product_category_name, product_category_id, lowest price, highest _price)
select pc.product_category_name,pc.product_category_id,min(vi.original_price) as lowest_price,max(vi.original_price) as highest_price
from product p join product_category pc on pc.product_category_id=p.product_category_id
join vendor_inventory vi on vi.product_id=p.product_id
group by pc.product_category_name,pc.product_category_id
order by pc.product_category_name;

#9.	Count how many products were for sale on each market date, or how many different products each vendor offered.
select market_date,count(distinct product_id) as total_product_for_sale from vendor_inventory
group by market_date order by market_date;

#or
select v.vendor_id,v.vendor_name,v.vendor_type,count(vi.product_id) as vendor_offered from vendor v
join vendor_inventory vi on v.vendor_id=vi.vendor_id
group by v.vendor_id order by v.vendor_id;

#10.In addition to the count of different products per vendor, we also want the average original price of a product per vendor?
select v.vendor_id,v.vendor_name,count(distinct vi.product_id) as different_product,avg(vi.original_price) as avg_price
from vendor v join vendor_inventory vi on v.vendor_id=vi.vendor_id
group by v.vendor_id order by v.vendor_id;

#1. Get all the products available in the market 
select distinct p.product_id,p.product_name,p.product_category_id,pc.product_category_name 
from product p join product_category pc on p.product_category_id=pc.product_category_id
join vendor_inventory vi on p.product_id=vi.product_id
order by p.product_name;

#2. List down 10 rows of vendor booth assignments, displaying the market date, vendor ID, and booth number from the vendor_booth_assignments table. 
select *from vendor_booth_assignments limit 10;

#3. In the customer purchases, we have quantity and cost per qty separate, query the total amount that the customer has paid along with date, customer id, vendor_id, qty, cost per qty and the total amt.? 
select customer_id,vendor_id,quantity,cost_to_customer_per_qty,market_date,(quantity*cost_to_customer_per_qty) as total_amount from customer_purchases;

#4. Merge each customer’s name into a single column that contains the first name, then a space, and then the last name. 
select customer_first_name,customer_last_name,concat(customer_first_name,' ',customer_last_name) as full_name from customer;

#5. Extract all the product names that are part of product category 1. 
select product_name,product_category_id from product where product_category_id=1;

#6. How many products where for sale on each market date 
select market_date,count(product_id) as total_sale_of_day from customer_purchases group by market_date;

#7. Print a report of everything customer_id 4 has ever purchased at the farmer’s market, sorted by market date, vendor ID, and product ID. 
select *from customer_purchases where customer_id=4 order by market_date,vendor_id,product_id;

#8. Get all the product info for products with id between 3 and 8 (not inclusive) or product with id 10. 
select *from product where product_id>3 and product_id<8 or product_id=10;

#9. Details of all the purchases made by customer_id 4 at vendor_id 7, along with the total_amt. 
select *,(cost_to_customer_per_qty*quantity) as total_amount from customer_purchases where customer_id=4 and vendor_id=7;

#10. Find the customer detail with the first name of “carlos” or the last name of “diaz” 
#11. Find the booth assignments for vendor 7 for any market date that occurred between april 3, 2019, and may 16, 2019 
#12. Return a list of customers with selected last names - [diaz, edwards and wilson]. 
#13. Analyze purchases made at the farmer’s market on days when it rained. 
#14. Return all products without sizes. 
#15. You want to get data about a customer you knew as “jerry,” but you aren’t sure if he was listed in the database as “jerry” or “jeremy” or “jeremiah.”  How would you get the data from this partial string? 
#16. We want to merge each customer’s name into a single column that contains the first name, then a space, and then the last name in upper case. 
#17. Find out what booths vendor 2 was assigned to on or before (less than or equal to) april 20, 2019 
#18. Find out which vendors primarily sell fresh produce and which don’t. 
#19. Calculate the total quantity purchased by each customer per market_date. 
#20. How many different kinds of products were purchased by each customer 10 in each market date