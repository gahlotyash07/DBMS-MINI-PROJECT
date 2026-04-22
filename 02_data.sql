USE ITHelpdeskDB;

-- =================================================================================
-- 2. INSERT SAMPLE DATA
-- =================================================================================

-- Insert sample Users
INSERT INTO users (first_name, last_name, email, department) VALUES
('John', 'Doe', 'john.doe@company.com', 'Marketing'),
('Jane', 'Smith', 'jane.smith@company.com', 'HR'),
('Alice', 'Johnson', 'alice.j@company.com', 'Engineering'),
('Bob', 'Williams', 'bob.w@company.com', 'Sales'),
('Charlie', 'Brown', 'charlie.b@company.com', 'IT Support');

-- Insert sample Assets
INSERT INTO assets (asset_name, asset_type, purchase_date, assigned_to) VALUES
('Dell XPS 15', 'Laptop', '2023-01-15', 1), -- Assigned to John
('MacBook Pro M2', 'Laptop', '2023-05-20', 3), -- Assigned to Alice
('HP LaserJet Pro', 'Printer', '2022-11-10', NULL), -- Common Printer, unassigned
('ThinkPad T14', 'Laptop', '2023-08-05', 2), -- Assigned to Jane
('Dell UltraSharp 27', 'Monitor', '2023-02-28', 1); -- Assigned to John

-- Insert sample Tickets
INSERT INTO tickets (user_id, asset_id, issue_summary, status, priority) VALUES
(1, 1, 'Laptop battery draining too fast', 'Open', 'Medium'),
(3, 2, 'Keyboard keys sticking', 'In Progress', 'High'),
(2, 3, 'Printer paper jam in HR lobby', 'Resolved', 'Low'),
(4, NULL, 'Cannot access the sales portal CRM', 'Open', 'Critical'),
(1, 5, 'Monitor displaying weird colors', 'In Progress', 'Low');

-- Insert sample Ticket Updates
INSERT INTO ticket_updates (ticket_id, update_description, updated_by) VALUES
(2, 'Ordered replacement keyboard module from Apple.', 5),
(3, 'Cleared the paper jam and tested printing.', 5),
(5, 'Requested user to check HDMI cable connection.', 5),
(2, 'Keyboard replaced, waiting for user confirmation.', 5),
(1, 'Diagnosed battery health, running at 40% capacity.', 5);
