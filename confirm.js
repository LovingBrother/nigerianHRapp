async function showEmployeePayroll(employeeId, periodStart, periodEnd) {
    // Get the employee information.
    const employeeInfo = await fetch(`/api/employee/${employeeId}`);
    const employee = await employeeInfo.json();
  
    // Calculate the total salary for the specified period.
    const payrollData = await fetch(`/api/payroll?employee_id=${employeeId}&period_start=${periodStart}&period_end=${periodEnd}`);
    const payroll = await payrollData.json();
  
    // Combine the employee information and total salary.
    const result = {
      id: employee.id,
      first_name: employee.first_name,
      last_name: employee.last_name,
      total_salary: payroll.reduce((total, pay) => total + pay.salary, 0),
    };
  
    return result;
  }
  