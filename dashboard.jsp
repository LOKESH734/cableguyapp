<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    int activeCount = 0;
    int inactiveCount = 0;
    Connection connection = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        String dbURL = "jdbc:mysql://localhost:3306/cable";
        String dbUser = "root";
        String dbPassword = "tiger";
        
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        // Query to count active boxes
        ps = connection.prepareStatement("SELECT COUNT(*) AS count FROM Customers2 WHERE Status = 'active'");
        rs = ps.executeQuery();
        if (rs.next()) {
            activeCount = rs.getInt("count");
        }
        
        // Query to count inactive boxes
        ps = connection.prepareStatement("SELECT COUNT(*) AS count FROM Customers2 WHERE Status = 'inactive'");
        rs = ps.executeQuery();
        if (rs.next()) {
            inactiveCount = rs.getInt("count");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (connection != null) connection.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - MyCable</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Status', 'Count'],
                ['Active', <%= activeCount %>],
                ['Inactive', <%= inactiveCount %>]
            ]);

            var options = {
                title: 'Active vs Inactive Boxes'
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
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

        .content {
            max-width: 800px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .content h2 {
            margin-top: 0;
        }

        .stats-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .stats-table th, .stats-table td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .stats-table th {
            background-color: #f2f2f2;
            text-align: left;
        }
    </style>
</head>
<body>

<div class="top-bar">
    <img src="image11.jpeg" alt="Left Logo">
    <span class="user-id">admin</span>
    <img src="image11.jpeg" alt="Right Logo">
</div>

<div class="content">
    <h2>Dashboard</h2>
    <div id="piechart" style="width: 100%; height: 500px;"></div>

    <table class="stats-table">
        <tr>
            <th>Status</th>
            <th>Count</th>
        </tr>
        <tr>
            <td>Active</td>
            <td><%= activeCount %></td>
        </tr>
        <tr>
            <td>Inactive</td>
            <td><%= inactiveCount %></td>
        </tr>
    </table>
</div>

</body>
</html>
