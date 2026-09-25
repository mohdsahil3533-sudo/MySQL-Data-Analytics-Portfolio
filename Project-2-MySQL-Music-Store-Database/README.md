# 🎵 Music Store SQL Analysis

## 📌 Project Overview

This project is a **SQL-based data analysis project** built using a Music Store database.

The objective of this project is to analyze **customer purchases, invoices, employees, music genres, artists, tracks, and sales performance** using **MySQL**.

The project demonstrates how SQL can be used to solve **real-world business questions** and extract meaningful insights from relational data. 📊

---

## 🛠️ Tools & Technologies

* 🐬 **MySQL**
* 💻 SQL
* 🔗 JOINs
* 📊 Aggregate Functions
* 🔍 Subqueries
* 🧩 Common Table Expressions (CTEs)
* 📈 Window Functions
* 🗂️ GROUP BY
* ↕️ ORDER BY
* 🎯 Filtering & Sorting

---

## 🗄️ Database Schema

The analysis uses the following tables:

* 👨‍💼 `employee`
* 👤 `customer`
* 🧾 `invoice`
* 🛒 `invoice_line`
* 🎵 `track`
* 💿 `album`
* 🎤 `artist`
* 🎼 `genre`

### 🔗 Relationship Flow

```text
👤 Customer
     ↓
🧾 Invoice
     ↓
🛒 Invoice Line
     ↓
🎵 Track
     ↓
💿 Album
     ↓
🎤 Artist
     ↓
🎼 Genre
```

---

## ❓ Business Questions Answered

### 👨‍💼 Q1. Who is the senior-most employee based on job title?

Identified the employee with the highest level in the organization.

### 🌍 Q2. Which countries have the most invoices?

Calculated the total number of invoices generated from each country.

### 💰 Q3. What are the top 3 invoice values?

Identified the three highest invoice amounts.

### 🏙️ Q4. Which city has the best customers?

Found the city that generated the highest total revenue.

### 🏆 Q5. Who is the best customer?

Identified the customer who spent the most money in the store.

### 🎸 Q6. Who are the Rock music listeners?

Retrieved customers who purchased Rock music and sorted them alphabetically by email.

### 🎤 Q7. Which are the top 10 Rock artists?

Identified the top 10 artists based on the number of Rock songs they have.

### ⏱️ Q8. Which tracks are longer than the average song length?

Used a subquery to calculate the average track duration and identified tracks longer than the average.

### 💳 Q9. How much did each customer spend on each artist?

Calculated customer spending for individual artists using invoice line prices and quantities.

### 🌎 Q10. What is the most popular genre for each country?

Used a **CTE and Window Function (`ROW_NUMBER()`)** to identify the most purchased music genre in each country.

---

## 🧠 SQL Concepts Used

### 🔗 JOIN

Combined data from multiple related tables to perform meaningful analysis.

```sql
JOIN album
    ON album.album_id = track.album_id
```

### 📊 GROUP BY

Used to aggregate data by customer, country, city, artist, and genre.

### ➕ Aggregate Functions

Used functions such as:

* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`

### 🔍 Subquery

Used to compare individual track lengths against the overall average.

### 🧩 CTE

The `WITH` clause was used to create a temporary result set for genre analysis.

### 📈 Window Function

`ROW_NUMBER()` was used to rank genres within each country.

```sql
ROW_NUMBER() OVER (
    PARTITION BY customer.country
    ORDER BY SUM(invoice_line.quantity) DESC
)
```

---

## 🎯 Key Learning Outcomes

Through this project, I practiced:

* 📝 Writing complex SQL queries
* 🗄️ Working with relational databases
* 🔗 Understanding table relationships
* 💰 Performing sales and customer analysis
* 🔄 Using multiple-table JOINs
* 📊 Applying aggregate functions
* 🔍 Writing subqueries
* 🧩 Using CTEs
* 📈 Using window functions
* 🏅 Ranking data within groups
* 💼 Solving real-world business problems with SQL

---

## 🚀 How to Run the Project

### 1️⃣ Create the Database

```sql
CREATE DATABASE music_store;
```

### 2️⃣ Select the Database

```sql
USE music_store;
```

### 3️⃣ Import the Music Store Dataset

Import the required Music Store/Chinook tables into MySQL.

### 4️⃣ ▶️ Run the SQL Queries

Open:

```text
Music_Store_Analysis.sql
```

Execute the queries one by one or run the complete SQL script.

---

## 📌 Project Highlights

✨ Analyzed customer purchasing behavior
✨ Identified top customers and revenue-generating cities
✨ Analyzed Rock music listeners and artists
✨ Compared track lengths with average song duration
✨ Calculated customer spending by artist
✨ Identified the most popular genre across countries
✨ Applied advanced SQL concepts such as CTEs and Window Functions

---

## 🏁 Conclusion

This project helped me strengthen my **SQL and data analysis skills** by working with a relational Music Store database and solving practical business questions.

It demonstrates my understanding of:

**SQL | MySQL | Data Analysis | JOINs | Aggregation | Subqueries | CTEs | Window Functions | Business Analysis** 📊💻

---

## 👨‍💻 Author

### **Mohd Sahil**

🎯 Aspiring Data Analyst
🐬 MySQL | SQL
🐍 Python
📊 Excel | Data Analytics

---

## 🔖 Skills & Topics

`SQL` `MySQL` `DataAnalytics` `DataAnalysis` `DataAnalyst` `SQLProjects` `JOINs` `CTE` `WindowFunctions` `BusinessAnalysis`
