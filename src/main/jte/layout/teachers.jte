@import com.example.laba7.Entity.Teacher
@import java.util.List
@param List<Teacher> teachers


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teachers List</title>
</head>
<body>
<h1>Teachers List</h1>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
    </tr>
    </thead>
    <tbody>
    @for(Teacher teacher : teachers)
        <tr>
            <td>${teacher.getId()}</td>
            <td>${teacher.getName()}</td>
        </tr>
    @endfor
    </tbody>
</table>
</body>
</html>
