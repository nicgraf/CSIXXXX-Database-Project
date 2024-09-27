<%/*
 * Web page to display the results of a room search for a customer, allows them to access the room by clicking.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="java.util.List" %>
<%@ page import="Project_web_app.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Search Room Results</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            cursor: pointer;
        }

        .check-in-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<h1>Search Room Results</h1>

<table>
    <tr>
        <th>Price per Night</th>
        <th>City</th>
        <th>View</th>
        <th>Star Rating</th>
        <th>Chain</th>
        <th>Action</th>
    </tr>
    <%
        Room[] rooms;

        Object obj = request.getAttribute("rooms");
        if (obj instanceof List) {
            List<Room> roomList = (List<Room>) obj;
            int size = roomList.size();
            rooms = roomList.toArray(new Room[size]);

            for (int i = 0; i < size; i++) {
                Room room = rooms[i];
    %>
    <tr>
        <td><%= room.getPrice() %></td>
        <td><%= room.getCity() %></td>
        <td><%= room.getView()%></td>
        <td><%= room.getStar_rating() %></td>
        <td><%= room.getChain_name() %></td>
        <td><button onclick="viewRoom('<%= room.getRoom_number() %>', '<%= room.getHotel_ID() %>', '<%= room.getPrice() %>', '<%= room.getChain_name() %>', '<%= room.getCity() %>', '<%= room.getView() %>', '<%= room.getStar_rating() %>', '<%= room.isTv() %>', '<%= room.isAc() %>', '<%= room.isFridge() %>', '<%= room.isWifi() %>', '<%= room.isExtendable() %>', '<%= room.getCapacity() %>')" class="View-Room-Button">View Room</button></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="6"><p style="color: red;">No results found.</p></td>
    </tr>
    <%
        }
    %>
</table>

<script>
        function viewRoom(roomNumber, hotelID, price, chainName, city, view, starRating, tv, ac, fridge, wifi, extendable, capacity) {
        $.post("SearchRoomService.jsp", {
            roomNumber: roomNumber,
            hotelID: hotelID,
            price: price,
            chainName: chainName,
            city: city,
            view: view,
            starRating: starRating,
            tv: tv,
            ac: ac,
            fridge: fridge,
            wifi: wifi,
            extendable: extendable,
            capacity: capacity,
            flag: "true"
        }).done(function(response) {
            console.log(response);
            if (response.trim() === "success") {
                window.location.href = "RoomView.jsp";
            } else {
                alert("Failed to process the request. Please try again.");
            }
        }).fail(function() {
            alert("Failed to process the request. Please try again.");
        });
    }

</script>

</body>
</html>