# PostgreSQL Assignment 07

This folder contains SQL scripts and queries designed to solve various database-related problems using PostgreSQL. The focus is on practical database operations such as creating tables, inserting data, updating records, and performing complex queries.

## Overview

The main objective of this assignment is to work with a PostgreSQL database to solve real-world problems. The examples provided include creating and managing tables, retrieving data, and performing calculations. Below is a summary of the problems addressed:

### Asking the PostgreSQL Question and answer in bangla ... 

1. **What is PostgreSQL?**  
  পোস্টগ্রেস হল একটি ওপেন সোর্স  রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম যা SQL stongly সাপোর্ট করে। কোন সিস্টেম এর বিগ ডাটা ম্যানেজ করতে বর্তমান সময় এ সব চাইতে জনপ্রিয় সফটওয়্যার যেটি অনেক পাওয়ারফুল ফীচার দিয়া থাকে যেমন - 
     - ১. ACID  কমপাইলান্স 
     - ২. অনেক জটিল কুয়ারিস সাপোর্ট করে যেমন ইনডেক্সিং 
     - ৩. কাস্টম ফাঙ্কশন, অপারেটর এবং ডাটা টাইপ সাপোর্ট দেয়াই 



2. **What is the purpose of a database schema in PostgreSQL?**  
   PostgreSQL স্কিমা হলো একটি লজিক্যাল কন্টেইনার যা ডাটাবেস অবজেক্ট এর মতো ব্যবহার করা হয় যেমন টেবিলস, ভিউ, ইন্ডেক্সেস ফাঙ্কশন এ ছাড়াও এটি ডাটাবেস কে অনেক অর্গানাইজেড করতে হেল্প করে, মাল্টিপল স্কিমা দিয়া সেপারেট ডাটা লজিক লিখা যায়।

3. **Explain the Primary Key and Foreign Key concepts in PostgreSQL.**  
   প্রাইমারি কী:  প্রাইমারি কী হলো একটি টেবিলের এক বা একাধিক কলামের একটি সেট যা টেবিলের প্রতিটি সারিকে (row) আলাদা আলাদা ভাবে  চিহ্নিত করে। এটিকে টেবিলের "পরিচয়পত্র" হিসেবে ধরা যেতে পারে।
      - একটি টেবিলের সারিগুলোকে ইউনিকলি  চিহ্নিত করে 
      - এবং ডেটা ইন্টিগ্রিটি বজায় রাখে।
 
   ফরেন কী: ফরেন কী হলো একটি টেবিলের এক বা একাধিক কলাম যা অন্য টেবিলের প্রাইমারি কী-এর মানকে নির্দেশ করে।  ফরেন কী একটি টেবিলের ডেটাকে অন্য টেবিলের ডেটার সাথে লিঙ্ক করতে ব্যবহৃত হয়।
      - দুটি টেবিলের মধ্যে সম্পর্ক স্থাপন করে 
      - এবং রেফারেনশিয়াল ইন্টিগ্রিটি নিশ্চিত করে।

এই দুটি ধারণা PostgreSQL এ ডেটা ব্যবস্থাপনার জন্য অত্যন্ত গুরুত্বপূর্ণ।

4. **What is the difference between the VARCHAR and CHAR data types?**  
   CHAR: এটি একটি নির্দিষ্ট দৈর্ঘ্যের (ফিক্সড-লেন্থ) ডেটা টাইপ। যখন আমার CHAR(10) বলে দেই  তখন এটি সবসময় ১০টি অক্ষরের জন্যই জায়গা ধরে রাখে। যদি কম অক্ষর দিলেও বাকি জায়গা স্পেস দিয়ে পূরণ করবে।

   VARCHAR: এটি পরিবর্তনশীল দৈর্ঘ্যের (ভেরিয়েবল-লেন্থ) ডেটা টাইপ।  যখন VARCHAR(50) ব্যবহার করা হয় তখন এটি সর্বোচ্চ ৫০টি অক্ষর পর্যন্ত ধারণ করতে পারে।  যতগুলো অক্ষর আছে , ঠিক ততটুকুই জায়গা ব্যবহার করবে (কিছু    অতিরিক্ত সামান্য স্থান লাগে)।

5. **List all customers who have placed more than one order**  
   Query to identify customers with more than one order.

6. **Explain the purpose of the WHERE clause in a SELECT statement.**  
   SELECT স্টেটমেন্টে WHERE ক্লজের মূল উদ্দেশ্য হলো নির্দিষ্ট কিছু কন্ডিশনের ভিত্তিতে ডেটা ফিল্টার করা। সহজ ভাষায় বলতে গেলে, WHERE ক্লজ ব্যবহার করে আমরা  ডাটাবেজের টেবিল থেকে শুধুমাত্র সেই সারিগুলো (rows) রিট্রিভ করতে পারি যেগুলি আমাদের  দেওয়া শর্ত পূরণ করে।

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
