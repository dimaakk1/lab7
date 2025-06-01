@import com.example.laba7.Entity.Teacher
@import java.util.List
@param List<Teacher> teachers

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Teachers List</title>
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
    </style>
</head>
<body>
<h1>Teachers List</h1>
<table>
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
