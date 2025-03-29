# PostgreSQL Assignment 07

This folder contains SQL scripts and queries designed to solve various database-related problems using PostgreSQL. The focus is on practical database operations such as creating tables, inserting data, updating records, and performing complex queries.

## Overview

The main objective of this assignment is to work with a PostgreSQL database to solve real-world problems. The examples provided include creating and managing tables, retrieving data, and performing calculations. Below is a summary of the problems addressed:

### Problems Solved

1. **Find books that are out of stock**  
   Query to retrieve all books where the stock is zero.

2. **Retrieve the most expensive book in the store**  
   Query to find the book with the highest price.

3. **Find the total number of orders placed by each customer**  
   Query to calculate the total orders for each customer using a join between `customers` and `orders`.

4. **Calculate the total revenue generated from book sales**  
   Query to compute the total revenue by multiplying book prices with order quantities.

5. **List all customers who have placed more than one order**  
   Query to identify customers with more than one order.

6. **Find the average price of books in the store**  
   Query to calculate the average price of all books.

7. **Increase the price of all books published before 2000 by 10%**  
   Query to update the price of books published before the year 2000.

8. **Delete customers who haven't placed any orders**  
   Query to remove customers who do not have any associated orders.

### Example SQL Operations

Below is an example of the SQL operations performed in this assignment:

```sql
-- Create a table for books
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) CHECK (price >= 0),
    stock INT CHECK (stock >= 0),
    published_year INT
);

-- Insert sample data into the books table
INSERT INTO books (id, title, author, price, stock, published_year) 
VALUES 
(1, 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
(2, 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
(3, 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
(4, 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
(5, 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

-- Example query: Find books that are out of stock
SELECT * FROM books
WHERE stock = 0;
```

### How to Use

1. Set up a PostgreSQL database and connect to it.
2. Run the provided SQL scripts to create tables and insert sample data.
3. Execute the queries to solve the problems listed above.
4. Modify the queries as needed to adapt to your specific database schema.

### Prerequisites

- PostgreSQL installed on your system.
- Basic understanding of SQL syntax and database operations.

### Notes

- The provided SQL scripts are examples and may need adjustments based on your database setup.
- Ensure that the database schema matches the structure used in the queries.

Happy querying!
