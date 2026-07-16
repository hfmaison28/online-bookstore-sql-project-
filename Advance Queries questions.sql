-- Advance Queries

-- 1). Retrieve the total number of books sold for each genre 

select *
from books;

Select *
from orders;

select *
from books as b
join orders as o
  on b.Book_ID = o.Order_ID
  ;


Select distinct Genre,
Sum(Quantity) 
from books as b
join orders as o
  on b.Book_ID = o.Order_ID
  group by Genre;
  
  -- Retreive the total number of books sold by each author
  
  select *
from books as b
join orders as o
  on b.Book_ID = o.Order_ID
  ;
  
  select author,
  sum(Quantity) as books_sold
  from books as b
join orders as o
  on b.Book_ID = o.Order_ID
  group by author
  order by books_sold desc
  ;
  
  -- 2). Find the average price of books in the "Fantasy" genre

Select distinct Genre,
avg(price)
from books
where Genre = 'Fantasy'
group by Genre
;

-- 2a). Find the average price of books in the "Biography" genre

 select Genre,
 avg(price) as avg_price
 from books
 where Genre = 'Biography'
 group by Genre
 ;

-- 3) List customers who have placed at least 2 orders 

select *
from orders;

select *
from customers;

select *
from customers as c
join orders as o
  on c.customer_ID = o.Customer_ID
  ;

select Name,
sum(Quantity) as total_orders
from customers as c
join orders as o
  on c.customer_ID = o.Customer_ID
  group by Name 
  order by total_orders
  ;

select Name,
sum(o.Quantity) as total_orders
from customers as c
join orders as o
  on c.customer_ID = o.Customer_ID
  group by c.Name 
  having sum(o.Quantity) > 2
  ;

select Name,
sum(o.Quantity) as total_orders
from customers as c
join orders as o
  on c.customer_ID = o.Customer_ID
  group by c.Name 
  having sum(o.Quantity) > 2
  order by total_orders 
  ;
  
  -- Find the most frequently ordered book 

Select *
from books;

Select *
from orders;

select Title,
sum(o.Quantity) as total_order
from books as b
join orders as o
  on b.Book_ID = o.Order_ID
  group by Title
  order by total_order desc ;
  
  select b.Title,
  o.Book_id,
count(o.Order_ID) as order_count
from books as b
join orders as o
  on b.Book_ID = o.Book_ID
  group by b.Title, o.Book_ID
  order by order_count desc
  limit 7
  ;
  
  -- 5). Show the top 3 most expensive books of 'Fantasy' Genre
  
  select *
  from books;
  
  select Title,
  price,
  Genre
  from books
  where Genre =  'Fantasy'
  order by price desc
  limit 3
  ;
  
  select *
  from books
  where Genre =  'Fantasy'
  order by price desc
  limit 3
  ;
  
  -- 6) Retrieve the total quantity of books sold by each author
  
  select *
  from books;
  
  select *
  from orders;
  
  select 
  b.Author,
  count(o.Quantity) as total_books_sold
  from books as b
join orders as o
  on b.Book_ID = o.Book_ID
  group by b.Title, b.Author 
  order by total_books_sold desc
  ;
  
  select 
  b.Author,
  sum(o.Quantity) as total_books_sold
  from books as b
join orders as o
  on b.Book_ID = o.Book_ID
  group by b.Title, b.Author 
  order by total_books_sold desc
  ;
  -- this is the correct one 
  
  -- 7) List the cities where cutomers who spent over $30 are located:
  
  select *
  from customers;
  
  select *
  from books;
  
  select City,
  price
  from books as b
  Join customers as c
  on b.Book_ID = c.customer_ID
  where price > 30
  group by city, price
  order by price
  ;
  
  -- 8) find the customer who spent the most on orders:
  
  select *
  from customers;
  
  select *
  from orders;
  
  select Name as name_customer,
  sum(Total_Amount) as total_money_spent
  from customers as c
  Join orders as o
  on c.customer_ID = o.Customer_ID
  group by Name
  order by total_money_spent desc
  limit 1
  ;
  
  -- 9) Calculate the stock remaining after fulfilling all orders:
  
  select  *
  from books
  ;
  
  select *
  from orders;
  
  select b.Book_ID, 
  