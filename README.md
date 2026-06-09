# 🚆 Railway Ticketing & Journey Analytics Data Warehouse

A comprehensive **Data Warehouse Proof of Concept (PoC)** for Railway Ticketing and Journey Analytics built using **SQL Server, SSIS, SSRS, Tableau, and Neo4j**. This project demonstrates the design and implementation of a star-schema data warehouse, ETL pipelines, business intelligence reporting, and graph database comparisons.

---

## 📌 Project Overview

Railway organizations generate massive volumes of transactional data from ticket sales, passenger journeys, payment methods, refunds, and station operations.

This project transforms raw railway data into a centralized **Data Warehouse** that enables:

- 📊 Business Intelligence Reporting
- 📈 Revenue & Sales Analytics
- 🚉 Journey Performance Monitoring
- 💳 Payment Trend Analysis
- 🔄 Refund Analysis
- 🧠 Data-driven Decision Making

The warehouse follows a **Star Schema** architecture for efficient analytical processing.

---

## 🏗️ Architecture

```
                +----------------+
                |  Date Dimension|
                +--------+-------+
                         |
+---------------+        |
| Station Dim   |--------|
+---------------+        |
                         |
+---------------+    +----------------------+
| Ticket Dim    |----| Fact Journey Table   |
+---------------+    +----------------------+
                         |
+---------------+        |
| Payment Dim   |--------|
+---------------+
```

---

## 🛠️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL Server Integration Services (SSIS)
- SQL Server Reporting Services (SSRS)
- Tableau
- Neo4j
- Cypher Query Language (CQL)
- SQL

---

## 📂 Data Warehouse Design

### Fact Table

- `DW_Fact_Journey1_`

Stores measurable business events:

- Ticket Price
- Journey Status
- Departure Time
- Arrival Time
- Actual Arrival Time
- Refund Request
- Foreign Keys to dimensions

### Dimension Tables

#### 📅 Date Dimension

- Full Date
- Day
- Month
- Year
- Day of Week

#### 🚉 Station Dimension

- Station Code
- Station Name
- Region
- Zone

#### 🎫 Ticket Dimension

- Ticket Type
- Ticket Class
- Railcard
- Discount Percentage

#### 💳 Payment Dimension

- Purchase Type
- Payment Method

---

## 🔄 ETL Pipeline (SSIS)

The ETL workflow performs:

### Extract

- Reads railway transaction data from source files/databases.

### Transform

- Data standardization
- Lookup transformations
- Surrogate key mapping
- Data validation

### Load

Loads processed data into:

- Date Dimension
- Station Dimension
- Ticket Dimension
- Payment Dimension
- Journey Fact Table

---

## 📊 SSRS Reports

Implemented reports include:

### 📋 Tabular Report

Top 50 Train Ticket Prices with journey details.

### 📑 Matrix Report

Revenue by:

- Ticket Class
- Payment Method

### ⚙️ Parameterized Report

Ticket Sales Summary by:

- Departure Station
- Journey Date

### 📉 Drill Down Report

Zone-wise Station Revenue Analysis.

---

## 📈 Tableau Dashboard

Interactive dashboard containing:

- 📅 Monthly Refund Request Trends
- 🚉 Popular Railway Routes
- 💰 Average Ticket Price Analysis
- 🥧 Journey Status Distribution
- ⏰ Ticket Sales by Hour

---

## 🔍 Business Insights

The warehouse enables analysis such as:

- Revenue by station
- Revenue by ticket class
- Payment method trends
- Customer purchasing behavior
- Refund patterns
- Journey punctuality
- Delay monitoring
- High-demand routes
- Seasonal travel trends

---

## 🔗 SQL vs Neo4j Comparison

The project compares relational databases with graph databases through equivalent queries.

### SQL Strengths

- Aggregations
- Reporting
- Indexed sorting
- Structured analytics

### Neo4j Strengths

- Relationship traversal
- Pattern matching
- Connected data exploration
- Graph analytics

Example queries include:

- Journey count by station
- First-class tickets
- Late arrivals
- Price > 50 tickets
- Station departure counts
- Journey details

---

## 📁 Project Structure

```
├── SQL/
│   ├── DataWarehouseSchema.sql
│   ├── ETLQueries.sql
│
├── SSIS/
│   ├── ETLPackage.dtsx
│
├── SSRS/
│   ├── TabularReport.rdl
│   ├── MatrixReport.rdl
│   ├── ParameterizedReport.rdl
│   └── DrillDownReport.rdl
│
├── Tableau/
│   ├── Dashboard.twb
│
├── Neo4j/
│   ├── CypherQueries.cql
│
├── README.md
```

---

## 🚀 Key Features

- ⭐ Star Schema Data Warehouse
- ⭐ Complete SSIS ETL Pipeline
- ⭐ SSRS Reporting Suite
- ⭐ Tableau Dashboard
- ⭐ SQL & Neo4j Query Comparison
- ⭐ Business Intelligence Ready
- ⭐ Scalable Analytical Architecture

---

## 📚 Future Enhancements

- Machine Learning-based demand forecasting
- Real-time analytics dashboard
- Predictive maintenance analytics
- Delay prediction models
- Automated anomaly detection
- Cloud deployment on Azure

---

## 📜 License

This project was developed for academic purposes as part of the **Data Storage Solutions for Data Analytics (B9DA111)** module at **Dublin Business School**.
