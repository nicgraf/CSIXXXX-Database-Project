<%/*
 * Web page to create a renting from a booking for a given customer from the employee's dashboard
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="Project_web_app.DBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {

        String customerIdStr = request.getParameter("cust_ID");
        String hotelIdStr = request.getParameter("hotel_ID");
        String roomNumberStr = request.getParameter("room_number");
        String checkInDateStr = request.getParameter("check_in");
        String checkOutDateStr = request.getParameter("check_out");

        int customerId = Integer.parseInt(customerIdStr);
        int hotelId = Integer.parseInt(hotelIdStr);
        int roomNumber = Integer.parseInt(roomNumberStr);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = sdf.parse(checkInDateStr);
        Date checkOutDate = sdf.parse(checkOutDateStr);

        String query1 = "INSERT INTO Rentings(rent_Id, cust_Id, hotel_Id, room_number, check_in, check_out) " +
                "VALUES ((SELECT max(book_ID) FROM Bookings_Archive) + 1, ?, ?, ?, ?, ?)";

        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query1)){

            pstmt.setInt(1, customerId);
            pstmt.setInt(2, hotelId);
            pstmt.setInt(3, roomNumber);
            pstmt.setDate(4, new java.sql.Date(checkInDate.getTime()));
            pstmt.setDate(5, new java.sql.Date(checkOutDate.getTime()));
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Renting</title>
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
        .form-group input[type="date"],
        .form-group input[type="number"] {
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
    <h2>Create Renting</h2>
    <form method="post">
        <div class="form-group">
            <label for="cust_ID">Customer ID:</label>
            <input type="number" id="cust_ID" name="cust_ID" required>
        </div>
        <div class="form-group">
            <label for="hotel_ID">Hotel ID:</label>
            <input type="number" id="hotel_ID" name="hotel_ID" required>
        </div>
        <div class="form-group">
            <label for="room_number">Room Number:</label>
            <input type="number" id="room_number" name="room_number" required>
        </div>
        <div class="form-group">
            <label for="check_in">Check-in Date:</label>
            <input type="date" id="check_in" name="check_in" required>
        </div>
        <div class="form-group">
            <label for="check_out">Check-out Date:</label>
            <input type="date" id="check_out" name="check_out" required>
        </div>
        <div class="form-group">
            <button type="submit">Create Renting</button>
        </div>
    </form>
</div>
</body>

</html>
