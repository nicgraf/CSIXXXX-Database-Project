<%/*
 * Web page for an employee to create an account that is saved on the database, such that
 * they can login in the future - requires their employee number.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="Project_web_app.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="Project_web_app.LoginService" %>


<%
    if (request.getMethod().equalsIgnoreCase("post")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String emp_ID = request.getParameter("emp_ID");

        String query1 = "SELECT * FROM Hotel_Employee WHERE emp_ID = ?";
        String query2 = "INSERT INTO User_Login (usern, pass, employee) VALUES (?, ?, ?)";


        if (LoginService.isInteger(emp_ID)){
            Integer emp = Integer.parseInt(emp_ID);

            try (Connection conn = new DBConnect().getConnection(); PreparedStatement stmt1 = conn.prepareStatement(query1)){
                stmt1.setInt(1, emp);

                try (java.sql.ResultSet rs = stmt1.executeQuery()){
                    if (rs.next()){
                        PreparedStatement stmt2 = conn.prepareStatement(query2);{
                            stmt2.setString(1, username);
                            stmt2.setString(2, password);
                            stmt2.setBoolean(3, true);
                            stmt2.executeQuery();
                        }
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }


            } catch (Exception e){
                e.printStackTrace();
            }
        } else{
            %>
        <p style="color: red;">Employee ID must be a number.</p>
<%
        }


    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Registration</title>
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
    <h2>Employee Registration</h2>
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
            <label for="emp_ID">Employee ID:</label>
            <input type="emp_ID" id="emp_ID" name="emp_ID" required>
        </div>
        <div class="form-group">
            <button type="submit" name="register">Register</button>
        </div>
    </form>
    <div class="register-link">
        <p>Already have an account? <a href="LoginScreen.jsp">Login</a></p>
    </div>
</div>
</body>
</html>

