<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LoginError - BloodBank.in</title>
    <style>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 400px;
                margin: 50px auto;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            h1, h2 {
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

            button {

                    color: white;
                    border: none;
                    padding: 12px 20px;
                    font-size: 16px;
                    border-radius: 5px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                button:hover {
                    background-color: #c9302c;
                }

                .error-message {
                    color: #d9534f;
                    margin-bottom: 10px;
                    text-align: center;
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

            a {
                text-decoration: none;
                font-weight: bold;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>

    </style>
</head>
<body>
    <header>
        <h1>BloodBank.in</h1>
    </header>

    <div class="container">
        <div class="error-message">
            <h3>Login failed. Please check password and try again.</h3>
         <c:if test="${loginAttemp!=0}">
            <h3>you have only ${3-loginAttemp} attempts left</h3>
        </div>
        </c:if>
        <div class="back-to-login">
            <button><a href="login">Back to Login</a></button>
        </div>
    </div>
</body>
</html>
