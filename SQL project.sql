create database Project;
use Project;

-- understand the data structure
select * from flipkart_products_20250405;

-- top 10 most expensive products
select `Product Name`, `Price (â‚¹)` from flipkart_products_20250405 order by `Price (â‚¹)` desc limit 10;

-- Average rating by category
select `Main Category`,`Sub Category`, avg(`Rating (â˜…)`) as average from flipkart_products_20250405 
group by `Main Category`,`Sub Category` order by 3 desc;

-- products woth most reviews
select `Product Name`, `Rating (â˜…)` from flipkart_products_20250405 order by 2 desc;

-- count of products in each category
select `Main Category`,count(`Main Category`) as counts  from flipkart_products_20250405 group by 1 order by 2 desc;

-- price distribution
select case when `Price (â‚¹)` <500 then 'Under 500'
when `Price (â‚¹)` between 500 and 1000 then '500-1000'
when `Price (â‚¹)` between 1000 and 5000 then '1000-5000'
else 'above 5000'
end as price_range, count(*) as counts from flipkart_products_20250405 group by 1 order by 2 desc;

-- top performing categories by sales revenue
select `Main Category`, sum(`Price (â‚¹)`*`Total Sold`) as total_revenue
from flipkart_products_20250405 group by 1 order by 2 desc;

-- Average Discount by Seller and Its Impact on Sales
select seller, avg(`Discount (%)`) as avg_discount, sum(`Total Sold`) as total_sold
from flipkart_products_20250405 group by 1 order by 3 desc;

-- identify products with high rating but low sales
select `Product Name`,max(`Rating (â˜…)`) as high_rating,
min(`Total Sold`) as low_sales from flipkart_products_20250405 group by 1
order by 2 desc;

-- Stock Management: Over-stocked vs Under-performing Products
select `Product Name`,`Available Stock`,`Total Sold`,
(`Available Stock`-`Total Sold`) as unsold from flipkart_products_20250405
where `Total Sold` < `Available Stock` order by 4 desc limit 10;
