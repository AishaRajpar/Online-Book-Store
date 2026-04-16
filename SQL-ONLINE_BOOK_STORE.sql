-----------online books store----------


--------create tables----------
-------books-------
create table Books(
Book_ID serial primary key,	
Title varchar(100),
Author varchar(100),
Genre varchar(50),	
Published_Year int,
Price numeric(10,2),
Stock int
);
Drop table books;


----------customers----------
create table Customers(
Customer_ID serial primary key,
Name varchar(100),
Email varchar(100),
Phone varchar(15),
City varchar(50),
Country varchar(150)
);
DROP TABLE customers;




-------------orders---------
create table Orders(
Order_ID serial primary key,
Customer_ID int,
foreign key (Customer_id) REFERENCES Customers(Customer_id),
Book_ID int,
FOREIGN KEY (Book_id) references Books(Book_id),
Order_Date date,
Quantity int,
Total_Amount numeric(10,2)
);


------select------
SELECT *FROM Books;
SELECT *FROM Customers;
SELECT *FROM Orders;

--------------BASIC QUESTOIONS------------------

---------1) Retrieve all books in the "Fiction" genre:
SELECT * FROM Books where genre='Fiction';


---------2) Find books published after the year 1950:
SELECT * FROM Books where published_year >1950;


--------- 3) List all customers from the Canada:
SELECT * FROM Customers where country ='Canada';


----------- 4) Show orders placed in November 2023:
SELECT * FROM Orders where order_date BETWEEN '2023-11-01' AND '2023-11-30';-


---------- 5) Retrieve the total stock of books available:
SELECT SUM(stock) as total_stock 
from books;


------------6) Find the details of the most expensive book:
SELECT * FROM Books order by price desc limit 1;


-----------7) Show all customers who ordered more than 1 quantity of a book:
SELECT * FROM Orders where quantity>1; 


----------8) Retrieve all orders where the total amount exceeds $20:
SELECT * FROM orders where total_amount>20;


--------- 9) List all genres available in the Books table:
SELECT distinct genre from Books;


----------- 10) Find the book with the lowest stock:
SELECT * FROM Books order by stock asc limit 1;


----------- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) as Total_revenue from orders;



----------------ADVANCED QUESTIONS------------------


------------ 1) Retrieve the total number of books sold for each genre:
SELECT b.genre , SUM(o.quantity)
FROM
Orders as o
JOIN 
books as b
on o.book_id=b.book_id
GROUP BY b.genre;

------------ 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) as avg_price from books where genre='Fantasy' ;




------------- 3) List customers who have placed at least 2 orders:
SELECT customer_id ,count(order_id )as total_orders
FROM orders
GROUP BY customer_id
having count(order_id) >=2;

-- 4) Find the most frequently ordered book:
SELECT o.book_id,b.title,count(order_id) as frequently_ordered_book
from orders as o
join books as b
on o.book_id=b.book_id
group by o.book_id,title
order by frequently_ordered_book desc limit 1;



------------ 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books
where genre='Fantasy' 
order by price desc limit 3 ;



-----------------6) Retrieve the total quantity of books sold by each author:
select b.author ,SUM(o.quantity) AS total_boo_solds
from orders o
join books as b
on o.book_id=b.book_id
group by b.author;

--------------- 7) List the cities where customers who spent over $30 are located:
select distinct c.city,o.total_amount
from orders as o
join customers as c 
on o.customer_id=c.customer_id
where o.total_amount >30;


-------------------- 8) Find the customer who spent the most on orders:
select c.customer_id,c.name,sum(o.total_amount) AS total_spend
from orders as o
join customers as c
on o.customer_id=c.customer_id
group by
c.customer_id,c.name
order by total_spend desc limit 1;


-----------------9) Calculate the stock remaining after fulfilling all orders:
SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;








