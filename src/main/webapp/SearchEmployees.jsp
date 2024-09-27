<%/*
 * Web page for an employee to search for other employees contact information in the database.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<!DOCTYPE html>
<html>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="Project_web_app.DBConnect" %>
<%@ page import="Project_web_app.Hotel_Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String chain_name = request.getParameter("chain_name");
        String hotel_ID = request.getParameter("hotel_ID");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");

        String query = "SELECT * FROM Employee_Search WHERE true";

        List<String> conditions = new ArrayList<>();
        List<Object> values = new ArrayList<>();

        if (chain_name != null && !chain_name.isEmpty()) {
            conditions.add("chain_name = ?");
            values.add(chain_name);
        }

        if (hotel_ID != null && !hotel_ID.trim().isEmpty()) {
            conditions.add("hotel_ID = ?");
            values.add(Integer.parseInt(hotel_ID.trim()));
        }

        if (first_name != null && !first_name.isEmpty()) {
            conditions.add("first_name = ?");
            values.add(first_name);
        }

        if (last_name != null && !last_name.isEmpty()) {
            conditions.add("last_name = ?");
            values.add(last_name);
        }

        if (!conditions.isEmpty()) {
            query += " AND " + String.join(" AND ", conditions);
        }

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            for (int i = 0; i < values.size(); i++) {
                pstmt.setObject(i + 1, values.get(i));
            }

            ResultSet rs = pstmt.executeQuery();

            List<Hotel_Employee> employees = new ArrayList<>();
            while (rs.next()) {
                Hotel_Employee employee = new Hotel_Employee();
                employee.setChain_name(rs.getString("chain_name"));
                employee.setHotel_ID(rs.getInt("hotel_ID"));
                employee.setFirst_name(rs.getString("first_name"));
                employee.setLast_name(rs.getString("last_name"));
                employee.setTitle(rs.getString("title"));
                employee.setEmail_address(rs.getString("email_address"));
                employee.setPhone_number(rs.getInt("phone_number"));
                employees.add(employee);
            }

            request.setAttribute("Employees", employees);
            RequestDispatcher dispatcher = request.getRequestDispatcher("SearchEmployeesResults.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<head>
    <title>Employee Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }

        input[type="text"] {
            padding: 5px;
            width: 200px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            padding: 8px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>Employee Search</h1>
<form action="#" method="post">
    <label for="chain_name">Chain Name:</label>
    <input type="text" id="chain_name" name="chain_name"><br><br>

    <label for="hotel_id">Hotel ID:</label>
    <input type="text" id="hotel_id" name="hotel_id"><br><br>

    <label for="first_name">First Name:</label>
    <input type="text" id="first_name" name="first_name"><br><br>

    <label for="last_name">Last Name:</label>
    <input type="text" id="last_name" name="last_name"><br><br>

    <input type="submit" value="Search">
</form>
