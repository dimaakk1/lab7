<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Register</title>
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
        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 10px 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus, input[type="password"]:focus, select:focus {
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
    </style>
</head>
<body>
<form action="/api/register" method="post">
    <h1>Registration Form</h1>
    <label>
        Username:
        <input type="text" name="username" required autocomplete="off" />
    </label>
    <label>
        Password:
        <input type="password" name="password" required autocomplete="new-password" />
    </label>
    <label>
        Role:
        <select name="role" required>
            <option value="USER">User</option>
            <option value="ADMIN">Admin</option>
        </select>
    </label>
    <button type="submit">Register</button>
</form>
</body>
</html>
