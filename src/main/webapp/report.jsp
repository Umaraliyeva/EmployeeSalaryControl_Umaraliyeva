<%@ page import="com.example.umaraliyevaemployeesalarycontrol.repo.EmployeeRepo" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.SalaryPayment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.entity.EmployeeSalary" %>
<%@ page import="com.example.umaraliyevaemployeesalarycontrol.repo.SalaryPaymentRepo" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Salary Payment Report</title>
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
    List<EmployeeSalary> employeeSalaries = EmployeeRepo.allEmployees();
    DecimalFormat df = new DecimalFormat("#,###.##");

%>

<div class="container">

    <div class="nav-buttons">
        <a href="/employees.jsp" class="btn">Back to Dashboard</a>
    </div>

    <h2>Employee Salary Payments Report</h2>
    <table>
        <thead>
        <tr>
            <th>Employee First Name</th>
            <th>Employee Last Name</th>
            <th>Cash Total</th>
            <th>Card Total</th>
            <th>Bank Total</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (EmployeeSalary employee : employeeSalaries) {
                List<SalaryPayment> employeePayments = SalaryPaymentRepo.getPaymentsForEmployee(employee.getId());
                double cashTotal = employeePayments.stream()
                        .filter(payment -> "cash".equalsIgnoreCase(payment.getPayType()))
                        .mapToDouble(SalaryPayment::getAmount)
                        .sum();

                double cardTotal = employeePayments.stream()
                        .filter(payment -> "card".equalsIgnoreCase(payment.getPayType()))
                        .mapToDouble(SalaryPayment::getAmount)
                        .sum();

                double bankTotal = employeePayments.stream()
                        .filter(payment -> "bank".equalsIgnoreCase(payment.getPayType()))
                        .mapToDouble(SalaryPayment::getAmount)
                        .sum();
        %>
        <tr>
            <td><%= employee.getFirstName() %></td>
            <td><%= employee.getLastName() %></td>
            <td><%=df.format( cashTotal) %></td>
            <td><%= df.format(cardTotal )%></td>
            <td><%= df.format(bankTotal) %></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

</body>
</html>
