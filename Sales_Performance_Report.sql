create database sales_performance;

select * from data_sales;

select year(order_date) as years, COUNT(distinct customer) as total_of_customer
	from data_sales
    where order_status='Order Finished'
    group by 1;
    
select year(order_date) as years, 
	   product_category, 
       product_sub_category, 
       sum(sales) as sales,
       sum(discount_value) as promotion_value,
       round(sum(sales)/sum(discount_value)*100,2) as burn_rate_percentage
from data_sales
where year(order_date)='2010' and order_status='Order Finished'
group by year(order_date), product_category, product_sub_category;
