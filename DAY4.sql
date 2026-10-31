use sql7challenge;
use sql7challenge;

-- q1. total customers
-- count the total number of customers registered in the database

select count(*) as total_customers
from customers;


-- q2. customers by city
-- count customers in each city and identify the city with the highest customer count

select
    city,
    count(*) as customers_count
from customers
group by city
order by customers_count desc
limit 5;


-- q3. top 10 customers by order count
-- identify the top 10 customers who placed the highest number of non-cancelled orders

select
    o.customer_id,
    count(o.order_id) as total_orders
from orders o
where o.status <> 'cancelled'
group by o.customer_id
order by total_orders desc
limit 10;


-- q4. customer spending
-- calculate the total spending of each customer based on order item values, excluding cancelled orders

select
    o.customer_id,
    sum(oi.quantity * oi.unit_price) as total_spending
from orders o
join order_items oi
    on o.order_id = oi.order_id
where o.status <> 'cancelled'
group by o.customer_id
order by total_spending desc;


-- q5. average spending per customer
-- calculate the average spending per customer among customers who have placed at least one non-cancelled order

select
    round(avg(customer_spending), 2) as average_spending_per_customer
from (
    select
        o.customer_id,
        sum(oi.quantity * oi.unit_price) as customer_spending
    from orders o
    join order_items oi
        on o.order_id = oi.order_id
    where o.status <> 'cancelled'
    group by o.customer_id
) as customer_totals;


-- q6. customers with more than 5 orders
-- find customers who have placed more than five non-cancelled orders

select
    customer_id,
    count(order_id) as total_orders
from orders
where status <> 'cancelled'
group by customer_id
having count(order_id) > 5
order by total_orders desc;


-- q7. customer segment analysis
-- count the number of customers in each customer segment

select
    segment,
    count(*) as total_customers
from customers
group by segment
order by total_customers desc;


-- q8. average orders per customer
-- calculate the average number of non-cancelled orders per customer, including customers with zero qualifying orders

select
    round(avg(order_count), 2) as average_orders_per_customer
from (
    select
        c.customer_id,
        count(o.order_id) as order_count
    from customers c
    left join orders o
        on c.customer_id = o.customer_id
        and o.status <> 'cancelled'
    group by c.customer_id
) as customer_orders;


-- q9. top 10 customers by spending
-- identify the top 10 customers who generated the highest item sales value from non-cancelled orders

select
    o.customer_id,
    sum(oi.quantity * oi.unit_price) as total_spending
from orders o
join order_items oi
    on o.order_id = oi.order_id
where o.status <> 'cancelled'
group by o.customer_id
order by total_spending desc
limit 10;


-- q10. customer signups by month
-- count the number of new customer registrations per month and display the results chronologically

select
    date_format(signup_date, '%Y-%m') as signup_month,
    count(*) as new_customers
from customers
group by date_format(signup_date, '%Y-%m')
order by signup_month asc;


Customer analysis – key insights
1. Total Customers

The database contains 1,000 registered customers. This represents the store's customer base and provides a foundation for analysing customer behaviour and purchasing patterns.

2. Customers by City

Lucknow has the highest number of customers, with 65 customers, followed by Faridabad (60), Gurugram (59), Hyderabad (57), and Kolkata (55). This indicates stronger customer presence in these cities and can help the business plan location-based marketing strategies.

3. Top 10 Customers by Order Count

Customer IDs 509, 503, and 434 placed the highest number of non-cancelled orders, with 9 orders each. These customers demonstrate frequent purchasing behaviour and could be targeted with loyalty rewards and exclusive offers.

4. Customer Spending

Customer ID 298 recorded the highest total spending of 263,767.46, followed by customer ID 503 with 208,962.80 and customer ID 736 with 203,959.58. Identifying high-spending customers helps the business recognize its most valuable customers.

5. Average Spending per Customer

The average spending per customer is 61,829.21, calculated among 932 customers who placed at least one non-cancelled order. This helps measure the average customer contribution to sales.

6. Customers with More Than 5 Orders

A total of 59 customers placed more than five non-cancelled orders. These frequent purchasers represent an important customer group and are potential targets for customer retention and loyalty programs.

7. Customer Segment Analysis

The customer base is divided into three segments:
- Regular: 564 customers
- New: 256 customers
- Premium: 180 customers
Regular customers form the largest segment, accounting for 56.4% of the customer base. The business can focus on converting new customers into regular and premium customers.

8. Average Orders per Customer

The average number of non-cancelled orders per customer is 2.76, including all 1,000 registered customers. Out of these, 68 customers have zero qualifying orders. This highlights an opportunity to encourage inactive customers to make their first purchase.

9. Top 10 Customers by Spending

Customer ID 298 generated the highest item sales value at 263,767.46, followed by customer ID 503 at 208,962.80. These high-value customers contribute significantly to the store's sales and should be considered for personalized offers and retention strategies.

10. Customer Signups by Month

Customer registrations peaked in January 2023 and November 2024, with 42 new customers in each month. August 2023 recorded the lowest registrations, with 21 customers. These variations can help the business evaluate customer acquisition performance and identify opportunities for improving marketing campaigns.
