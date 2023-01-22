<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="\webjars\bootstrap\5.2.3\css\bootstrap.min.css">
    <title>Welcome</title>
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
        <h1>Hello, ${name}</h1>
        <hr>
        <h1><a href="/list-todos">Manage</a> Your Todos </h1>
    </div>

    <script src="\webjars\bootstrap\5.2.3\js\bootstrap.min.js"></script>
    <script src="\webjars\jquery\3.6.3\jquery.min.js"></script>

</body>
</html>