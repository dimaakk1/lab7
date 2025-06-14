@import com.example.laba7.Entity.Course
@import java.util.List
@param List<Course> courses
@param String sortDirection
@param String keyword

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Courses List</title>
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
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 14px 20px;
            text-align: left;
        }
        thead {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }
        tbody tr:nth-child(even) {
            background-color: #f2f6fc;
        }
        tbody tr:hover {
            background-color: #d0e4ff;
        }
        .controls {
            width: 80%;
            margin: 0 auto 20px auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .sort-link {
            background-color: #2980b9;
            color: white;
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            user-select: none;
        }
        .sort-link:hover {
            background-color: #1f6391;
        }
        form.search-form {
            display: flex;
            gap: 10px;
        }
        form.search-form input[type="text"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 1em;
            width: 250px;
            box-shadow: inset 0 1px 3px rgba(0,0,0,0.1);
            transition: border-color 0.3s ease;
        }
        form.search-form input[type="text"]:focus {
            border-color: #2980b9;
            outline: none;
        }
        form.search-form button {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
            user-select: none;
        }
        form.search-form button:hover {
            background-color: #1f6391;
        }
    </style>
</head>
<body>
<h1>Courses List</h1>
<div class="controls">
    <a class="sort-link" href="/courses?sort=${sortDirection.equals("asc") ? "desc" : "asc"}${keyword != null && !keyword.isEmpty() ? "&keyword=" + keyword : ""}">
        Сортувати за назвою (${sortDirection.equals("asc") ? " спаданням" : " зростанням"})
    </a>

    <form class="search-form" method="get" action="/courses">
        <input type="text" name="keyword" placeholder="Пошук за назвою" value="${keyword != null ? keyword : ""}" />
        <input type="hidden" name="sort" value="${sortDirection != null ? sortDirection : "asc"}" />
        <button type="submit">Шукати</button>
    </form>
</div>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Teacher</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    @for (Course course : courses)
        <tr>
            <td>${course.getId()}</td>
            <td>${course.getTitle()}</td>
            <td>${course.getTeacher().getName()}</td>
            <td>
                <a href="/courses/edit/${course.getId()}">Edit</a>
            </td>
            <td>
                <button onclick="confirmDelete(${course.getId()})">Видалити</button>

                <form id="delete-form-${course.getId()}" action="/courses/delete" method="post" style="display: none;">
                    <input type="hidden" name="id" value="${course.getId()}">
                </form>
            </td>

        </tr>
    @endfor
    </tbody>
</table>
<script>
    function confirmDelete(courseId) {
        if (confirm("Ви впевнені, що хочете видалити цей курс?")) {
            document.getElementById('delete-form-' + courseId).submit();
        }
    }
</script>
</body>
</html>
