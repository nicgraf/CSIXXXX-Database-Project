<%/*
 * The welcoming screen for the website that prompts a login, or customers and employees can choose to register
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import ="Project_web_app.LoginService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Project_web_app.LoginService" %>
<%@ page import="Project_web_app.Pair" %>


<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Pair<Boolean, Boolean> isAuthenticated = LoginService.validate(username, password);

        if ((isAuthenticated.getFirst()) && (isAuthenticated.getSecond())) {
            session.setAttribute("username", username);
            response.sendRedirect("EmployeeDashboard.jsp");
        } else if ((isAuthenticated.getFirst()) && (isAuthenticated.getSecond() == false)) {
            response.sendRedirect("CustomerDashboard.jsp");
        } else {
            response.sendRedirect("LoginScreen.jsp");
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Database Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .login-container h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            width: 100%;
            padding: 8px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
<div class="login-container">
    <h2>Nic Graf's eHotel Database Login</h2>
    <form method="post">
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>
    <div class="register-link">
        <p>Don't have an account? <a href="CustomerRegistration.jsp">Register as a Customer</a> or <a href="EmployeeRegistration.jsp">Register as an Employee</a></p>
    </div>
</div>
</body>

</html>

