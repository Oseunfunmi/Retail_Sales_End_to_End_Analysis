# 🛒 Retail Sales Analysis & Customer Insights

![Power BI Dashboard](Sales%20Dashboard%20full.png)
*(Click to expand the dashboard view)*

## 📄 Project Overview
This project is an end-to-end data analysis solution designed to identify sales trends, top-performing products, and high-value customers. The goal was to transform raw sales records into an interactive dashboard that answers key business questions such as:
* What are the primary drivers of revenue?
* Which customers contribute the highest share of revenue (Pareto Principle)?
* How do sales channels (Online vs. In-store) compare?

**Key Metrics:**
* **Total Revenue:** $1.55M
* **Total Transactions:** ~12,000
* **Average Transaction Value:** $23

---

## 🛠 Tools & Technologies
* **Microsoft Excel:** Initial data inspection and discovery.
* **SQL Server (SSMS):** Data cleaning, normalization, and quality testing.
* **Power BI:** Data modeling, DAX calculations, and interactive visualization.

---

## 🔄 The Data Analysis Workflow

### 1. Data Understanding (Excel)
**Source:** `Sales project raw data.png`

The raw dataset consisted of transaction-level data. Key columns included:
* `Transaction ID` & `Customer ID`
* `Category` & `Item`
* `Price Per Unit` & `Quantity`
* `Payment Method` & `Location`

**Initial Findings:**
Upon initial inspection in Excel, the dataset was found to have inconsistent formatting in the "Discount Applied" column (containing `TRUE`, `FALSE`, and blank/null values) and required validation for duplicate entries.

### 2. Data Cleaning (SQL)
**Source:** `Sales query final.png`

Data was imported into SQL Server to ensure integrity before visualization.

**Step A: Handling Null Values**
The raw data contained `NULL` values in the `Discount_Applied` column. I standardized these to '0' to prevent calculation errors in Power BI.

```sql
-- Standardization of Discount Column
UPDATE retail_store_sales
SET Discount_Applied = 0
WHERE Discount_Applied is null;
```

**Step B: Data Quality Check**
 I ran a final validation query to ensure no critical fields contained nulls after the cleaning process.

```SQL
-- Final Quality Check
SELECT *
FROM retail_store_sales
WHERE Transaction_ID is null 
   OR Customer_ID is null 
   OR Total_Spent is null;
```

### 3. Visualization & Storytelling (Power BI)

Source: Sales Dashboard full.png

The cleaned data was imported into Power BI to build the final report.

Visuals Used:

KPI Cards: Displaying high-level metrics (Revenue, Transaction Count, Units Sold).

Line Chart: To visualize the Total Revenue Trend over time (2022-2025).

Bar Chart: Comparing Revenue by Category.

Donut Charts: To analyze the composition of Payment Methods and Sales Location.

Table Matrix: A "Top Customers" list ranked by total spend to identify VIP clients.

📊 Key Business Insights
1. Revenue Drivers
Top Categories: "Beverages" and "Computers & Electronics" are the highest performing categories.

Seasonality: The revenue trend shows distinct peaks, suggesting seasonal purchasing behavior that can be targeted with marketing campaigns.

2. Customer Behavior
The "Vital Few": A small number of customers drive a significant portion of revenue. For example, CUST_24 alone generated $68,452, highlighting the need for a VIP retention strategy.

Digital Dominance: Online sales account for 50.69% of transactions, slightly edging out in-store sales (49.31%).

3. Payment Preferences
Cash is still King (barely): While digital wallets are popular, a significant portion of the customer base still relies on Cash and Credit Cards, indicating the need to maintain diverse payment gateways.

💡 Recommendations
Based on the analysis, I recommend the following actions:

Invest in Online Channels: With online sales leading, the business should prioritize website UI/UX improvements and digital marketing.

Loyalty Program: Launch a tiered loyalty program specifically targeting the top 25 customers identified in the dashboard to protect that revenue stream.

Inventory Management: Increase stock levels for "Beverages" and "Butchers" categories to prevent stockouts during identified peak periods.

📬 Contact
Oluwaseun Michael Akinyemi

[LinkedIn: Oluwaseun Michael Akinyemi](linkedin.com/in/seunfunmimichaelanalyst)
