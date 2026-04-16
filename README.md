# 📚 Online Book Store (PostgreSQL Project)

## 📌 Project Description

This project is an **Online Book Store database system** built using **PostgreSQL**. It manages books, customers, and orders, and includes both **basic and advanced SQL queries** for data retrieval and analysis.

---

## 🗂️ Database Structure

The project consists of **3 main tables**:

### 📘 1. Books

Stores information about books.

* Book_ID (Primary Key)
* Title
* Author
* Genre
* Published_Year
* Price
* Stock

---

### 👤 2. Customers

Stores customer details.

* Customer_ID (Primary Key)
* Name
* Email
* Phone
* City
* Country

---

### 🛒 3. Orders

Stores order information.

* Order_ID (Primary Key)
* Customer_ID (Foreign Key)
* Book_ID (Foreign Key)
* Order_Date
* Quantity
* Total_Amount

---

## 🔗 Relationships

* Each **order** is linked to a **customer**
* Each **order** is linked to a **book**

---

## ⚙️ SQL Operations

### ✔ Table Creation

* Books, Customers, and Orders tables created using `CREATE TABLE`

### ✔ Data Retrieval

* Basic queries using `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`

---

## 📊 Basic Queries Included

* Retrieve books by genre
* Find books after a certain year
* List customers by country
* Filter orders by date
* Calculate total stock
* Find most expensive book
* Find lowest stock book
* Calculate total revenue

---

## 📈 Advanced Queries Included

* Total books sold per genre
* Average price by genre
* Customers with multiple orders
* Most frequently ordered book
* Top 3 expensive books
* Total books sold by author
* Customers spending above a limit
* Highest spending customer
* Remaining stock after orders

---

## 🧠 Key Concepts Used

* Joins (INNER JOIN, LEFT JOIN)
* Aggregation (`SUM`, `AVG`, `COUNT`)
* Grouping (`GROUP BY`, `HAVING`)
* Filtering (`WHERE`)
* Sorting (`ORDER BY`)
* NULL handling (`COALESCE`)

---

## 🚀 How to Run

1. Open PostgreSQL (pgAdmin / psql)
2. Create a new database:

```sql
CREATE DATABASE bookstore;
```

3. Run the SQL script to:

* Create tables
* Execute queries

---

## 📌 Purpose of Project

* Practice SQL queries (basic to advanced)
* Understand relational database design
* Learn data analysis using SQL

---

## 👩‍💻 Author

Aisha Rajpar
