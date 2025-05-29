<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8" />
    <title>Головна сторінка</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f7f9fc;
            color: #333;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 25px;
        }

        nav ul li {
            display: inline;
        }

        nav ul li a {
            text-decoration: none;
            color: #3498db;
            font-weight: 600;
            font-size: 18px;
            padding: 8px 15px;
            border: 2px solid transparent;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #3498db;
            color: white;
            border-color: #2980b9;
        }
    </style>
</head>
<body>
<h1>Головна сторінка</h1>

<nav>
    <ul>
        <li><a href="/teachers">Викладачі</a></li>
        <li><a href="/courses">Курси</a></li>
        <li><a href="/register">Реєстрація користувача</a></li>
        <li><a href="/login">Авторизація</a></li>
        <li><a href="/courses/addcourse">Додати новий курс</a></li>
    </ul>
</nav>
</body>
</html>