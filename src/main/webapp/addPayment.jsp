<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Payment</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2 class="mb-4 text-center">Add Payment</h2>

  <%
    int id = Integer.parseInt(request.getParameter("id"));
  %>

  <form action="/add/payment" method="post" class="border p-4 rounded bg-light shadow-sm">
    <div class="form-group">
      <input type="hidden" name="id" value="<%=id%>">
      <label for="amount">Payment Amount</label>
      <input type="text" name="amount" id="amount" class="form-control" placeholder="Enter payment amount" required>
    </div>

    <div class="form-group">
      <label for="payType">Payment Type</label>
      <select name="payType" id="payType" class="form-control" required>
        <option value="" disabled selected>Select payment type</option>
        <option value="cash">Cash</option>
        <option value="bank">Bank</option>
        <option value="card">Card</option>
      </select>
    </div>

    <button type="submit" class="btn btn-primary btn-block">Submit Payment</button>
    <a href="/employees.jsp" class="btn btn-secondary btn-block">Cancel</a>
  </form>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
