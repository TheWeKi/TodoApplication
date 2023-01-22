<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="\webjars\bootstrap\5.2.3\css\bootstrap.min.css">
    <link rel="stylesheet" href="\webjars\bootstrap-datepicker\1.9.0\css\bootstrap-datepicker.standalone.min.css">
    <title>Todo</title>
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

        <h1>Enter Todo Details</h1> <hr>

        <%--@elvariable id="todo" type=""--%>
        <form:form action="" method="post" modelAttribute="todo">

<%--            <form:label path="id">ID</form:label>--%>
<%--            <form:input path="id" type="hidden"></form:input>--%>
<%--            <hr>--%>

<%--            <form:label path="username">Name</form:label>--%>
<%--            <form:input path="username" type="hidden"></form:input>--%>
<%--            <hr>--%>

            <form:label path="description">Description</form:label>
            <form:input path="description" type="text"></form:input>
            <form:errors path="description" cssClass="text-warning"></form:errors>
            <hr>

            <form:label path="targetDate">Target Date</form:label>
            <form:input path="targetDate" type="text" cssClass="datepicker"></form:input>
            <form:errors path="targetDate" cssClass="text-warning"></form:errors>

            <hr>
            <input type="submit" value="Done" class="btn btn-primary">
        </form:form>
        
    </div>


    <script src="\webjars\bootstrap\5.2.3\js\bootstrap.min.js"></script>
    <script src="\webjars\jquery\3.6.3\jquery.min.js"></script>
    <script src="\webjars\bootstrap-datepicker\1.9.0\js\bootstrap-datepicker.min.js"></script>

    <script>
        $('.datepicker').datepicker({
            format: 'yyyy/mm/dd'
        });
    </script>


</body>
</html>