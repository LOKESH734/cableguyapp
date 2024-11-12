<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = request.getParameter("role");
    String address = request.getParameter("address");
    String phone = request.getParameter("phone");
    String errorMessage = "";
    Connection connection = null;
    PreparedStatement ps = null;

    if (name != null && email != null && password != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/ecommerce?useSSL=false&serverTimezone=UTC";
            String dbUser = "root"; // Your database username
            String dbPassword = "tiger"; // Your database password

            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            // Check if email already exists
            ps = connection.prepareStatement("SELECT * FROM Users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                errorMessage = "Email already exists.";
            } else {
                // Insert new user
                ps = connection.prepareStatement("INSERT INTO Users (name, email, password, role, address, phone) VALUES (?, ?, ?, ?, ?, ?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, password); // Consider hashing passwords for security
                ps.setString(4, role);
                ps.setString(5, address);
                ps.setString(6, phone);
                ps.executeUpdate();
                response.sendRedirect("login.jsp"); // Redirect to login page
            }
        } catch (SQLException e) {
            errorMessage = "Database error: " + e.getMessage();
        } catch (ClassNotFoundException e) {
            errorMessage = "JDBC Driver not found. Make sure the MySQL Connector/J is in the classpath.";
        } catch (Exception e) {
            errorMessage = "Error: " + e.getMessage();
        } finally {
            if (ps != null) ps.close();
            if (connection != null) connection.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - SmartCampus Marketplace</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<div class="content">
    <h2>Sign Up</h2>
    <form action="signup.jsp" method="POST">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="student" selected>Student</option>
                <option value="admin">Admin</option>
                <option value="staff">Staff</option>
            </select>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <textarea id="address" name="address"></textarea>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone">
        </div>
        <button type="submit">Sign Up</button>
        <p style="color:red;"><%= errorMessage %></p>
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </form>
</div>

</body>
</html>
