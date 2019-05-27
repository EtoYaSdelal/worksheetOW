<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Login</title>
</head>
<body>
<style>
    .form {
        margin: 5% 40% 0 40%;

    }

    .btns {
        margin-left: 65px;
    }
</style>

<c:choose>
    <c:when test="${sessionScope.get('login') != null}">
        <jsp:forward page="/"/>
    </c:when>
</c:choose>


<div class="form">

    <form id="logForm" method="get" id="auth" action="login" enctype="application/x-www-form-urlencoded">

        <div class="form-group">
            <label for="login">Логин</label>
            <input type="text" class="form-control" id="login" placeholder="login" name="login">
        </div>

        <div class="form-group">
            <label for="pass">Пароль</label>
            <input type="password" class="form-control" id="pass" placeholder="password" name="pass">
        </div>

        <div class="btns">
            <button type="submit" class="btn btn-primary">Войти</button>
            <button type="button" class="btn btn-primary" onclick="location.href='/'">Назад</button>
        </div>
    </form>

</div>
</body>
</html>
