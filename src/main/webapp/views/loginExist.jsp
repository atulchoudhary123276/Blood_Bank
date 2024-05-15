<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - BloodBank.in</title>
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

                .success-message {
                    color: #d9534f;
                    margin-bottom: 10px;
                    text-align: center;
                }

                .back-to-home {
                    text-align: center;
                    margin-top: 20px;
                }

                .back-to-home a {

                    text-decoration: none;
                    font-weight: bold;
                }

                .back-to-login a:hover {
                    text-decoration: underline;
                }

            a {
            cursor: pointer;
                text-decoration: none;
                font-weight: bold;
            }
        </style>

    </style>
</head>
<body>
    <header>
        <h1>BloodBank.in</h1>
    </header>

    <div class="container">
        <div class="success-message">
            <h3>Successfully Logged In !</h3>
        </div>
        <div class="back-to-home">
            <button><a href="/">Back to Home</a></button>
        </div>
    </div>
</body>
</html>
