<%/*
* Web page for checking in the customer from the employee's dashboard
*
* Nic Graf 2024 for CSI2132
*/%>

<%@ page import="Project_web_app.Booking" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check-in</title>
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

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Check-in</h1>
<form action="processCheckin.jsp" method="post">
    <%-- Booking ID, Customer ID, Hotel ID, Room Number, Check-in Date, and Check-out Date are carried over from booking search --%>
    <input type="hidden" name="bookingId" value="<%= request.getParameter("bookingId") %>">
    <input type="hidden" name="customerId" value="<%= request.getParameter("customerId") %>">
    <input type="hidden" name="hotelId" value="<%= request.getParameter("hotelId") %>">
    <input type="hidden" name="roomNumber" value="<%= request.getParameter("roomNumber") %>">
    <input type="hidden" name="checkInDate" value="<%= request.getParameter("checkInDate") %>">
    <input type="hidden" name="checkOutDate" value="<%= request.getParameter("checkOutDate") %>">

    <!-- Display text boxes for each carried field -->
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="" required>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="" required>
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" value="" required>
    <label for="phone">Phone:</label>
    <input type="text" id="phone" name="phone" value="" required>

    <input type="submit" value="Check-in">
</form>
</body>
</html>
