@import com.example.laba7.Entity.Teacher
@param Iterable<Teacher> teachers

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Додати курс</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 500px;
            background: #fff;
            padding: 30px;
            margin: auto;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Додати новий курс</h2>
    <form action="/courses/addcourse" method="post">
        <label for="title">Назва курсу:</label>
        <input type="text" id="title" name="title" required>

        <label for="teacherId">Викладач:</label>
        <select id="teacherId" name="teacherId" required>
            @for(Teacher teacher : teachers) {
                <option value="${teacher.getId()}">${teacher.getName()}</option>
            }
            @endfor
        </select>

        <button type="submit">Додати курс</button>
        <a href="/index">На головну</a>
    </form>
</div>
</body>
</html>
