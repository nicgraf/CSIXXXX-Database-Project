<%/*
 * Web page that displays results for an employee's search of another employee across the database.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="java.util.List" %>
<%@ page import="Project_web_app.Hotel_Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Search Booking Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
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

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .check-in-button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
        }

        .check-in-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Search Employees Results</h1>

<table>
    <tr>
        <th>Chain Name</th>
        <th>Hotel ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Title</th>
        <th>Email Address</th>
        <th>Phone Number</th>
    </tr>
    <%
        Hotel_Employee[] employees;

        Object obj = request.getAttribute("Employees");
        if (obj instanceof List) {
            List<Hotel_Employee> employeesList = (List<Hotel_Employee>) obj;
            int size = employeesList.size();
            employees = employeesList.toArray(new Hotel_Employee[size]);

            for (int i = 0; i < size; i++) {
                Hotel_Employee employee = employees[i];
    %>
    <tr>
        <td><%= employee.getChain_name() %></td>
        <td><%= employee.getHotel_ID() %></td>
        <td><%= employee.getFirst_name() %></td>
        <td><%= employee.getLast_name() %></td>
        <td><%= employee.getTitle() %></td>
        <td><%= employee.getEmail_address() %></td>
        <td><%= employee.getPhone_number() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <p style="color: red;">No results found.</p>
    <%
        }
    %>
</table>

</body>
</html>
