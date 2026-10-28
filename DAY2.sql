use sql7challenge;

-- Q1.TOTAL ORDERS - THE TOTAL NUMBER OF ORDERS IN THE DATABASE
select count(*) as total_orders from orders;
-- (or) select count(order_id) as TOTAL_ORDERS from orders;

-- Q2.ORDER STATUS COUNTS - COUNT HOW MANY ORDERS EXIST FOR EACH STATUS(E.G: PENDING,COMPLETED,CANCELLED)
select status,count(*) as total_orders from orders group by status;

-- Q3. 10 MOST RECENT ORDERS - RETRIEVE THE 10 LATEST OREDRS BY ORDER DATE
select * from orders order by order_date desc limit 10;

-- Q4. 10 HIGHEST VALUE ORDERS - FIND THE ORDERS WITH THE HIGHEST TOTAL AMOUNT
select order_id, sum(quantity * unit_price) as total_amount from order_items group by order_id order by total_amount desc limit 10;
-- Q5. DAILY ORDER VOLUME - COUNT ORDERS PLACED PER DAY IN CHRONOLOGICAL ORDER
select order_date,count(*) as total_orders from orders group by order_date order by order_date asc ;
  -- LEVEL 2
  -- MONTHLY ORDER TREND - GROUP ORDERS BY MONTH USING DATE FUNCTIONS ,IDENTIFY PEAK AND LOW-VOLUME MONTHS
  select month(order_date),count(*) as total_orders from orders group by month(order_date) order by month(order_date) asc;
  
  -- Q7. AVERAGE ORDER VALUE (ROUNDED) - CALCULATE THE AVERAGE ORDER AMOUNT ACROSS ALL ORDERS ,ROUND THE RESULT FOR CLEAN REPORTING(20861.78)
   select round(avg(order_amount),2) as avg_value from (select order_id,sum(quantity*unit_price) as order_amount from order_items group by order_id) as orders_total;

1. Total Orders: The database contains 3,000 orders, providing an overview of the store's overall order activity between January 2025 and September 2026.

2. Order Status Analysis: Out of 3,000 orders, 1,796 were delivered, 385 were shipped, 303 were processing, 280 were returned, and 236 were cancelled. Delivered orders account for approximately 59.9% of all orders. The store can investigate returns and cancellations to identify opportunities to improve customer satisfaction.

3. 10 Most Recent Orders: The latest orders can be identified by sorting the order date in descending order. This helps the business monitor recent transactions and review their current statuses.

4. 10 Highest-Value Orders: Order ID 637 has the highest calculated order value at 62,489.96, followed by order ID 2905 at 62,409.52. Identifying high-value orders helps the business understand its largest transactions.

5. Daily Order Volume: Order volume varies from day to day. The highest daily order count is 12 orders, recorded on multiple dates. Tracking daily volume can help the store plan inventory and manage busy periods.

6. Monthly Order Trend: When orders are grouped by calendar month across both years, August has 300 orders, while November has 130 orders. However, these figures combine years where applicable. For a more accurate trend, April 2025 recorded the highest monthly count at 161 orders, closely followed by May 2026 with 160 orders.

7. Average Order Value: The average order value calculated from quantity × unit_price is 20,886.06. This represents the average calculated merchandise value per order and can help the business evaluate customer purchasing patterns.