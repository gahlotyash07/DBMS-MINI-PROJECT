# DBMS-MINI-PROJECT
This project is a simple Database Management System for an IT Helpdesk that manages organizational assets and support tickets. It allows tracking of employees (users), assigned assets such as laptops and printers, and issues raised through support tickets. 

# IT Helpdesk Asset & Tickets Database System

A complete, terminal-based relational database management system built with MySQL. This project is designed for a B.Tech internal practical to demonstrate core SQL database concepts including schema design, normalization, foreign key constraints, and relational queries.

## Project Overview

This database manages IT Helpdesk operations, specifically tracking employee tickets and physical IT assets (laptops, monitors, printers). It keeps the data normalized up to 3NF and focuses on the essential tables required for such a system:

1. **`users`**: Employees who can raise tickets or staff who resolve them.
2. **`assets`**: Company hardware that can be assigned to users.
3. **`tickets`**: Issues raised by users, which can optionally be linked to a specific asset.
4. **`ticket_updates`**: A historical log tracking the progress and resolution of tickets.
   
## Repository Structure

The project has been divided into three separate SQL scripts for clarity and ease of execution:

*   **`01_schema.sql`**: Contains the DDL statements (`CREATE DATABASE`, `CREATE TABLE`) with all primary key and foreign key constraints.
*   **`02_data.sql`**: Contains the DML statements (`INSERT`) to populate the database with realistic sample data.
*   **`03_queries.sql`**: Contains essential demonstration queries (`SELECT`, `JOIN`, `GROUP BY`) to showcase database functionality.

## 🚀 How to Run

You can run this project directly in your MySQL Command Line Client or any GUI tool like MySQL Workbench.

### Using MySQL CLI:

1. Open your terminal or command prompt.
2. Log into your MySQL server:
   ```bash
   mysql -u root -p
   ```
3. Execute the scripts in order:
   ```sql
   source /path/to/your/folder/01_schema.sql;
   source /path/to/your/folder/02_data.sql;
   ```
4. Run the demo queries to see the outputs:
   ```sql
   source /path/to/your/folder/03_queries.sql;
   ```

*(Alternatively, you can just copy and paste the contents of the scripts into your SQL prompt or GUI client).*

## Demonstration Queries Included

The `03_queries.sql` script includes the following practical queries:
*   **Comprehensive View**: Uses `JOIN`s to link tickets with their raiser's name and the associated asset.
*   **Priority Filtering**: Uses `WHERE` to filter and sort tickets by urgency (`Critical` and `High`).
*   **Asset Auditing**: Lists all assets and the specific employees they are currently assigned to.
*   **Workload Dashboard**: Uses `GROUP BY` to count the total number of tickets in each status state (Open, In Progress, Resolved).
*   **Audit Trail**: Shows the chronological history of updates for a specific ticket.

## Built With

*   **MySQL** - Relational Database Management System
*   Standard SQL (DDL, DML, DQL)
