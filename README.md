# Online Food Delivery Management System

## Project Overview
The Online Food Delivery Management System is a relational database project designed to simulate the backend database of a food delivery platform.  
It manages customers, restaurants, menu items, delivery agents, orders, ordered items, and payments.

This project demonstrates:
- relational database design
- primary and foreign keys
- normalization
- joins
- aggregate functions
- subqueries
- analytical SQL queries

---

## Objectives
The system is designed to:

- Store customer details
- Manage restaurant information
- Maintain food menu items
- Track customer orders
- Assign delivery agents
- Record payment details
- Generate business reports

---

## Database Tables

### 1. Customers
Stores customer details.

| Column | Description |
|--------|-------------|
| customer_id | Unique customer ID |
| full_name | Customer name |
| email | Email address |
| phone | Contact number |
| address | Delivery address |

---

### 2. Restaurants
Stores restaurant information.

| Column | Description |
|--------|-------------|
| restaurant_id | Unique restaurant ID |
| restaurant_name | Restaurant name |
| cuisine_type | Type of cuisine |
| address | Restaurant location |
| contact_number | Contact number |

---

### 3. Delivery_Agents
Stores delivery staff details.

| Column | Description |
|--------|-------------|
| agent_id | Unique delivery agent ID |
| full_name | Agent name |
| phone | Contact number |
| vehicle_type | Delivery vehicle |
| status | Availability status |

---

### 4. Menu_Items
Stores menu items for restaurants.

| Column | Description |
|--------|-------------|
| item_id | Unique item ID |
| restaurant_id | Restaurant reference |
| item_name | Food item |
| description | Item details |
| price | Price |
| availability | Available or not |

---

### 5. Orders
Stores customer orders.

| Column | Description |
|--------|-------------|
| order_id | Unique order ID |
| customer_id | Customer reference |
| restaurant_id | Restaurant reference |
| agent_id | Delivery agent reference |
| order_date | Date and time |
| total_amount | Total bill |
| order_status | Current status |
| delivery_address | Delivery address |

---

### 6. Order_Items
Stores items inside each order.

| Column | Description |
|--------|-------------|
| order_item_id | Unique order item ID |
| order_id | Order reference |
| item_id | Menu item reference |
| quantity | Number of items |
| subtotal | Total for item |

---

### 7. Payments
Stores payment details.

| Column | Description |
|--------|-------------|
| payment_id | Unique payment ID |
| order_id | Order reference |
| payment_method | Payment type |
| payment_status | Payment result |
| payment_date | Date |

---

## Relationships

- One customer can place many orders
- One restaurant can have many menu items
- One delivery agent can deliver many orders
- One order can contain multiple menu items
- One order has one payment record

---

## SQL Concepts Used

This project uses:

- PRIMARY KEY
- FOREIGN KEY
- INNER JOIN
- LEFT JOIN
- GROUP BY
- HAVING
- ORDER BY
- SUBQUERY
- CASE
- Aggregate Functions

---

## Sample Business Use Cases

The database can answer:

- Which restaurant earns the highest revenue?
- Which customers order the most?
- Which menu items are most popular?
- Which delivery agents completed most deliveries?
- Which payments are still pending?

---

## relation diagram 
<img width="1066" height="800" alt="Screenshot 2026-04-24 000805" src="https://github.com/user-attachments/assets/92cc75b3-1e9b-48ef-b55e-0c3081922e1a" />


