<%/*
 * Web page for the employee dashboard that allows them to access the links to search for a customer's
 * bookings, create a renting from a booking for a customer, and search the employee database for other
 * employee's contact information
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .options {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .option {
            width: 45%;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .option a {
            text-decoration: none;
            color: #333;
        }

        .option:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>

<body>
<div class="container">
    <h1>Employee Dashboard</h1>
    <div class="options">
        <div class="option">
            <a href="SearchBooking.jsp">Search Bookings</a>
        </div>
        <div class="option">
            <a href="CreateRenting.jsp">Create Renting</a>
        </div>
        <div class="option">
            <a href="SearchEmployees.jsp">Search Employee Database</a>
        </div>
    </div>
</div>
</body>

</html>

