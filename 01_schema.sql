-- =================================================================================
-- IT Helpdesk Asset & Tickets Database System
-- B.Tech Internal Practical Project
-- =================================================================================

-- Create Database
CREATE DATABASE IF NOT EXISTS ITHelpdeskDB;
USE ITHelpdeskDB;

-- =================================================================================
-- 1. TABLE DEFINITIONS
-- =================================================================================

-- 1. Users Table (Employees raising tickets or handling them)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) NOT NULL
);

-- 2. Assets Table (Laptops, Printers, etc.)
CREATE TABLE assets (
    asset_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_name VARCHAR(100) NOT NULL,
    asset_type VARCHAR(50) NOT NULL, -- e.g., Laptop, Desktop, Printer, Monitor
    purchase_date DATE,
    assigned_to INT,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL
);

-- 3. Tickets Table (Issues raised by users)
CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    asset_id INT, -- Can be NULL if the issue is not related to a specific asset
    issue_summary VARCHAR(255) NOT NULL,
    status ENUM('Open', 'In Progress', 'Resolved', 'Closed') DEFAULT 'Open',
    priority ENUM('Low', 'Medium', 'High', 'Critical') DEFAULT 'Low',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (asset_id) REFERENCES assets(asset_id) ON DELETE SET NULL
);

-- 4. Ticket Updates Table (History of ticket progress)
CREATE TABLE ticket_updates (
    update_id INT AUTO_INCREMENT PRIMARY KEY,
    ticket_id INT NOT NULL,
    update_description TEXT NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_by INT, -- The user who made the update (e.g., IT staff)
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id) ON DELETE CASCADE,
    FOREIGN KEY (updated_by) REFERENCES users(user_id) ON DELETE SET NULL
);
