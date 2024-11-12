<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Registration</title>
</head>
<body>
    <%
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int boxId = Integer.parseInt(request.getParameter("boxId"));
        String VCNo = request.getParameter("VCNo");
        String status = request.getParameter("status");

        // Database connection variables
        String url = "jdbc:mysql://localhost:3306/cable"; 
        String dbUsername = "root"; 
        String dbPassword = "tiger"; 

        String sql = "INSERT INTO Customers2 (FirstName, LastName, Address, Phone, Email, BoxID, VCNo, Status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        // Use try-with-resources for proper resource management
        try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Setting the parameters
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, address);
            pstmt.setString(4, phone);
            pstmt.setString(5, email);
            pstmt.setInt(6, boxId);
            pstmt.setString(7, VCNo);
            pstmt.setString(8, status);

            // Executing the query
            int rowsAffected = pstmt.executeUpdate();

            // Checking if registration was successful
            if (rowsAffected > 0) {
                out.println("<h2>Registration successful!</h2>");
                // Redirect to home page after 3 seconds
                out.println("<script>");
                out.println("setTimeout(function() { window.location.href = 'search.jsp'; }, 3000);");
                out.println("</script>");
            } else {
                out.println("<h2>Registration failed. Please try again.</h2>");
            }
        } catch (SQLException e) {
            out.println("<h2>Database error occurred. Please try again later.</h2>");
            e.printStackTrace();
        }
    %>
</body>
</html>
