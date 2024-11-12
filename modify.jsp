<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: pulse 2s infinite alternate;
        }

        @keyframes pulse {
            from {
                transform: scale(1);
            }
            to {
                transform: scale(1.05);
            }
        }

        h1 {
            text-align: center;
            color: #4CAF50;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus {
            outline: none;
            border-color: #4CAF50;
        }

        button[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 12px 24px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Modify Customer Details</h1>
        <%
            // Retrieve customer ID from request parameters
            String customerIdParam = request.getParameter("CustomerID");
            if (customerIdParam == null || customerIdParam.isEmpty()) {
                out.println("<h2>Customer ID is missing!</h2>");
                return;
            }

            int customerId = 0;
            try {
                customerId = Integer.parseInt(customerIdParam);
            } catch (NumberFormatException e) {
                out.println("<h2>Invalid Customer ID!</h2>");
                return;
            }

            // Database connection variables
            String url = "jdbc:mysql://localhost:3306/cable";
            String dbUsername = "root";
            String dbPassword = "tiger";

            // SQL query to fetch customer details
            String fetchSql = "SELECT * FROM Customers2 WHERE CustomerID = ?";
            String firstName = "", lastName = "", address = "", phone = "", email = "", VCNo = "", status = "";
            int boxId = 0;

            // Fetch existing customer details
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                 PreparedStatement fetchPstmt = conn.prepareStatement(fetchSql)) {

                fetchPstmt.setInt(1, customerId);
                ResultSet rs = fetchPstmt.executeQuery();

                if (rs.next()) {
                    firstName = rs.getString("FirstName");
                    lastName = rs.getString("LastName");
                    address = rs.getString("Address");
                    phone = rs.getString("Phone");
                    email = rs.getString("Email");
                    boxId = rs.getInt("BoxID");
                    VCNo = rs.getString("VCNo");
                    status = rs.getString("Status");
                } else {
                    out.println("<h2>Customer not found!</h2>");
                    return;
                }
            } catch (SQLException e) {
                out.println("<h2>Database error occurred. Please try again later.</h2>");
                e.printStackTrace();
                return;
            }
        %>
        <form action="modify.jsp" method="post">
            <input type="hidden" name="customerId" value="<%= customerId %>">
            <label for="FirstName">First Name:</label>
            <input type="text" id="FirstName" name="FirstName" value="<%= firstName %>" required>

            <label for="LastName">Last Name:</label>
            <input type="text" id="LastName" name="LastName" value="<%= lastName %>" required>

            <label for="Address">Address:</label>
            <input type="text" id="Address" name="Address" value="<%= address %>" required>

            <label for="Phone">Phone:</label>
            <input type="text" id="Phone" name="Phone" value="<%= phone %>" required>

            <label for="Email">Email:</label>
            <input type="Email" id="Email" name="Email" value="<%= email %>" required>

            <label for="BoxId">Box ID:</label>
            <input type="text" id="BoxId" name="BoxId" value="<%= boxId %>" required>

            <label for="VCNo">VC Number:</label>
            <input type="text" id="VCNo" name="VCNo" value="<%= VCNo %>" required>

            <label for="Status">Status:</label>
            <input type="text" id="Status" name="Status" value="<%= status %>" required>

            <button type="submit">Update</button>
        </form>

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Retrieve updated form data
                String newFirstName = request.getParameter("FirstName");
                String newLastName = request.getParameter("LastName");
                String newAddress = request.getParameter("Address");
                String newPhone = request.getParameter("Phone");
                String newEmail = request.getParameter("Email");
                int newBoxId = Integer.parseInt(request.getParameter("BoxId"));
                String newVCNo = request.getParameter("VCNo");
                String newStatus = request.getParameter("Status");

                // SQL query to update customer details
                String updateSql = "UPDATE Customers2 SET FirstName = ?, LastName = ?, Address = ?, Phone = ?, Email = ?, BoxID = ?, VCNo = ?, Status = ? WHERE CustomerID = ?";

                try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
                     PreparedStatement updatePstmt = conn.prepareStatement(updateSql)) {

                    // Setting the parameters
                    updatePstmt.setString(1, newFirstName);
                    updatePstmt.setString(2, newLastName);
                    updatePstmt.setString(3, newAddress);
                    updatePstmt.setString(4, newPhone);
                    updatePstmt.setString(5, newEmail);
                    updatePstmt.setInt(6, newBoxId);
                    updatePstmt.setString(7, newVCNo);
                    updatePstmt.setString(8, newStatus);
                    updatePstmt.setInt(9, customerId);

                    // Executing the update
                    int rowsAffected = updatePstmt.executeUpdate();

                    // Checking if the update was successful
                    if (rowsAffected > 0) {
                        out.println("<h2>Update successful!</h2>");
                        // Redirect to home page after 3 seconds
                        out.println("<script>");
                        out.println("setTimeout(function() { window.location.href = 'search.jsp'; }, 3000);");
                        out.println("</script>");
                    } else {
                        out.println("<h2>Update failed. Please try again.</h2>");
                    }
                } catch (SQLException e) {
                    out.println("<h2>Database error occurred. Please try again later.</h2>");
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>
