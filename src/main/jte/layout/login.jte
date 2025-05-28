@param boolean error
@param org.springframework.security.web.csrf.CsrfToken _csrf

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Login</title>
    <style>
        body {
            background: #f0f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 320px;
        }
        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #34495e;
        }
        label {
            display: block;
            margin-bottom: 15px;
            font-weight: 600;
            color: #2c3e50;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        button {
            width: 100%;
            background-color: #2980b9;
            border: none;
            padding: 12px;
            font-size: 16px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 700;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #1c5980;
        }
        .error-message {
            color: #e74c3c;
            font-weight: 600;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>

<form method="post" action="/login">
    <h1>Login</h1>
    <div>
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required autofocus />
    </div>

    <div>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />
    </div>

    <input type="hidden" name="${_csrf.getParameterName()}" value="${_csrf.getToken()}" />

    <div>
        <button type="submit">Login</button>
    </div>
    @if (error)
        <div class="error-message">
            Invalid username or password
        </div>
    @endif
</form>

</body>
</html>
