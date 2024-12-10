<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.repo.EmployeeRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Objects" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Archive</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }
    .container {
      width: 90%;
      margin: 20px auto;
      background: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .nav-buttons {
      margin-bottom: 20px;
    }
    .nav-buttons a {
      text-decoration: none;
      padding: 10px 15px;
      color: #fff;
      background-color: #333;
      border-radius: 3px;
      margin-right: 10px;
    }
    .nav-buttons a:hover {
      background-color: #555;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    th, td {
      padding: 10px;
      text-align: left;
      border: 1px solid #ddd;
    }
    th {
      background-color: #333;
      color: #fff;
    }
    tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tbody tr {
      margin-bottom: 10px;
      border-bottom: 2px solid #ddd;
    }
    tbody tr {
      border-bottom: 10px solid #f4f4f4;
    }
  </style>
</head>
<body>

<%
  List<EmployeeSalary> fullyPaidEmployees = EmployeeRepo.findFullyPaidEmployees();
  DecimalFormat df = new DecimalFormat("#,###.##");
%>

<div class="container">
  <div class="nav-buttons">
    <a href="/employees.jsp" class="btn">Back to Employee List</a>
  </div>

  <h2>Employee Archive - Fully Paid Employees</h2>

  <% if (fullyPaidEmployees.isEmpty()) { %>
  <p>No fully paid employees found.</p>
  <% } else { %>

  <table>
    <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Salary</th>
      <th>Paid</th>
      <th>Left</th>

    </tr>
    </thead>
    <tbody>
    <%
      for (EmployeeSalary salary : fullyPaidEmployees) {
        List<SalaryPayment> salaryPayments = EmployeeRepo.findPaymentsByEmployeeId(salary.getId());
    %>
    <tr>
      <td><%= salary.getFirstName() %></td>
      <td><%= salary.getLastName() %></td>
      <td><%= df.format(salary.getSalary()) %></td>
      <td><%= df.format(salary.getPaidSalary(salary.getId())) %></td>
      <td><%= df.format(salary.getLeftSalary(salary.getId())) %></td>
    </tr>

    <%

      if (salary.getLeftSalary(salary.getId()) == 0) {
    %>
    <tr>
      <td colspan="6">
        <h4>Payment History:</h4>
        <table>
          <thead>
          <tr>
            <th>Date</th>
            <th>Amount</th>
            <th>Pay Type</th>
          </tr>
          </thead>
          <tbody>
          <%
            for (SalaryPayment payment : salaryPayments) {
          %>
          <tr>
            <td><%= payment.getPayDate()%></td>
            <td><%= df.format(payment.getAmount()) %></td>
            <td><%= payment.getPayType() %></td>
          </tr>
          <%
            }
          %>
          </tbody>
        </table>
      </td>
    </tr>
    <%
      }
    %>

    <% } %>
    </tbody>
  </table>
  <% } %>
  <tr>
    <td colspan="5" style="background-color: #f4f4f4; height: 10px;"></td>
  </tr>
</div>

</body>
</html>
