@import com.example.laba7.Entity.Course
@import com.example.laba7.Entity.Teacher
@param Course course
@param Iterable<Teacher> teachers

<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Редагувати курс</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f9fafb;
            margin: 20px;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }
        form {
            width: 60%;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #2c3e50;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            background-color: #2980b9;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        button:hover {
            background-color: #1f6690;
        }
        a {
            display: block;
            margin-top: 15px;
            text-align: center;
            color: #2980b9;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h1>Редагувати курс</h1>

<form action="/courses/edit/${course.getId()}" method="post">
    <label for="title">Назва курсу:</label>
    <input type="text" id="title" name="title" value="${course.getTitle()}" required>

    <label for="teacherId">Викладач:</label>
    <select id="teacherId" name="teacherId" required>
        @for(Teacher teacher : teachers) {
            <option value="${teacher.getId()}" selected="${teacher.getId() == course.getTeacher().getId()}">
                ${teacher.getName()}
            </option>
        }@endfor
    </select>

    <button type="submit">Зберегти зміни</button>
</form>

<a href="/courses">Назад до списку</a>
</body>
</html>
