-- Active: 1743007262227@@127.0.0.1@5432@bookstore_db
--- all table creation starts here ---
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);

INSERT INTO books (id, title, author, price, stock, published_year) 
VALUES 
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    quantity INT CHECK (quantity > 0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO orders (id, customer_id, book_id, quantity, order_date) 
VALUES 
(1, 1, 2, 1, '2024-03-10'),
(2, 2, 1, 1, '2024-02-20'),
(3, 1, 3, 2, '2024-03-05');


SELECT * FROM orders
--DROP TABLE books;

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO customers (name, email) 
VALUES 
('John Doe', 'johndoe@example.com'),
('Jane Smith', 'janesmith@example.com'),
('Alice Johnson', 'alice@example.com'),
('Bob Brown', 'bob@example.com'),
('Charlie Davis', 'charlie@example.com');

SELECT * FROM customers

--- table created end here ---


SELECT * FROM books



--Problem-1: Find books that are out of stock.
SELECT * FROM books
WHERE  stock = 0

--Problem-2: Retrieve the most expensive book in the store.
SELECT * FROM books
ORDER BY price DESC
LIMIT 1

--Problem-3: Find the total number of orders placed by each customer.
SELECT customers.name, COUNT(orders.customer_id) AS total_orders
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name


--Problem-4:  Calculate the total revenue generated from book sales
SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM books
JOIN orders ON books.id = orders.book_id

--Problem-5: List all customers who have placed more than one order.
SELECT customers.name, COUNT(orders.customer_id) AS orders_count
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING COUNT(orders.customer_id) > 1

--Problem-6: Find the average price of books in the store.

SELECT round(avg(books.price), 2) AS avg_book_price
FROM books

--Problem-7: Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price * 1.10
WHERE published_year < 2000

--Problem-8: Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN (SELECT customer_id FROM orders)

