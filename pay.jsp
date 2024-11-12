<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay - MyCable</title>
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
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .content h2 {
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group button:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 20px;
            font-size: 16px;
            color: red;
        }

        .message.success {
            color: green;
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
    <h2>Update Distributor Balance</h2>
    <form method="post" action="pay.jsp">
        <div class="form-group">
            <label for="cardNumber">Card Number</label>
            <input type="text" id="cardNumber" name="cardNumber" required>
        </div>
        <div class="form-group">
            <label for="cardHolderName">Card Holder Name</label>
            <input type="text" id="cardHolderName" name="cardHolderName" required>
        </div>
        <div class="form-group">
            <label for="expiryDate">Expiry Date (MM/YY)</label>
            <input type="text" id="expiryDate" name="expiryDate" required>
        </div>
        <div class="form-group">
            <label for="cvv">CVV</label>
            <input type="text" id="cvv" name="cvv" required>
        </div>
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="text" id="amount" name="amount" required>
        </div>
        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>

    <%
        if ("post".equalsIgnoreCase(request.getMethod())) {
            String cardNumber = request.getParameter("cardNumber");
            String cardHolderName = request.getParameter("cardHolderName");
            String expiryDate = request.getParameter("expiryDate");
            String cvv = request.getParameter("cvv");
            String amountStr = request.getParameter("amount");

            if (cardNumber == null || cardHolderName == null || expiryDate == null || cvv == null || amountStr == null ||
                cardNumber.trim().isEmpty() || cardHolderName.trim().isEmpty() || expiryDate.trim().isEmpty() || cvv.trim().isEmpty() || amountStr.trim().isEmpty()) {
                out.println("<div class='message'>All fields are required.</div>");
            } else {
                try {
                    double amount = Double.parseDouble(amountStr);

                    // Predefined valid card details
                    String validCardNumber = "123456789";
                    String validCardHolderName = "K lokesh";
                    String validExpiryDate = "04/25";
                    String validCvv = "699";

                    if (cardNumber.equals(validCardNumber) &&
                        cardHolderName.equals(validCardHolderName) &&
                        expiryDate.equals(validExpiryDate) &&
                        cvv.equals(validCvv)) {

                        // Assume a current balance and update it
                        double currentBalance = 1000.00;
                        double newBalance = currentBalance + amount;

                        out.println("<div class='message success'>Balance updated successfully. New balance: ₹" + newBalance + "</div>");
                        out.println("<script>setTimeout(function(){ window.location.href = 'search.jsp'; }, 3000);</script>");
                    } else {
                        out.println("<div class='message'>Card details do not match our records.</div>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<div class='message'>Invalid amount format.</div>");
                }
            }
        }
    %>
</div>

</body>
</html>
