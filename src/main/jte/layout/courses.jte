@import com.example.laba7.Entity.Course
@import java.util.List
@param List<Course> courses


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Courses List</title>
</head>
<body>
<h1>Courses List</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Teacher</th>
    </tr>
    @for (Course course : courses)
        <tr>
            <td>${course.getId()}</td>
            <td>${course.getTitle()}</td>
            <td>${course.getTeacher().getName()}</td>
        </tr>
    @endfor
</table>
</body>
</html>
