CREATE VIEW employee_summary AS
SELECT
  employee.id,
  employee.first_name,
  employee.last_name,
  COUNT(leave.id) AS leaves,
  COUNT(attendance.id) AS absences
FROM employee
LEFT JOIN leave ON employee.id = leave.employee_id
LEFT JOIN attendance ON employee.id = attendance.employee_id
GROUP BY employee.id;