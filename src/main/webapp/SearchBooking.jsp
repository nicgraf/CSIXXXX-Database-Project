<%/*
 * Web page for employees to search for a customer's booking with either customerId, hotelId, or start Date.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<!DOCTYPE html>
<html lang="en">
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Project_web_app.Booking" %>
<%@ page import="java.sql.*" %>
<%@ page import="Project_web_app.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String hotelID = request.getParameter("hotelID");
        String customerID = request.getParameter("customerID");
        String startDate = request.getParameter("startDate");

        String query = "SELECT * FROM Bookings WHERE true";

        if (hotelID != null && !hotelID.isEmpty()) {
            query += " AND hotel_ID = " + hotelID;
        }

        if (customerID != null && !customerID.isEmpty()) {
            query += " AND cust_ID = " + customerID;
        }

        if (startDate != null && !startDate.isEmpty()) {
            query += " AND check_in = '" + startDate + "'";
        }

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            List<Booking> bookings = new ArrayList<>();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setId(rs.getInt("book_ID"));
                booking.setCustomerId(rs.getInt("cust_ID"));
                booking.setHotelId(rs.getInt("hotel_ID"));
                booking.setRoomNumber(rs.getInt("room_number"));
                booking.setCheckIn(rs.getDate("check_in"));
                booking.setCheckOut(rs.getDate("check_out"));
                bookings.add(booking);
            }

            request.setAttribute("bookings", bookings);
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("SearchBookingResults.jsp");
        dispatcher.forward(request, response);

    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
        }

        .form-group input[type="text"],
        .form-group input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group button {
            padding: 8px 15px;
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
<div class="container">
    <h2>Search Booking</h2>
    <form method="post">
        <div class="form-group">
            <label for="hotelID">Hotel ID:</label>
            <input type="text" id="hotelID" name="hotelID">
        </div>
        <div class="form-group">
            <label for="customerID">Customer ID:</label>
            <input type="text" id="customerID" name="customerID">
        </div>
        <div class="form-group">
            <label for="startDate">Start Date:</label>
            <input type="date" id="startDate" name="startDate">
        </div>
        <div class="form-group">
            <button type="submit">Search</button>
        </div>
    </form>
</div>
</body>

</html>