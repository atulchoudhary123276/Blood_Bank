<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            height:90%;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        h1,h2{
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

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="email"],
        select,
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
         .back-to-login {
          text-align: center;
          margin-top: 20px;
           }

            .back-to-login a {
            text-decoration: none;
             font-weight: bold;
             }
            .back-to-login a:hover {
                text-decoration: underline;
             }

    </style>
</head>
<body>
<h1>BloodBank.in</h1>
    <div class="container">

        <span><h2>User Signup<c:if test="${role eq 'AGENT'}">
          <p>By Agent</p>
           </c:if></h2>
        </span>
        <form action="register" method="post" id="signupForm">
            <label for="userName">Username:</label>
            <input type="text" id="userName" name="userName" required>

           <label for="name">Name:</label>
           <input type="text" id="name" name="name" required>

            <label for="dob">DOB:</label>
           <input type="date" id="dob" name="dob" max="2024-03-11" required>

            <label for="bloodGroup">Blood Group:</label>
            <select id="bloodGroup" name="bloodGroup" required>
                <option value="" disabled selected>Select Blood Group</option>
                <option value="A+">A+</option>
                <option value="A-">A-</option>
                <option value="B+">B+</option>
                <option value="B-">B-</option>
                <option value="AB+">AB+</option>
                <option value="AB-">AB-</option>
                <option value="O+">O+</option>
                <option value="O-">O-</option>
            </select>
            <c:choose>
                   <c:when test="${role eq 'AGENT'}">
                   <input type="hidden" id="password" name="password" value="abc">
                   </c:when>
                    <c:otherwise>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                    </c:otherwise>
                    </c:choose>
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            <input type="submit" value="Sign Up">
        </form>
        <div th:if="${successMessage}" class="alert alert-success">
            <strong>${successMessage}</strong>
        </div>
        <div class="back-to-login">
                   <span> <button><a href="login">Back to Login</a></button>
                   <button><a href="/">Back to Home</a></button>
                   </span>
        </div>
        <br/>

    </div>


</body>
</html>
