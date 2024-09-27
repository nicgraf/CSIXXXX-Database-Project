<%/*
 * Web page for employees that displays the booking search results and allows them to transform it into a renting
 * upon a single click.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="java.util.List" %>
<%@ page import="Project_web_app.Booking" %>
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
<h1>Search Booking Results</h1>

<table>
    <tr>
        <th>Booking ID</th>
        <th>Customer ID</th>
        <th>Hotel ID</th>
        <th>Room Number</th>
        <th>Check-in Date</th>
        <th>Check-out Date</th>
        <th>Check-in</th>
    </tr>
    <%
        Booking[] bookings;

        Object obj = request.getAttribute("bookings");
        if (obj instanceof List) {
            List<Booking> bookingList = (List<Booking>) obj;
            int size = bookingList.size();
            bookings = bookingList.toArray(new Booking[size]);

            for (int i = 0; i < size; i++) {
                Booking booking = bookings[i];
    %>
    <tr>
        <td><%= booking.getId() %></td>
        <td><%= booking.getCustomerId() %></td>
        <td><%= booking.getHotelId() %></td>
        <td><%= booking.getRoomNumber() %></td>
        <td><%= booking.getCheckIn() %></td>
        <td><%= booking.getCheckOut() %></td>
        <td><button onclick="handleCheckIn(this)" data-booking-id="<%= booking.getId() %>" data-customer-id="<%= booking.getCustomerId() %>" data-hotel-id="<%= booking.getHotelId() %>" data-room-number="<%= booking.getRoomNumber() %>" data-check-in-date="<%= booking.getCheckIn() %>" data-check-out-date="<%= booking.getCheckOut() %>" class="check-in-button">Check-in</button></td>
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

<script>
    function handleCheckIn(button) {
        var bookingId = button.getAttribute('data-booking-id');
        var customerId = button.getAttribute('data-customer-id');
        var hotelId = button.getAttribute('data-hotel-id');
        var roomNumber = button.getAttribute('data-room-number');
        var checkInDate = button.getAttribute('data-check-in-date');
        var checkOutDate = button.getAttribute('data-check-out-date');

        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'UpdateCheckin.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                console.log('Database updated successfully');
                button.textContent = 'Checked in';
                button.style.backgroundColor = 'green';
            }
        };
        xhr.send('bookingId=' + bookingId + '&customerId=' + customerId + '&hotelId=' + hotelId + '&roomNumber=' + roomNumber + '&checkInDate=' + checkInDate + '&checkOutDate=' + checkOutDate);
    }
</script>

</body>
</html>
