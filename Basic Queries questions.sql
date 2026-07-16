-- Basic Queries

-- 1. Retrieve all books in the "Fiction" genre

select *
from Books; 

Select *
from books
where Genre = 'Fiction' ;

-- Find books published after the year 1950

select *
from books;

select *
from books
Where Published_year > 1950
order by Published_year ;

-- list all customers form Canada 

select * 
from customers;

select *
from customers 
Where Country = 'Canada';

-- Show orders placed in November 2023

select *
from orders;

select order_date,
monthname(order_date)
from orders;

Alter Table orders add column month_name varchar (10);

update orders
set month_name = monthname(order_date);

select *
from orders;

Alter Table orders
add column order_year INT;


update orders
set order_year = YEAR(order_date);

select *
from orders;


Select *
from orders
where month_name = 'November' and order_year = 2023;

Select *
from orders
where order_date between '2023-11-01' and '2023-11-30';

-- Retrieve the total stock of books avaiable 

select *
from books;

select
sum(Stock) as Total_stock;

-- Find the details of the most expensive book 

select *
from books;

select *
from books
order by price desc;

select *
from books
order by price desc
limit 1;

-- Show all customers who ordered more than 1 quantity of a book

select *
from orders;

Select *
from orders
where quantity > 1
order by quantity ;

-- Retrieve all orders where the total amount exceeds $20

select *
from orders;

select *
from orders
where total_amount > 20
order by Total_Amount;

-- list all genres available in the Books table 

select *
from books;

select distinct Genre
from books
group by Genre;

-- Find the book with the lowest stock

select *
from books;

select *
from books
order by stock
limit 4;

-- Calculate the total revenue generated from all orders 

select *
from orders;

select 
sum(Total_Amount) as total_revenue
from orders;



