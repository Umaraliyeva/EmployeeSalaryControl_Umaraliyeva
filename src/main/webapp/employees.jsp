<%@ page import="com.example.umaraliyevaemployeesalarycontrol.repo.EmployeeRepo" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Salary Control</title>
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
    .btn {
      text-decoration: none;
      padding: 5px 10px;
      border-radius: 3px;
      color: #fff;
      font-size: 14px;
    }
    .btn-success {
      background-color: #28a745;
    }
    .btn-success:hover {
      background-color: #218838;
    }
    .btn-info {
      background-color: #17a2b8;
    }
    .btn-info:hover {
      background-color: #117a8b;
    }
  </style>
</head>
<body>
<%
  List<EmployeeSalary> employeeSalary=EmployeeRepo.allEmployees();
  DecimalFormat df = new DecimalFormat("#,###.##");
%>
<div class="container">

  <div class="nav-buttons">
    <a href="/addEmployee.jsp" class="btn">Add Employee</a>
    <a href="/report.jsp" class="btn">Report</a>
  </div>


  <table>
    <thead>
    <tr>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Salary</th>
      <th>Paid</th>
      <th>Left</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (EmployeeSalary salary : employeeSalary) {
    %>
    <tr>
      <td><%=salary.getFirstName()%></td>
      <td><%=salary.getLastName()%></td>
      <td><%= df.format(salary.getSalary()) %></td>
      <td><%= df.format(salary.getPaidSalary(salary.getId())) %></td>
      <td><%= df.format(salary.getLeftSalary(salary.getId())) %></td>
      <td>
        <a href="/addPayment.jsp?id=<%=salary.getId()%>" class="btn btn-success">+Payment</a>
        <a href="/infoPage.jsp?id=<%=salary.getId()%>" class="btn btn-info">Info</a>
      </td>
    </tr>

  <%
    }
  %>
    </tbody>
  </table>
</div>
</body>
</html>
