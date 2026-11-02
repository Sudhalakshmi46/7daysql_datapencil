use sql7challenge;


-- q1. order status distribution
-- count how many orders belong to each order status

select
    status,
    count(*) as total_orders
from orders
group by status
order by total_orders desc;


-- q2. delivery status analysis
-- count how many deliveries belong to each delivery status

select
    status as delivery_status,
    count(*) as total_deliveries
from delivery
group by delivery_status
order by total_deliveries desc;


-- q3. average delivery time
-- calculate the average number of days taken to complete a delivery

select
    round(avg(datediff(delivery_date, dispatch_date)), 2) as average_delivery_days
from delivery
where delivery_status = 'Delivered';


-- q4. top 10 longest deliveries
-- identify the 10 delivered orders that took the longest time to arrive

-- q4. top 10 longest deliveries

select
    order_id,
    departure,
    arrival,
    datediff(arrival, departure) as delivery_days
from delivery
where status = 'Delivered'
order by delivery_days desc
limit 10;

-- q5. monthly order volumes
-- calculate the number of orders placed each month

select
    date_format(order_date, '%Y-%m') as order_month,
    count(*) as total_orders
from orders
group by date_format(order_date, '%Y-%m')
order by order_month;


-- q6. payment status distribution
-- count payment records across different payment statuses

select
    payment_status,
    count(*) as total_payments
from payment
group by payment_status
order by total_payments desc;

-- q7. delayed deliveries (more than 5 days)
-- identify completed deliveries that took longer than five days

select
    order_id,
    departure,
    arrival,
    datediff(arrival, departure) as delivery_days
from delivery
where status = 'Delayed'
  and datediff(arrival, departure) > 5
order by delivery_days desc;


-- q8. delivery performance by city
-- calculate the average delivery time for each customer city

select
    c.city,
    round(avg(datediff(d.arrival, d.departure)), 2) as average_delivery_days
from customers c
join orders o
    on c.customer_id = o.customer_id
join delivery d
    on o.order_id = d.order_id
where d.status = 'Delivered'
group by c.city
order by average_delivery_days desc;


1. Payment performance: Out of 3,000 payments, 2,542 (84.73%) were successful, while 236 (7.87%) were refunded and 222 (7.4%) failed. The business should investigate failed transactions and identify reasons for refunds to improve payment performance.

2. Delivery delays: There are 795 deliveries marked as Delayed that took more than 5 days. Their delivery duration ranges from 8 to 10 days. The business should review its logistics process and work with delivery partners to reduce delays.

3. Delivery performance by city: Mumbai has the highest average delivery time at 4.89 days, while Surat has the lowest at 4.03 days among completed deliveries. The business should investigate delivery operations in Mumbai to identify opportunities to improve delivery speed.