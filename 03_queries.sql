USE ITHelpdeskDB;

-- =================================================================================
-- 3. IMPORTANT QUERIES (FOR DEMONSTRATION)
-- =================================================================================

-- Q1. View all tickets with user and asset details (JOIN)
-- Useful for seeing a comprehensive overview of all active and past issues.
SELECT 
    t.ticket_id,
    CONCAT(u.first_name, ' ', u.last_name) AS raised_by,
    a.asset_name,
    t.issue_summary,
    t.status,
    t.priority,
    t.created_at
FROM tickets t
JOIN users u ON t.user_id = u.user_id
LEFT JOIN assets a ON t.asset_id = a.asset_id;

-- Q2. Filter tickets by priority (e.g., viewing Critical & High priority tickets)
-- Helps IT prioritize urgent issues.
SELECT 
    ticket_id, 
    issue_summary, 
    status, 
    priority 
FROM tickets
WHERE priority IN ('Critical', 'High')
ORDER BY FIELD(priority, 'Critical', 'High');

-- Q3. List assets assigned to specific users
-- Useful for asset tracking and auditing.
SELECT 
    a.asset_id,
    a.asset_name,
    a.asset_type,
    CONCAT(u.first_name, ' ', u.last_name) AS assigned_employee,
    u.department
FROM assets a
JOIN users u ON a.assigned_to = u.user_id;

-- Q4. Count tickets by status (GROUP BY)
-- Useful for generating a quick dashboard/summary of helpdesk workload.
SELECT 
    status, 
    COUNT(ticket_id) AS total_tickets
FROM tickets
GROUP BY status;

-- Q5. View ticket updates/history for a specific ticket (e.g., Ticket ID 2)
-- Shows the chronological progression of work done on a ticket.
SELECT 
    tu.ticket_id,
    t.issue_summary,
    tu.update_description,
    tu.updated_at,
    CONCAT(u.first_name, ' ', u.last_name) AS updated_by_staff
FROM ticket_updates tu
JOIN tickets t ON tu.ticket_id = t.ticket_id
JOIN users u ON tu.updated_by = u.user_id
WHERE tu.ticket_id = 2
ORDER BY tu.updated_at ASC;
