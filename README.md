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

5. **LWhat are the LIMIT and OFFSET clauses used for?**  
   LIMIT এবং OFFSET ক্লজ দুটি SELECT স্টেটমেন্টের সাথে ব্যবহার করা হয় যা  ডাটাবেস থেকে ডাটা রিট্রিভ করতে row/সারিগুলোর সংখ্যা নিয়ন্ত্রণ করা যায়। বিশেষ করে, যখন আমাদের কে  একটি বড় ডেটাসেট থেকে ডেটা রিট্রিভ করতে হয় তখন একসাথে সমস্ত ডেটা দেখতে  চাই না , তখন এই ক্লজ দুটি খুবই গুরুত্বপূর্ণ ভূমিকা রাখে।

   লিমিট আসলে প্রতি কল এ কতটি ডাটা দেখবো টা  সেট করে দেয়, অন্য দিকে আফসেট কতটি ডাটা স্কিপ করে কোন ডাটা দেখবো তার লজিক লিখতে হেল্প করে।

6. **Explain the purpose of the WHERE clause in a SELECT statement.**  
   SELECT স্টেটমেন্টে WHERE ক্লজের মূল উদ্দেশ্য হলো নির্দিষ্ট কিছু কন্ডিশনের ভিত্তিতে ডেটা ফিল্টার করা। সহজ ভাষায় বলতে গেলে, WHERE ক্লজ ব্যবহার করে আমরা  ডাটাবেজের টেবিল থেকে শুধুমাত্র সেই সারিগুলো (rows) রিট্রিভ করতে পারি যেগুলি আমাদের  দেওয়া শর্ত পূরণ করে।

7. **How can you modify data using UPDATE statements?**  
  UPDATE স্টেটমেন্ট ব্যবহার করে টেবিলের ভিতরে  ডেটা পরিবর্তন করা যায়। SET ক্লজে কোন কলামের মান পরিবর্তন করতে চাই  তা উল্লেখ করতে হয় এবং WHERE ক্লজে কোন সারিগুলোর ডেটা পরিবর্তন করতে চাই তার শর্ত দেওয়া হয়।
 ```sql
   UPDATE customers
   SET email = 'jane.new@example.com'
   WHERE customer_id = 2;
   ```

8. **What is the significance of the JOIN operation, and how does it work in PostgreSQL?**  
   JOIN অপারেশন একাধিক টেবিলের মধ্যে সম্পর্ক স্থাপন করে এবং সেই সম্পর্ক অনুযায়ী ডেটা একত্রিত করে একটি সমন্বিত ফলাফল তৈরি করে। যখন প্রয়োজনীয় তথ্য একাধিক টেবিলে বিভক্ত থাকে, তখন JOIN ব্যবহার করে সেই তথ্যকে একসাথে আনা হয় এবং ঐ ডাটা গুলো রিডেবল করে প্রেসেন্ট করা হয়।

   PostgreSQL-এ JOIN বিভিন্ন প্রকারের হয় (যেমন: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN)। প্রতিটি  JOIN দুটি টেবিলের সারিগুলোকে নির্দিষ্ট শর্তের ভিত্তিতে মিলিয়ে নতুন একটি ভার্চুয়াল টেবিল তৈরি করে। ON ক্লজে সেই শর্তটি উল্লেখ করা হয় যার উপর ভিত্তি করে সারিগুলো মেলানো হয় (সাধারণত একটি টেবিলের ফরেন কী এবং অন্য টেবিলের প্রাইমারি কী)।  কোন টেবিলের কোন সারিগুলো অন্তর্ভুক্ত হবে, তা ব্যবহৃত JOIN-এর প্রকারের উপর নির্ভর করে।

   ```sql
   -- Create a table for joining together
         SELECT o.id, c.name, b.title
         FROM orders o
         JOIN customers c ON o.customer_id = c.id
         JOIN books b ON o.book_id = b.id;
   ```

9. **Explain the GROUP BY clause and its role in aggregation operations.**  
      GROUP BY ক্লজ SELECT স্টেটমেন্টের একটি গুরুত্বপূর্ণ অংশ যা একই মানযুক্ত সারিগুলোকে একটি বা একাধিক কলামের ভিত্তিতে গ্রুপ  করে। এর প্রধান ভূমিকা হলো  সেম  গ্রুপ এর  ডেটার উপর অ্যাগ্রিগেশন ফাংশন (যেমন COUNT, SUM, AVG, MIN, MAX) প্রয়োগ করা এবং প্রতিটি গ্রুপের জন্য একটি রিলেভেন্ট  রেজাল্ট  তৈরি করা।

      গ্রুপিং (Grouping): GROUP BY ক্লজে উল্লেখিত কলামগুলির মানের ভিত্তিতে টেবিলের সারিগুলোকে বিভিন্ন গ্রুপে ভাগ করা হয়। যদি একাধিক কলাম উল্লেখ করা হয়, তবে সারিগুলো কলামগুলোর মানের প্রতিটি ইউনিক কম্বিনেশন এর  ভিত্তিতে একত্রিত করে।

      অ্যাগ্রিগেশন (Aggregation): GROUP BY ক্লজের সাথে সাধারণত এক বা একাধিক অ্যাগ্রিগেশন ফাংশন ব্যবহৃত হয়। 

10. **What is the significance of the JOIN operation, and how does it work in PostgreSQL?**  
   PostgreSQL-এ COUNT(), SUM(), এবং AVG() এর মতো অ্যাগ্রিগেট ফাংশন ব্যবহার করে ডেটা গণনা, যোগফল এবং গড় বের করা যায়। নিচে এদের ব্যবহারের নিয়ম এবং উদাহরণ দেওয়া হলো - 
```sql 
-- Total number of books
SELECT COUNT(*) FROM books;

-- Total price of all books
SELECT SUM(price) FROM books;

-- Average price of books
SELECT AVG(price) FROM books;
```



### Prerequisites

- PostgreSQL installed on your system.
- Basic understanding of SQL syntax and database operations.

### Notes

- The provided SQL scripts are examples and may need adjustments based on your database setup.
- Ensure that the database schema matches the structure used in the queries.

Happy querying!
