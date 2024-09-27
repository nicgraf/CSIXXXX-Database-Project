<%/*
 * Web page that calculates and alloys customers to pay off their billings.
 *
 * Nic Graf 2024 for CSI2132
 */%>

<%@ page import="Project_web_app.DBConnect" %>
<%@ page import="java.sql.*" %>
<%
    DBConnect dbConnect = new DBConnect();
    Connection conn = null;
    try {
        conn = dbConnect.getConnection();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    int customerId = 0;
    String customerIdStr = request.getParameter("customerId");
    if (customerIdStr != null && !customerIdStr.isEmpty()) {
        customerId = Integer.parseInt(customerIdStr);

        // Retrieve rentings for the customer
        String query = "SELECT * FROM Payment_Calculator WHERE cust_ID = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setInt(1, customerId);
        ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
    <title>Pay Rentings</title>
</head>
<body>
<h1>Active Rentings</h1>
<table border="1">
    <tr>
        <th>Rent ID</th>
        <th>Hotel ID</th>
        <th>Room Number</th>
        <th>Total Price $</th>
        <th>Payment</th>
        <th>Action</th>
    </tr>
    <% while (rs.next()) { %>
    <tr>
        <td><%= rs.getInt("rent_id") %></td>
        <td><%= rs.getInt("cust_ID") %></td>
        <td><%= rs.getInt("room_number") %></td>
        <td><%= rs.getInt("total_price") %> </td>
        <td>
            <select name="payment_<%= rs.getInt("rent_id") %>">
                <option value="Credit">Credit</option>
                <option value="Debit">Debit</option>
                <option value="E-transfer">E-transfer</option>
                <option value="Cash">Cash</option>
                <option value="Bitcoin">Bitcoin</option>
                <option value="Stock options">Stock options</option>
                <option value="Goats">Goats</option>
                <option value="Land">Land</option>
                <option value="Favours">Favours</option>
            </select>
        </td>
        <td>
            <form method="post">
                <input type="hidden" name="rent_id" value="<%= rs.getInt("rent_id") %>">
                <input type="submit" value="Pay">
            </form>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>
<%
    rs.close();
    pstmt.close();
} else {
%>
<html>
<head>
    <title>Enter Customer ID</title>
</head>
<body>
<h1>Enter Customer ID</h1>
<form action="" method="get">
    <label for="customerId">Customer ID:</label>
    <input type="text" id="customerId" name="customerId" required>
    <input type="submit" value="Submit">
</form>
</body>
</html>
<%
    }
    // Close database connection
    try {
        if (conn != null) {
            conn.close();
        }
    } catch (Exception e) {
        out.println("Error closing connection: " + e.getMessage());
    }

%>
