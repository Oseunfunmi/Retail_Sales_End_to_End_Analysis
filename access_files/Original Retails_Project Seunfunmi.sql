select *
from retail_store_sales;

-- Data Cleaning Processes
--1. Remove Duplicates

select distinct Customer_ID
from retail_store_sales
order by Customer_ID asc
;
select distinct item
from retail_store_sales
order by item asc
;
select distinct Category
from retail_store_sales
order by Category asc
;
select Category, item
from retail_store_sales
order by Category;
 
select distinct location 
from retail_store_sales
;

-- 2. Removing blanks and nulls

select *
from retail_store_sales;

select *
from retail_store_sales
where Quantity is null and Total_Spent is null;

-- the above query affects 604 rows in the dataset. null values in those two columns cannot be determined hence
-- the reason for dropping the rows. All the items in these rows have nulls too.

delete from retail_store_sales
where Quantity is null and Total_Spent is null;

select category, item, Price_Per_Unit, quantity, Total_Spent
from retail_store_sales
where Total_Spent is null
;
update retail_store_sales
set Price_Per_Unit = Total_Spent/quantity
where Price_Per_Unit is null;

select *
from retail_store_sales;

select category, item, Price_Per_Unit, quantity, Total_Spent
from retail_store_sales
where item is null
;
select category, item, Price_Per_Unit
from retail_store_sales
where price_per_unit = 8
order by category asc
;
update retail_store_sales
set item = case
when Category = 'Beverages' and Price_Per_Unit = 41 then 'Item_25_BEV'
when Category = 'Butchers' and Price_Per_Unit = 41 then 'Item_25_BUT'
when Category = 'Computers and electric accessories' and Price_Per_Unit = 41 then 'Item_25_CEA'
when Category = 'Food' and Price_Per_Unit = 41 then 'Item_25_FOOD'
when Category = 'Milk Products' and Price_Per_Unit = 41 then 'Item_25_MILK'
when Category = 'Patisserie' and Price_Per_Unit = 41 then 'Item_25_PAT'
when Category = 'Furniture' and Price_Per_Unit = 41 then 'Item_25_FUR'
when Category = 'Electric household essentials' and Price_Per_Unit = 41 then 'Item_25_EHE'
else item end
where item is null;

/* After determining the prices of individual items belonging to each category "Item_3 to Item_41", I updated
the irregular entries by reconciling the price_per_unit to fit their respective items. It is worthy of note that items' prices
increases by 3 across the categories with each successive level increase.
*/

select price_per_unit, item, category from retail_store_sales
where Price_Per_Unit = 35 order by category;

select price_per_unit, item, category from retail_store_sales
where item is null
order by Price_Per_Unit;

update retail_store_sales
set Discount_Applied = 0
where Discount_Applied is null;

select *
from retail_store_sales
where Transaction_ID is null or Customer_ID is null or Category is null or Item is null or 
Price_Per_Unit is null or Quantity is null or Total_Spent is null or Payment_Method is null or 
Location is null or Transaction_Date is null or Discount_Applied is null;


