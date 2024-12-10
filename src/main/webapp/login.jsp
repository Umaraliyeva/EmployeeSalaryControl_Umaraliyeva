<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        input[type="text"],
        input[type="password"] {
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
            margin-top: -0.5rem;
            margin-bottom: 1rem;
        }
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        button {
            background: #6a11cb;
            color: #fff;
            padding: 0.75rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #2575fc;
        }
        .remember {
            display: flex;
            align-items: center;
        }
        .remember input {
            margin-right: 0.5rem;
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
    Object object = request.getAttribute("errors");
    Map<String, String> errors = new HashMap<>();
    if (object != null) {
        errors = (Map<String, String>) object;
    }
%>
<div class="container">
    <h1>Login</h1>
    <form action="/auth/login" method="post">
        <label for="email">Email:</label>
        <input type="text" name="email" id="email">
        <div class="error"><%= Objects.requireNonNullElse(errors.get("email"), "") %></div>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password">
        <div class="error"><%= Objects.requireNonNullElse(errors.get("password"), "") %></div>

        <div class="form-actions">
            <div class="remember">
                <input type="checkbox" name="rememberMe" id="rememberMe">
                <label for="rememberMe">Remember Me</label>
            </div>
            <button type="submit">Login</button>
        </div>
    </form>
    <div class="footer">
        &copy; 2024 Pdp Academy. All rights reserved.
    </div>
</div>
</body>
</html>
