<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }

        .user-details {
            margin-bottom: 20px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .user-details div {
            margin-bottom: 15px;
        }

        .back-button {
            text-align: center;
            margin-top: 20px;
        }

        .back-button a {
            text-decoration: none;
            font-weight: bold;
            color: #fff;
            padding: 10px 20px;
            background-color: #3498db;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #2980b9;
        }

        .request-button {
            text-align: left;
            margin-top: 20px;
        }

        .request-button a {
            text-decoration: none;
            font-weight: bold;
            color: #fff;
            padding: 10px 20px;
            background-color: #27ae60;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .request-button a:hover {
            background-color: #2ecc71;
        }

    </style>
</head>
<body>
    <div class="container">

           <c:if test="${donateResult !=null}">
           <p> ${donateResult}  </p>
           </c:if>

        <div class="request-button">
            <a href="/donorreceiverrequest">Donate/Accept Blood Request</a>
        </div>
        <div class="request-button">
            <a href="/dashboard/bloodrequests">Request Status</a>
        </div>
        <h3>Total Coins =${coinValue}</h3>
        <div class="back-button">
            <h2>${name} End User Logged In</h2>

        </div>

        <div class="user-details">
            <div>
                <label>Name:</label>
                <div>${name}</div>
            </div>
            <div>
                <label>Username:</label>
                <div>${userId}</div>
            </div>
            <div>
                <label>Created On:</label>
                <div>${createdOn}</div>
            </div>
            <div>
                <label>Created By:</label>
                <div>${createdBy}</div>
            </div>
            <div>
                <label>DOB:</label>
                <div>${dob}</div>
            </div>
            <div>
                <label>Blood Group:</label>
                <div>${bloodGroup}</div>
            </div>
        </div>

        <div class="back-button">
            <a href="logout">Log Out</a>
        </div>
    </div>
</body>
</html>
