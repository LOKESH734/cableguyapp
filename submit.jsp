<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay - MyCable</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .content {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f4f4f4;
            color: #333;
        }

        td {
            background-color: #fff;
            color: #555;
        }

        .btn-accept {
            display: inline-block;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
            border: none;
        }

        .btn-accept:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="content">
    <h2>Selected Packages and Total Cost</h2>
    <%
        String[] selectedPackages = request.getParameterValues("package");
        int totalCost = 0;

        // Calculate total cost
        if (selectedPackages != null) {
            for (String packageId : selectedPackages) {
                switch (packageId) {
                    case "moviePackage":
                        totalCost += 6;
                        break;
                    case "sportsPackage":
                        totalCost += 9;
                        break;
                    case "kidsPackage":
                        totalCost += 3;
                        break;
                    case "newsPackage":
                        totalCost += 8;
                        break;
                    case "musicPackage":
                        totalCost += 5;
                        break;
                    case "entertainmentPackage":
                        totalCost += 10;
                        break;
                    case "spiritualPackage":
                        totalCost += 2;
                        break;
                    case "golden":
                        totalCost += 250;
                        break;
                    case "fullPackage":
                        totalCost += 350;
                        break;
                }
            }
        }

        // Database connection setup
        String dbURL = "jdbc:mysql://localhost:3306/cable";
        String dbUser = "root";
        String dbPassword = "tiger";
        
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            
            int distributorId = 1; // Placeholder, get actual value as per your logic
            int customerId = 4; // Placeholder, get actual value as per your logic
            
            // Fetch current account balance of the distributor
            ps = connection.prepareStatement("SELECT Balance FROM Distributors WHERE DistributorID = ?");
            ps.setInt(1, distributorId);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                double accountBalance = rs.getDouble("Balance");
                
                if (accountBalance >= totalCost) {
                    // Deduct the total cost from the distributor's account balance
                    double newBalance = accountBalance - totalCost;
                    ps = connection.prepareStatement("UPDATE Distributors SET Balance = ? WHERE DistributorID = ?");
                    ps.setDouble(1, newBalance);
                    ps.setInt(2, distributorId);
                    ps.executeUpdate();
                    
                    // Fetch the list of customer IDs who selected packages
                    ps = connection.prepareStatement("SELECT DISTINCT CustomerID FROM Customers2 WHERE Status != 'active'");
                    rs = ps.executeQuery();
                    List<Integer> customerIds = new ArrayList<>();
                    while (rs.next()) {
                        customerIds.add(rs.getInt("CustomerID"));
                    }

                    // Change the status of each customer to active
                    for (int id : customerIds) {
                        ps = connection.prepareStatement("UPDATE Customers2 SET Status = 'active' WHERE CustomerID = ?");
                        ps.setInt(1, id);
                        ps.executeUpdate();
                    }

                    // Insert selected packages into selected_packages table (create table if not exists)
                    ps = connection.prepareStatement("CREATE TABLE IF NOT EXISTS selected_packages (CustomerID INT, PackageID VARCHAR(50), PRIMARY KEY (CustomerID, PackageID))");
                    ps.executeUpdate();
                    
                    for (String packageId : selectedPackages) {
                        // Check if the package is already selected for the customer
                        ps = connection.prepareStatement("SELECT 1 FROM selected_packages WHERE CustomerID = ? AND PackageID = ?");
                        ps.setInt(1, customerId);
                        ps.setString(2, packageId);
                        rs = ps.executeQuery();
                        
                        if (!rs.next()) {
                            // If the package is not already selected, insert it
                            ps = connection.prepareStatement("INSERT INTO selected_packages (CustomerID, PackageID) VALUES (?, ?)");
                            ps.setInt(1, customerId);
                            ps.setString(2, packageId);
                            ps.executeUpdate();
                        }
                    }
                    
                    // Display selected packages and total cost
                    out.println("<table>");
                    out.println("<tr><th>Package</th><th>Cost (₹/month)</th></tr>");
                    for (String packageId : selectedPackages) {
                        String packageName = "";
                        int packageCost = 0;
                        switch (packageId) {
                            case "moviePackage":
                                packageName = "Movie Channels Package";
                                packageCost = 6;
                                break;
                            case "sportsPackage":
                                packageName = "Sports Channels Package";
                                packageCost = 9;
                                break;
                            case "kidsPackage":
                                packageName = "Kids Channels Package";
                                packageCost = 3;
                                break;
                            case "newsPackage":
                                packageName = "News Channels Package";
                                packageCost = 8;
                                break;
                            case "musicPackage":
                                packageName = "Music Channels Package";
                                packageCost = 5;
                                break;
                            case "entertainmentPackage":
                                packageName = "General Entertainment Channels Package";
                                packageCost = 10;
                                break;
                            case "spiritualPackage":
                                packageName = "Spiritual Channels Package";
                                packageCost = 2;
                                break;
                            case "golden":
                                packageName = "Cable Golden Package";
                                packageCost = 250;
                                break;
                            case "fullPackage":
                                packageName = "Full Package";
                                packageCost = 350;
                                break;
                        }
                        out.println("<tr><td>" + packageName + "</td><td>₹" + packageCost + "</td></tr>");
                    }
                    out.println("</table>");
                    out.println("<p><strong>Total Cost: ₹" + totalCost + "</strong></p>");
                    out.println("<script>setTimeout(function(){ window.location.href = 'search.jsp'; }, 3000);</script>");
                } else {
                    out.println("<p>Insufficient balance in distributor account.</p>");
                }
            } else {
                out.println("<p>Distributor not found.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error occurred: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (ps != null) try { ps.close(); } catch (SQLException ignore) {}
            if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
        }
    %>
</div>
</body>
</html>
