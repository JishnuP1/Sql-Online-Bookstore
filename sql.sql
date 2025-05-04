-- Create database as Online_bookstore
CREATE DATABASE Online_bookstore;
USE Online_bookstore;

-- Import data using Table Data Import Wizard

--  Retrieve All Data
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

-- 1) Retrieve all books in the "Fiction" Genre:
SELECT *FROM Books
WHERE Genre ='Fiction';

-- 2) Find books published after the year 1950:
SELECT * FROM Books
WHERE Published_year>1950;

-- 3) List all customer from the Canada:
SELECT * FROM Customers
WHERE Country ='Canada';

-- 4) Show orders placed in November 2023:
SELECT * FROM Orders
WHERE Order_Date BETWEEN'2023-11-01' AND '2023-11-30';

-- 5) Retrieve the total stock of book available:
SELECT SUM(Stock) AS total_stock
From Books;

-- 6) Find the details of the most expensive book:
SELECT * FROM Books
ORDER BY Price DESC LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of books:
SELECT * FROM Orders
WHERE Quantity>1;

-- 8) Retrieve all ordews where the total amount wxceeds $20:
SELECT * FROM Orders
WHERE Total_Amount>20;

-- 9) List all genre available in the bookstore:
SELECT DISTINCT Genre From Books;

-- 10) Find the book with lowest stock:
SELECT * From books
ORDER BY Stock;

-- 11) calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Total_Revenue 
FROM Orders;

-- 12) Retrieve the total number of books sold for each genre:
SELECT b.Genre, SUM(O.Quantity) AS Total_Sold
FROM Books b
JOIN Orders o ON b.Book_ID = o.Book_ID
GROUP BY b.Genre;

-- 13) Find the average price of books in the "Fantasy" genre:
SELECT Genre, AVG(Price) AS Average_Price
From Books 
WHERE Genre='Fantasy';


-- 14) List customers who have placed at least 2 orders:
SELECT c.Customer_ID, c.Name, COUNT(o.order_ID) AS Orders
FROM Customers c
JOIN Orders o ON c.Customer_ID=o.customer_ID
GROUP BY o.customer_ID, c.Name
HAVING COUNT(o.order_ID)>=2;

-- 15) Find the most frequently ordered book:
SELECT	b.Book_ID, b.Title, COUNT(o.Order_ID) as Order_Count 
FROM Books b
JOIN Orders o ON b.Book_ID=o.Book_ID
GROUP BY b.Book_ID, b.Title order by Order_Count DESC;

-- 16) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT Book_ID, title, Price
FROM Books
WHERE GENRE ='Fantasy'
ORDER BY Price DESC LIMIT 3;


-- 17) Retrieve the total quantity of books sold by each author:
SELECT b.Author, SUM(Quantity) AS Total_Quantity
From Books b
Join Orders o ON b.book_ID=o.Book_ID
Group BY b.Author ORDER BY Total_Quantity DESC;

-- 18) List the cities where customers who spent over $30 are located:
SELECT DISTINCT(c.City), o.Total_Amount
FROM Customers c
JOIN Orders o ON c.Customer_ID=o.Customer_ID
WHERE o.Total_Amount>30; 

-- 19) Find the customer who spent the most on orders:
SELECT c.Customer_ID, c.Name, ROUND(SUM(o.Total_Amount), 2) AS Total_Spend
FROM Customers c
JOIN Orders o ON c.Customer_ID=o.Customer_ID
GROUP BY c.Customer_ID, c.Name ORDER BY Total_Spend DESC LIMIT 1;

-- 20) Calculate the stock remaining after fulfilling all orders:
SELECT b.Book_ID, b.Title, b.stock, COALESCE(SUM(o.Quantity), 0) AS Order_Quantity,
b.Stock-COALESCE(SUM(o.Quantity), 0) AS Remaining_Quantity
From books b
LEFT JOIN orders o ON b.book_ID=o.Book_ID
GROUP BY b.Book_ID, b.Title, b.Stock;


SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


