<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.repo.EmployeeRepo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Info</title>
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
  </style>
</head>
<body>

<%
  DecimalFormat df = new DecimalFormat("#,###.##");
  int employeeId = Integer.parseInt(request.getParameter("id"));
  EmployeeSalary employeeSalary = EmployeeRepo.findEmployeeById(employeeId);
  List<SalaryPayment> salaryPayments = EmployeeRepo.findPaymentsByEmployeeId(employeeId);
  boolean archive = employeeSalary.getSalary()==employeeSalary.getPaidSalary(employeeSalary.getId())
          && employeeSalary.getLeftSalary(employeeSalary.getId()) == 0;
%>

<div class="container">
  <div class="nav-buttons">
    <a href="/employees.jsp" class="btn">Back to Employee List</a>
  </div>

  <h2>Employee Info</h2>

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
    <tr>
      <td><%= employeeSalary.getFirstName() %></td>
      <td><%= employeeSalary.getLastName() %></td>
      <td><%= df.format(employeeSalary.getSalary()) %></td>
      <td><%= df.format(employeeSalary.getPaidSalary(employeeSalary.getId()))%></td>
      <td><%= df.format(employeeSalary.getLeftSalary(employeeSalary.getId())) %></td>
    </tr>
    </tbody>
  </table>
  <% if (!archive) { %>
  <h3>Salary Payments</h3>
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
      <td><%= payment.getPayDate() %></td>
      <td><%= df.format(payment.getAmount()) %></td>
      <td><%= payment.getPayType() %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <% } else { %>
  <a href="/archive.jsp" class="btn btn-dark btn-lg" role="button" style="text-align: center; display: inline-block;">All payments are complete. No further payments are required for this employee.</a>
  <% } %>

</div>

</body>
</html>
