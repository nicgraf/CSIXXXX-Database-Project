<%/*
 * Web page for a customer to search for a hotel room with specified requirements.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Project_web_app.Room" %>
<%@ page import="java.sql.*" %>
<%@ page import="Project_web_app.DBConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Hotel Search</h1>
    <form method="post">
        <label for="city">City:</label>
        <select id="city" name="city" required>
            <option value="Toronto">Toronto</option>
            <option value="Montreal">Montreal</option>
            <option value="Vancouver">Vancouver</option>
            <option value="Edmonton">Edmonton</option>
            <option value="Halifax">Halifax</option>
        </select>
        <label for="priceFrom">Price Range From:</label>
        <input type="number" id="priceFrom" name="priceFrom" min="0">
        <label for="priceTo">Price Range To:</label>
        <input type="number" id="priceTo" name="priceTo" min="0">
        <label for="sort">Sort By Price:</label>
        <select id="sort" name="sort">
            <option value="lowToHigh">Low to High</option>
            <option value="highToLow">High to Low</option>
        </select>
        <input type="submit" value="Search Hotels">
    </form>
</div>
</body>
</html>
<%
    if (request.getMethod().equalsIgnoreCase("post")) {

        String city = request.getParameter("city");
        String priceFrom = request.getParameter("priceFrom");
        String priceTo = request.getParameter("priceTo");
        String sort = request.getParameter("sort");

        String query = "SELECT * FROM Room_Search WHERE true ";

        if (city != null && !city.isEmpty()){
            query += "AND city = '" + city + "' ";
        }

        if (priceFrom != null && !priceFrom.isEmpty()){
            query += "AND price > " + priceFrom + " ";
        }

        if (priceTo != null && !priceTo.isEmpty()){
            query += "AND price < " + priceTo + " ";
        }

        if(sort != null && sort.equalsIgnoreCase("lowToHigh")){
            query += "ORDER BY price ASC";
        } else if (sort != null && sort.equalsIgnoreCase("highToLow")){
            query += "ORDER BY price DESC";
        }


        try (Connection conn = new DBConnect().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            List<Room> rooms = new ArrayList<>();
            while (rs.next()) {
                Room room = new Room();
                room.setHotel_ID(rs.getInt("hotel_ID"));
                room.setRoom_number(rs.getInt("room_number"));
                room.setChain_name(rs.getString("chain_name"));
                room.setPrice(rs.getInt("price"));
                room.setCity(rs.getString("city"));
                room.setStar_rating(rs.getInt("star_rating"));
                room.setTv(rs.getBoolean("tv"));
                room.setAc(rs.getBoolean("ac"));
                room.setFridge(rs.getBoolean("fridge"));
                room.setWifi(rs.getBoolean("wifi"));
                room.setView(rs.getString("view"));
                room.setCapacity(rs.getInt("capacity"));
                room.setExtendable(rs.getBoolean("extendable"));
                rooms.add(room);
            }

            request.setAttribute("rooms", rooms);
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("SearchRoomResults.jsp");
        dispatcher.forward(request, response);
    }
%>