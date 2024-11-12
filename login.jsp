<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyCable - Search</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .top-bar {
            background-color: #333;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .top-bar img {
            height: 30px;
        }

        .user-id {
            font-size: 14px;
            margin-left: auto;
        }

        .balance {
            font-size: 14px;
            margin-right: 20px;
        }

        .search-bar {
            background-color: #f2f2f2;
            padding: 20px;
            display: flex;
            align-items: center;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            margin-right: 10px;
            width: 200px;
        }

        .search-bar button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .search-bar button img {
            margin-right: 5px;
            height: 20px;
        }

        .main-content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 20px;
        }

        .left-navigation {
            width: 200px;
            background-color: #f2f2f2;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .left-navigation button {
            margin-bottom: 10px;
            padding: 15px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
            text-align: left;
            font-size: 16px;
            display: flex;
            align-items: center;
        }

        .left-navigation button img {
            margin-right: 10px;
            height: 20px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #f1f1f1;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        .notification {
            flex: 1;
            background-color: #fff;
            padding: 20px;
            text-align: center;
        }

        .bottom-bar {
            background-color: #333;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            text-align: left;
        }

        .results-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .results-table th, .results-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .results-table th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</head>
<body>

<%
    String query = request.getParameter("query");
    double distributorBalance = 0.0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable", "root", "tiger");

        // Fetch distributor balance
        String balanceSql = "SELECT Balance FROM Distributors WHERE DistributorID = ?"; // Assuming DistributorID is passed as a parameter
        pstmt = conn.prepareStatement(balanceSql);
        pstmt.setInt(1, 1); // Change this to dynamically fetch based on your requirement
        rs = pstmt.executeQuery();
        if (rs.next()) {
            distributorBalance = rs.getDouble("Balance");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>

<div class="top-bar">
    <img src="image11.jpeg" alt="Left Logo">
    <span class="user-id">admin</span>
    <span class="balance">Distributor Balance: $<%= distributorBalance %></span>
    <img src="image11.jpeg" alt="Right Logo">
</div>

<div class="search-bar">
    <form method="get" action="search.jsp">
        <input id="searchInput" type="text" name="query" placeholder="Search...">
        <button type="submit"><img src="search-icon.png" alt="Search">Search</button>
    </form>
</div>

<div class="main-content">
    <div class="left-navigation">
        <button onclick="window.location.href='dashboard.html'"><img src="iconnn.png" alt="">Dashboard</button><br><br>
        <button onclick="window.location.href='ecaf_status.html'"><img src="icon2.png" alt="">E-Caf Status</button><br><br>
        <div class="dropdown">
            <button class="dropbtn"><img src="icon9.gif" alt="">Order</button>
            <div class="dropdown-content">
                <a href="#">Change Order</a>
                <a href="#">Multi Change Order</a>
            </div>
        </div><br><br>
        <button onclick="window.location.href='modify.html'"><img src="icons8.gif" alt="">Modify</button><br><br>
        <button onclick="window.location.href='pay.html'"><img src="icon11.png" alt="">Pay</button><br><br>
        <button onclick="window.location.href='register.html'"><img src="icon12.png" alt="">Register</button><br><br>
        <div class="dropdown">
            <button class="dropbtn"><img src="icon66.png" alt="">Renew</button>
            <div class="dropdown-content">
                <a href="#">Single Renew</a>
                <a href="#">Multi Renew</a>
            </div>
        </div><br><br>
        <button onclick="window.location.href='complaint.html'"><img src="icon77.png" alt="">Complaint</button><br><br>
        <button onclick="window.location.href='information.html'"><img src="icon88.png" alt="">Information</button><br><br>
        <button><img src="icon001.png" alt="">Reports</button><br> <!-- Fixed button placement -->
    </div>
    <div class="notification">
        <%
            if (query != null && !query.trim().isEmpty()) {
                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cable", "root", "tiger");
                    String sql = "SELECT c.CustomerID, c.FirstName, c.LastName, c.Phone, c.BoxID, c.Status, d.Balance " +
                                 "FROM Customers2 c " +
                                 "JOIN Distributors d ON c.DistributorID = d.DistributorID " +
                                 "WHERE c.FirstName LIKE ? OR c.LastName LIKE ? OR c.Phone LIKE ? OR c.BoxID LIKE ?";
                    pstmt = conn.prepareStatement(sql);
                    String searchQuery = "%" + query + "%";
                    pstmt.setString(1, searchQuery);
                    pstmt.setString(2, searchQuery);
                    pstmt.setString(3, searchQuery);
                    pstmt.setString(4, searchQuery);
                    rs = pstmt.executeQuery();
                    out.println("<table class='results-table'>");
                    out.println("<tr><th>CustomerID</th><th>FirstName</th><th>LastName</th><th>Phone</th><th>BoxID</th><th>Status</th><th>Balance</th><th>Renew</th><th>Order</th></tr>");
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("CustomerID") + "</td>");
                        out.println("<td>" + rs.getString("FirstName") + "</td>");
                        out.println("<td>" + rs.getString("LastName") + "</td>");
                        out.println("<td>" + rs.getString("Phone") + "</td>");
                        out.println("<td>" + rs.getInt("BoxID") + "</td>");
                        out.println("<td>" + rs.getString("Status") + "</td>");
                        out.println("<td>" + rs.getDouble("Balance") + "</td>");
                        out.println("<td><button onclick=\"window.location.href='renew.html'\"><img src=\"icon3.png\" alt=\"\"></button></td>");
                        out.println("<td><button onclick=\"window.location.href='order.jsp'\"><img src=\"icon66.png\" alt=\"\"></button></td>");
                        out.println("</tr>");
                    }
                    out.println("</table>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            } else {
                out.println("<p>Please enter a search term.</p>");
            }
        %>
    </div>
</div>

<div class="bottom-bar">
    <div class="weather-widget">36°C Mostly cloudy</div>
    <div class="system-info">Time: 12:00 PM | Date: May 15, 2024 | Language: English | Network: Connected</div>
</div>

<div class="footer">
    Copyright © 2024 - MyCable - 219
</div>

</body>
</html>
