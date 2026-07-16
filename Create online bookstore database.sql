-- Create Database

Create database onlinebookstore;

Use onlinebookstore;

-- create Tables 

DROP TABLE if exists Books;
Create Table Books ( 
Book_ID Serial Primary Key Not Null, 
Title varchar(100) Not Null,
Author varchar(100) Not Null,
Genre varchar(50) Not Null,
Published_year int Not Null,
price numeric(10,2) Not Null,
Stock INT Not Null)
;

-- Import Data into books table 

Show Tables;

Describe Books;

select *
from books;

USE onlinebookstore;

-- Create table for customers

Drop Table If exists customeers;
create table customers (
customer_ID Serial Primary Key Not Null,
Name varchar(100),
Email varchar(100),
Phone varchar(15),
City varchar(50),
Country varchar(150) )
;

show tables;

describe customers;

select *
from customers;

-- create orders table

Use onlinebookstore;

drop table if exists orders;

Create table Orders (
Order_ID Serial Primary Key Not NUll,
Customer_ID Int references Customers(Customer_ID),
Book_ID int references Books(book_ID), 
Order_date Date Not Null, 
Quantity Int Not Null,
Total_Amount Numeric(10, 2) )
;

show tables;

Describe orders;

select *
from orders;

SELECT * FROM Books;