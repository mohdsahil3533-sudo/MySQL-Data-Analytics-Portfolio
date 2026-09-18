# 🍕 Pizza Hut Sales Analysis — SQL Project

## 📌 Project Overview

This project focuses on analyzing **Pizza Hut sales data using MySQL** to understand order patterns, pizza sales, revenue generation, customer demand, and category-wise performance.

The project uses SQL queries to extract meaningful business insights from multiple relational tables such as **orders, orders_details, pizzas, and pizza_types**.

The main objective is to demonstrate practical SQL skills through real-world business questions and sales analysis.

---

## 🎯 Business Objectives

The analysis aims to answer important business questions such as:

* How many total orders were placed?
* What is the total revenue generated from pizza sales?
* Which pizza has the highest price?
* Which pizza size is ordered most frequently?
* What are the top 5 most ordered pizza types?
* Which pizza category has the highest quantity ordered?
* During which hours are the most orders placed?
* How many pizza types are available in each category?
* What is the average number of pizzas ordered per day?
* Which pizza types generate the highest revenue?
* What percentage of total revenue does each pizza type contribute?
* How does cumulative revenue change over time?
* What are the top 3 revenue-generating pizzas within each category?

---

## 🗂️ Database Structure

The project uses the following main tables:

### 1. `orders`

Contains information about customer orders.

| Column       | Description                        |
| ------------ | ---------------------------------- |
| `order_id`   | Unique ID of the order             |
| `order_date` | Date on which the order was placed |
| `order_time` | Time at which the order was placed |

---

### 2. `orders_details`

Contains details about the pizzas included in each order.

| Column             | Description                 |
| ------------------ | --------------------------- |
| `order_details_id` | Unique ID for order details |
| `order_id`         | ID of the related order     |
| `pizz_id`          | ID of the pizza             |
| `quantity`         | Number of pizzas ordered    |

---

### 3. `pizzas`

Contains pizza-level information.

| Column          | Description          |
| --------------- | -------------------- |
| `pizza_id`      | Unique pizza ID      |
| `pizza_type_id` | ID of the pizza type |
| `size`          | Pizza size           |
| `price`         | Price of the pizza   |

---

### 4. `pizza_types`

Contains information about pizza names and categories.

| Column          | Description          |
| --------------- | -------------------- |
| `pizza_type_id` | Unique pizza type ID |
| `name`          | Name of the pizza    |
| `category`      | Pizza category       |

---

## 🔗 Table Relationships

The database follows a relational structure:

```text
orders
   |
   | order_id
   ↓
orders_details
   |
   | pizz_id
   ↓
pizzas
   |
   | pizza_type_id
   ↓
pizza_types
```

These relationships allow us to combine order information with pizza details, prices, names, and categories.

---

## 🛠️ Technologies Used

* **MySQL**
* SQL
* Aggregate Functions
* JOINs
* GROUP BY
* ORDER BY
* Subqueries
* Window Functions
* RANK()
* PARTITION BY

---

## 📊 SQL Concepts Demonstrated

### Aggregate Functions

The project uses:

```sql
COUNT()
SUM()
AVG()
ROUND()
```

These functions are used to calculate order counts, revenue, quantities, and averages.

### JOINs

Multiple tables are connected using:

```sql
INNER JOIN
```

This allows analysis across orders, pizza details, prices, names, and categories.

### GROUP BY

Used for grouping data such as:

* Pizza categories
* Pizza sizes
* Pizza types
* Order hours
* Order dates

### Window Functions

The project also demonstrates advanced SQL concepts such as:

```sql
SUM() OVER()
```

for cumulative revenue analysis and:

```sql
RANK() OVER(
    PARTITION BY ...
    ORDER BY ...
)
```

for finding the top-performing pizza types within each category.

---

## 🔍 Key Analysis Performed

### 1. Total Orders

Calculated the total number of orders placed using `COUNT()`.

### 2. Total Revenue

Calculated total pizza sales revenue using:

```text
Quantity × Pizza Price
```

### 3. Highest-Priced Pizza

Identified the pizza with the highest selling price.

### 4. Most Common Pizza Size

Analyzed order records by pizza size to identify the most frequently ordered size.

### 5. Top 5 Most Ordered Pizzas

Ranked pizza types based on total quantity ordered.

### 6. Category-Wise Pizza Sales

Calculated the total number of pizzas ordered from each category.

### 7. Hourly Order Distribution

Analyzed orders by hour of the day to identify ordering patterns and peak hours.

### 8. Pizza Category Distribution

Calculated the number of different pizza types available in each category.

### 9. Average Daily Pizza Orders

Calculated the average number of pizzas ordered per day.

### 10. Top Revenue-Generating Pizzas

Identified the top 3 pizza types based on total revenue.

### 11. Revenue Contribution

Calculated each pizza type's percentage contribution to total revenue.

### 12. Cumulative Revenue

Used SQL window functions to analyze cumulative revenue over time.

### 13. Top 3 Pizzas Within Each Category

Used `RANK()` and `PARTITION BY` to identify the top 3 revenue-generating pizza types within every pizza category.

---

## 📁 Project Structure

```text
Pizza-Hut-SQL-Analysis/
│
├── pizza_hut_analysis.sql
├── README.md
└── questions/
```

---

## 💡 Business Insights

This analysis can help a pizza business understand:

* Overall sales performance
* Revenue generation
* Popular pizza sizes
* Best-selling pizza types
* High-performing categories
* Peak ordering hours
* Daily order trends
* Revenue contribution by pizza
* Category-level performance
* Top-performing products within each category

These insights can support decisions related to **inventory planning, menu optimization, pricing, staffing, and promotional strategies**.

---

## 🚀 Learning Outcomes

Through this project, I practiced and strengthened my understanding of:

* Writing SQL queries
* Relational database concepts
* Joining multiple tables
* Data aggregation
* Sales and revenue analysis
* Business-oriented SQL problems
* Subqueries
* Window functions
* Ranking techniques
* Time-based analysis
* Translating business questions into SQL queries

---

## 👨‍💻 Author

**Mohd Sahil**

Aspiring Data Analyst | SQL | Python | Excel | Data Analytics

---

## ⭐ Conclusion

The Pizza Hut Sales Analysis project demonstrates how SQL can be used to transform raw transactional data into meaningful business insights.

It combines **basic SQL concepts with advanced techniques such as window functions and ranking**, making it a practical project for developing real-world Data Analytics skills.

