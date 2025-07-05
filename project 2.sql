
select *
from dirty_data;

alter table dirty_data
drop column Column1;

alter table dirty_data
drop column Column2;

select *, trim(segment) as segment2
from dirty_data;

create table dirty_data1
select *, trim(segment) as segment2
from dirty_data;

select *
from dirty_data1;

alter table dirty_data1
drop column Segment;

alter table dirty_data1
rename column segment2 to segment;

select*,
case
   when segment like 'Gov%' then 'Government'
   when segment like 'Mid%' then 'Midmarket'
   when segment like 'Chan%' then 'Channel_Partner'
   when segment like 'ente%' then 'Enterprise'
   when segment like 'sma%' then 'Small_Business'
   when segment like '/Mid%' then 'Midmarket'

end segemnt2
from dirty_data1;

create table dirty_data2
select*,
case
   when segment like 'Gov%' then 'Government'
   when segment like 'Mid%' then 'Midmarket'
   when segment like 'Chan%' then 'Channel_Partner'
   when segment like 'ente%' then 'Enterprise'
   when segment like 'sma%' then 'Small_Business'
   when segment like '/Mid%' then 'Midmarket'

end segemnt2
from dirty_data1;

select *
from dirty_data2;

alter table dirty_data2
drop column segment;

alter table dirty_data2
rename column segment2 to segment; 

create table dirty_data3
select *
from dirty_data2;


select *
from dirty_data3;

create table dirty_data4
select *
from dirty_data3;

select *,
row_number() over(partition by MyUnknownColumn, Country, Product, Discount_Band, Units_Sold,
 Manufacturing_Price, Sale_Price, Gross_Sales, Discounts, Sales, COGS, Profit, segemnt2) AS row_num
from dirty_data3;

create table dirty_data4
select *,
row_number() over(partition by MyUnknownColumn, Country, Product, Discount_Band, Units_Sold,
 Manufacturing_Price, Sale_Price, Gross_Sales, Discounts, Sales, COGS, Profit, segemnt2) AS row_num
from dirty_data3;

select *
from dirty_data4;

delete 
from dirty_data4
where MyUnknownColumn = 3;

delete 
from dirty_data4
where MyUnknownColumn = 4;

delete 
from dirty_data4
where row_num > 1;

alter table dirty_data4
drop column row_num;

select *
from dirty_data4;

select segemnt2 as Segment, trim(Country) as Country,trim(product) as Product,trim(Discount_Band) as Discount_Band,trim(Units_Sold) as Units_Sold,
trim(Manufacturing_Price) as Manufacturing_Price,trim(Sale_Price) as Sale_Price,trim(Gross_Sales) as Gross_Sales,trim(Discounts) as Discounts,
trim(Sales) as Sales, trim(COGS) as COGS,trim(Profit) as Profit
from dirty_data4;

create table dirty_data5
select segemnt2 as Segment, trim(Country) as Country,trim(product) as Product,trim(Discount_Band) as Discount_Band,trim(Units_Sold) as Units_Sold,
trim(Manufacturing_Price) as Manufacturing_Price,trim(Sale_Price) as Sale_Price,trim(Gross_Sales) as Gross_Sales,trim(Discounts) as Discounts,
trim(Sales) as Sales, trim(COGS) as COGS,trim(Profit) as Profit
from dirty_data4;

select *,
case
 when country like 'Can%' then 'Canada'
 when country like 'Ger%' then 'Germany'
 when country like 'Fra%' then 'France'
 when country like 'mex%' then 'Mexico'
 when country like 'usa'    then 'USA'
 when country like 'United%' then 'USA'
end AS Country2,
case
  when product like '/car%' then 'Carretera'
  when product like 'Car%' then 'Carretera'
  when product like 'mon%' then 'Montana'
  when product like 'pa%' then 'Paseo'
  when product like 've%' then 'Velo'
  when product like 'vt%' then 'VTT'
  when product like 'Ama%' then 'Amarilla'
  end as product2,
  case
 when sales > 1 then (sales - cogs)
end as profit2
from dirty_data5;

create table dirty_data7
select *,
case
 when country like 'Can%' then 'Canada'
 when country like 'Ger%' then 'Germany'
 when country like 'Fra%' then 'France'
 when country like 'mex%' then 'Mexico'
 when country like 'usa'    then 'USA'
 when country like 'United%' then 'USA'
end AS Country2,
case
  when product like '/car%' then 'Carretera'
  when product like 'Car%' then 'Carretera'
  when product like 'mon%' then 'Montana'
  when product like 'pa%' then 'Paseo'
  when product like 've%' then 'Velo'
  when product like 'vt%' then 'VTT'
  when product like 'Ama%' then 'Amarilla'
  end as product2,
  case
 when sales > 1 then (sales - cogs)
end as profit2
from dirty_data5;

select *
from dirty_data7;

alter table dirty_data7
drop column country;

alter table dirty_data7
drop column profit;

alter table dirty_data7
drop column product;

select *
from dirty_data7;

select *
from dirty_data;

create table dirty_data0
select Segment, Country2 as Country, product2 as Product, Discount_Band, Units_Sold, Manufacturing_Price, Sale_Price,
 Gross_Sales, Discounts, Sales, COGS, profit2 as Profit
from dirty_data7;


select *
from dirty_data0;





