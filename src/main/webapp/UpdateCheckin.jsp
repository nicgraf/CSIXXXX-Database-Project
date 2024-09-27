<%/*
 * Service, non HTML page that processes a checkin request. This is an artifact from the fact that
 * I did not use any servlets for this project. Silly me.
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
    String bookingIdStr = request.getParameter("bookingId");
    String customerIdStr = request.getParameter("customerId");
    String hotelIdStr = request.getParameter("hotelId");
    String roomNumberStr = request.getParameter("roomNumber");
    String checkInDateStr = request.getParameter("checkInDate");
    String checkOutDateStr = request.getParameter("checkOutDate");

    int bookingId = Integer.parseInt(bookingIdStr);
    int customerId = Integer.parseInt(customerIdStr);
    int hotelId = Integer.parseInt(hotelIdStr);
    int roomNumber = Integer.parseInt(roomNumberStr);

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date checkInDate = sdf.parse(checkInDateStr);
    Date checkOutDate = sdf.parse(checkOutDateStr);

    String query1 = "INSERT INTO Rentings(rent_Id, cust_Id, hotel_Id, room_number, check_in, check_out) VALUES (?, ?, ?, ?, ?, ?)";
    String query2 = "DELETE FROM Bookings WHERE book_ID = ?";

    try (Connection conn = new DBConnect().getConnection();
         PreparedStatement pstmt = conn.prepareStatement(query1);
         PreparedStatement pstmt2 = conn.prepareStatement(query2)) {

        pstmt.setInt(1, bookingId);
        pstmt.setInt(2, customerId);
        pstmt.setInt(3, hotelId);
        pstmt.setInt(4, roomNumber);
        pstmt.setDate(5, new java.sql.Date(checkInDate.getTime()));
        pstmt.setDate(6, new java.sql.Date(checkOutDate.getTime()));
        pstmt.executeUpdate();

        pstmt2.setInt(1, bookingId);
        pstmt2.executeUpdate();

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
