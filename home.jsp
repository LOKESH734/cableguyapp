<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyCable</title>
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
            padding: 500px;
            text-align: center;
            background-image: url('image10.jpeg');
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
    </style>
</head>

<body>

<div class="top-bar">
    <img src="image11.jpeg" alt="Left Logo">
    <span class="user-id">admin</span>
    <img src="image11.jpeg" alt="Right Logo">
</div>

<div class="search-bar">
    <input id="searchInput" type="text" placeholder="Search...">
    <button onclick="performSearch()"><img src="search-icon.png" alt="Search"></button>
</div>

<div class="main-content">
    <div class="left-navigation">
    <button onclick="window.location.href='search.html'"><img src="iconnn.png" alt="">search</button><br>
        <br>
        <button onclick="window.location.href='dashboard.html'"><img src="iconnn.png" alt="">Dashboard</button><br>
        <br>
        <button onclick="window.location.href='ecaf_status.html'"><img src="icon2.png" alt="">E-Caf Status</button><br>
        <br>
        <div class="dropdown">
            <button class="dropbtn"><img src="icon9.gif" alt="">Order</button>
            <div class="dropdown-content">
                <a href="#">Change Order</a>
                <a href="#">Multi Change Order</a>
            </div>
        </div>
        <br>
        <button onclick="window.location.href='modify.jsp'"><img src="icons8.gif" alt="">Modify</button><br>
        <br>
        <button onclick="window.location.href='pay.html'"><img src="icon11.png" alt="">Pay</button><br>
        <br>
        <button onclick="window.location.href='register.html'"><img src="icon12.png" alt="">Register</button><br>
        <br>
        <div class="dropdown">
            <button class="dropbtn"><img src="icon66.png" alt="">Renew</button>
            <div class="dropdown-content">
                <a href="#">Single Renew</a>
                <a href="#">Multi Renew</a>
            </div>
        </div>
        <br>
        <button onclick="window.location.href='complaint.html'"><img src="icon77.png" alt="">Complaint</button><br>
        <br>
        <button onclick="window.location.href='information.html'"><img src="icon88.png" alt="">Information</button><br>
        <br>
        <button onclick="window.location.href='reports.html'"><img src="icon001.png" alt="">Reports</button><br>
        <!-- Add more buttons as needed -->
    </div>
    <div class="notification">
        
        <!-- Add links within the paragraph -->
    </div>
</div>

<div class="bottom-bar">
    <div class="weather-widget">36°C Mostly cloudy</div>
    <div class="system-info">Time: 12:00 PM | Date: May 15, 2024 | Language: English | Network: Connected</div>
</div>

<div class="footer">
    Copyright © 2024 - MyCable - 219
</div>

<script>
    function performSearch() {
        var searchTerm = document.getElementById("searchInput").value;
        // Perform search operation with searchTerm
        // Redirect to search.html with search parameter if needed
        window.location.href = "search.html?query=" + searchTerm;
    }
</script>

</body>
</html>
