<%/*
 * Web page to view a room from clicking on it after searching. Shows the features of the room and its availability
 * as well as allowing you to book it.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="Project_web_app.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Project_web_app.DBConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {

        String customerIdStr = request.getParameter("custId");
        String hotelIdStr = request.getParameter("hotel_ID");
        String roomNumberStr = request.getParameter("room_number");
        String checkInDateStr = request.getParameter("checkIn");
        String checkOutDateStr = request.getParameter("checkOut");

        int customerId = Integer.parseInt(customerIdStr);
        int hotelId = Integer.parseInt(hotelIdStr);
        int roomNumber = Integer.parseInt(roomNumberStr);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = sdf.parse(checkInDateStr);
        Date checkOutDate = sdf.parse(checkOutDateStr);

        String query1 = "INSERT INTO Bookings(book_Id, cust_Id, hotel_Id, room_number, check_in, check_out) " +
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
<html>
<head>
    <title>Room View</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        .room-details {
            margin-bottom: 20px;
        }

        .room-image {
            width: 100%;
            max-width: 600px;
            margin-bottom: 20px;
        }

        .boolean-value {
            font-size: 20px;
            margin-right: 10px;
        }

        .create-booking {
            margin-top: 20px;
            padding: 10px;
            background-color: #f2f2f2;
        }

        .booking-form input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<%
    Room room = (Room) session.getAttribute("room");
    System.out.println("baka " + room);
%>
<div class="room-details">
    <h1>Room Details</h1>
    <p>Room Number: <%= room.getRoom_number() %></p>
    <p>Chain Name: <%= room.getChain_name() %></p>
    <p>Hotel ID: <%= room.getHotel_ID() %></p>
    <p>City: <%= room.getCity() %></p>
    <p>View: <%= room.getView()%></p>
    <p>Star Rating: <%= room.getStar_rating() %></p>
    <p>TV: <%= room.isTv() ? "&#10004;" : "&#10008;" %></p>
    <p>AC: <%= room.isAc() ? "&#10004;" : "&#10008;" %></p>
    <p>Fridge: <%= room.isFridge() ? "&#10004;" : "&#10008;" %></p>
    <p>WiFi: <%= room.isWifi() ? "&#10004;" : "&#10008;" %></p>
    <p>Extendable: <%= room.isExtendable() ? "&#10004;" : "&#10008;" %></p>
</div>

<div class="create-booking">
    <h2>Create Booking</h2>
    <form method="post" class="booking-form">
        <label for="checkIn">Check-In Date:</label>
        <input type="date" id="checkIn" name="checkIn" required>
        <label for="checkOut">Check-Out Date:</label>
        <input type="date" id="checkOut" name="checkOut" required>
        <label for="custId">Customer ID:</label>
        <input type="text" id="custId" name="custId" required>
        <input type="hidden" name="room_number" value="<%= room.getRoom_number() %>">
        <input type="hidden" name="hotel_ID" value="<%= room.getHotel_ID() %>">
        <input type="submit" value="Create Booking">
    </form>
</div>

<img src="hotel_room.jpg" alt="Hotel Room" class="room-image">

</body>
</html>
