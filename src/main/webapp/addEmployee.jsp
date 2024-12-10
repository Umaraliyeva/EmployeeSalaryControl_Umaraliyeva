<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Employee</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2 class="mb-4 text-center">Add Employee</h2>
  <form action="/add/employee" method="post" class="border p-4 rounded bg-light shadow-sm">

    <div class="form-group">
      <label for="firstName">First Name</label>
      <input type="text" name="firstName" id="firstName" class="form-control" placeholder="Enter first name" required>
    </div>


    <div class="form-group">
      <label for="lastName">Last Name</label>
      <input type="text" name="lastName" id="lastName" class="form-control" placeholder="Enter last name" required>
    </div>


    <div class="form-group">
      <label for="salaryAmount">Salary Amount</label>
      <input type="number" name="salaryAmount" id="salaryAmount" class="form-control" placeholder="Enter salary amount" required>
    </div>


    <button type="submit" class="btn btn-success btn-block">Add Employee</button>
    <a href="/employees.jsp" class="btn btn-secondary btn-block">Cancel</a>
  </form>
</div>

<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
