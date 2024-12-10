<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verification Code</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 1rem;
            color: #6a11cb;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }
        input[type="text"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1rem;
        }
        .error {
            color: red;
            font-size: 0.875rem;
            margin-bottom: 1rem;
        }
        button {
            background: #6a11cb;
            color: #fff;
            padding: 0.75rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
            font-weight: bold;
            transition: background 0.3s ease;
            margin-bottom: 1rem;
        }
        button:hover {
            background: #2575fc;
        }
        .link {
            text-align: center;
            margin-top: 1rem;
        }
        .link a {
            color: #6a11cb;
            text-decoration: none;
            font-size: 0.875rem;
        }
        .link a:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            margin-top: 1rem;
            font-size: 0.875rem;
            color: #666;
        }
    </style>
</head>
<body>
<%
    String error = (String) request.getAttribute("error");

%>
<div class="container">
    <h1>Verification Code</h1>
    <form action="/auth/verify/code" method="post">
        <label for="code">Verification Code:</label>
        <input type="text" name="code" id="code">
        <div class="error"><%= error != null ? error : "" %></div>
        <button type="submit">Verify</button>
    </form>
    <div class="/login.jsp">
        <a href="/auth/login">Back to Login</a>
    </div>
    <div class="footer">
        &copy; 2024 Pdp Academy. All rights reserved.
    </div>
</div>
</body>
</html>
