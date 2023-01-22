<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="\webjars\bootstrap\5.2.3\css\bootstrap.min.css">

    <title>All Todos</title>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/list-todos">Todos</a>
                </li>
            </ul>
        </div>
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/logout">Log Out</a>
            </li>
        </ul>
    </nav>



    <div class="container">
        <h1>Your Todos</h1> <hr>

        <table class="table">
            <thead>
                <tr>
                    <th>Description</th>
                    <th>Target Date</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${todos}" var="todo">
                    <tr>
                        <td>${todo.description}</td>
                        <td>${todo.targetDate}</td>
                        <td><a href="update-todo?id=${todo.id}" class="btn btn-success">Update</a> </td>
                        <td><a href="delete-todo?id=${todo.id}" class="btn btn-danger">Delete</a> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <a href="add-todo" class="btn btn-primary">Add</a>
    </div>


    <script src="\webjars\bootstrap\5.2.3\js\bootstrap.min.js"></script>
    <script src="\webjars\jquery\3.6.3\jquery.min.js"></script>

</body>
</html>