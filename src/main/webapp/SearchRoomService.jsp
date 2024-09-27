<%/*
 * Service, non HTML page that processes the search of a room. This is an artifact from the fact that
 * I did not use any servlets for this project. Silly me.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="Project_web_app.Room" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if ("true".equals(request.getParameter("flag"))) {
        int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
        String chainName = request.getParameter("chainName");
        int hotelID = Integer.parseInt(request.getParameter("hotelID"));
        int price = Integer.parseInt(request.getParameter("price"));
        String city = request.getParameter("city");
        String view = request.getParameter("view");
        int starRating = Integer.parseInt(request.getParameter("starRating"));
        boolean tv = Boolean.parseBoolean(request.getParameter("tv"));
        boolean ac = Boolean.parseBoolean(request.getParameter("ac"));
        boolean fridge = Boolean.parseBoolean(request.getParameter("fridge"));
        boolean wifi = Boolean.parseBoolean(request.getParameter("wifi"));
        boolean extendable = Boolean.parseBoolean(request.getParameter("extendable"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));

        Room room = new Room(roomNumber, chainName, hotelID, price, city, starRating, tv, ac, fridge, wifi, view, capacity, extendable);
        System.out.println(room);

        request.getSession().setAttribute("room", room);
        request.getSession().setAttribute("flag", "false");
        response.getWriter().write("success");
    }
%>