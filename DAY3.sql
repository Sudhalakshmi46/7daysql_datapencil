-- REVENUE AND SALES ANALYSIS
use sql7challenge;
-- Q1. TOTAL SALES VALUE - CALCULATE THE TOTAL VALUE OF ALL ORDER ITEMS
select sum(oi.quantity*oi.unit_price) as total_sales from orders o join order_items oi on o.order_id=oi.order_id where status <> 'cancelled';
-- Q2. REVENUE BY PRODUCT CATEGORY - IDENTIFY WHICH PRODUCT CATEGORIES GENERATE THE MOST SALES
select p.category ,sum(quantity*unit_price) as revenue from orders o join order_items oi on o.order_id=oi.order_id join products p on oi.product_id=p.product_id where o.status <> 'cancelled' group by p.category order by revenue asc ;
-- Q3. 10 PRODUCTS BY REVENUE - FIND THE TEN PRODUCTS GENERATE THE HIGHEST REVENUE
select p.product_id,p.product_name,SUM(oi.quantity * oi.unit_price) as revenue from orders o join order_items oi on o.order_id = oi.order_id join products p on oi.product_id = p.product_id where o.status <> 'cancelled' group by p.product_id,p.product_name  order by revenue desc limit 10;
-- Q4. MONTHLY REVENUE TREND - CALCULATE REVENUE MOTNH BY MONTH
select date_format(o.order_date,'%y-%m') as revenue_month,sum(oi.quantity*oi.unit_price) as monthly_revenue from orders o join order_items oi on o.order_id = oi.order_id  where o.status <> 'cancelled' group by date_format(o.order_date, '%y-%m') order by revenue_month;
-- Q5. REVENUE BY SALES CHANNEL - IDENTIFY WHICH SALES CHANNELS GENERATE THE HIGHEST REVENUE
select o.channel ,sum(oi.quantity * oi.unit_price) as revenue from orders o join order_items oi on o.order_id=oi.order_id where o.status <> 'cancelled' group by o.channel order by revenue desc;
-- Q6.TOTAL QUANTITY SOLD BY PRODUCT CATEGORY - CALCULATE THE TOTAL QUANTITY OF PRODUCTS SOLD IN EACH CATEGORY
select p.category,sum(oi.quantity) as total_quantity_sold from orders o join order_items oi on o.order_id = oi.order_id join products p on oi.product_id = p.product_id where o.status <> 'cancelled' group by p.category order by total_quantity_sold desc;
-- Q7.PAYMENT METHOD ANALYSIS - COUNT HOW MANY PAYMENTS WERE MADE USING EACH PAYMENT METHOD
select payment_type , count(*) as total_payments from payment group by payment_type order by total_payments  desc;
-- Q8.PAYMENT STATUS ANALYSIS - COUNT PAYMENTD BY THEIR STATUS
select payment_type,count(*) as total_payments from payment group by payment_type order by total_payments desc;
-- Q9.AVERAGE PAYMENT AMOUNT - CALCULATED THE AVREAGE RECORDED PAYMENT AMOUNT
select avg(amount) as average_payment_amount from payment;
-- Q10.PAYMENT AMOUNT BY PAYMENT METHOD - CALCULATE THE TOTA; RECORDED PAYMENT AMOUNT FOR EACH PAYMENT METHOD
select payment_type, sum(amount) as total_payment_amount from payment group by payment_type order by total_payment_amount desc;



Q1–Q6: Revenue and sales insights
1. Total Sales Value: The total sales value from non-cancelled orders is 57,624,820.18. This represents the calculated value of order items for orders that were not cancelled.
2. Revenue by Product Category: Sports & Fitness generated the highest revenue at 11,008,290.30, followed by Fashion at 10,235,687.04. Electronics generated the lowest revenue at 7,996,740.62. The business could investigate why Electronics generates less revenue than the other categories.
3. Top 10 Products by Revenue: Storage Box 26 generated the highest revenue at 941,213.73, followed by Bluetooth Speaker 31 at 869,831.94 and Fitness Tracker 150 at 798,315.68. These products are important contributors to sales and could be considered for inventory planning and targeted promotions.
4. Monthly Revenue Trend: January 2025 recorded the highest monthly revenue at 3,339,006.14, while April 2026 recorded the lowest at 2,174,201.99. Revenue fluctuates across months, suggesting changes in customer demand and purchasing activity.
5. Revenue by Sales Channel: Social Commerce generated the highest revenue at 15,378,348.43, followed by Website at 15,031,212.24. Marketplace generated the lowest revenue at 13,423,439.70. The business could study successful social commerce campaigns and investigate opportunities to improve marketplace sales.
6. Quantity Sold by Product Category: Beauty & Personal Care recorded the highest quantity sold, with 2,406 units, followed by Electronics with 2,344 units. Sports & Fitness recorded the lowest quantity at 2,214 units. This helps the business plan stock according to product demand.
Q7–Q10: Payment analysis insights
7. Payment Method Analysis: Card was the most frequently used payment method, with 636 payments, followed by Cash on Delivery with 611 and UPI with 598. Net Banking was the least-used method, with 566 payments. The store should continue supporting multiple payment options to accommodate customer preferences.
8. Payment Status Analysis: Out of 3,000 payment records, 2,542 were Paid, 236 were Refunded, and 222 were Failed. Approximately 84.7% of payment records were marked Paid. The business should investigate failed payments and monitor refunds to improve payment success and customer experience.
9. Average Payment Amount: The average recorded payment amount is 20,886.06. This provides a baseline for understanding the typical payment transaction value.
10. Payment Amount by Payment Method: Card payments recorded the highest total amount at 13,314,924.36, followed by Cash on Delivery at 12,957,442.83. Net Banking recorded the lowest total at 11,383,337.57. This helps the business understand the monetary contribution of each payment method.