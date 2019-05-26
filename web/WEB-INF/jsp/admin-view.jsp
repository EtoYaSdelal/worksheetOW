<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Administrator view</title>
</head>
<body>
<style>
    .view {
        margin: 50px;
    }

    .labelLeft, .labelRight {
        float: left;
        width: 50%;
    }

    .labelRight {
        text-align: right;
    }

    .labelLeft {
        font-size: larger;
        color: rgba(0, 0, 0, 0.39);
    }
</style>
<div class="view">

    <c:choose>
        <c:when test="${sessionScope.get('login') == null}">
            <jsp:forward page="/login"/>
        </c:when>
    </c:choose>


    <jsp:useBean id="personList" scope="request" type="java.util.List" class="java.util.ArrayList"/>
    <jsp:useBean id="dateFormatter" type="util.DateFormatter" class="util.DateFormatter"/>
    <label class="labelLeft">всего заявок: "${personList.size()}"
    </label> <label class="labelRight"><a href="/logout">выйти</a> </label>
    <table class="table table-borderless">
        <thead>
        <tr>
            <th><a href="admin-view?sort=byName">Имя</a></th>
            <th>почта</th>
            <th><a href="admin-view?sort=byDate">дата регистрации</a></th>
            <th></th>
        </tr>
        </thead>
        <c:forEach items="${personList}" var="person">
        <jsp:useBean id="person" type="model.Person"/>
        <tbody>
        <tr>
            <td>${person.surname}&#8194;${person.name}
            </td>
            <td>${person.email}
            </td>
            <td>${dateFormatter.nonStaticMyDateFormat(person.registrationDate)}
            </td>
            <td><a href="admin-view?id=${person.id}&action=detail">подробно</a></td>
            <td><a href="admin-view?id=${person.id}&action=delete">удалить</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <button style="margin-left: 30px" class="btn btn-primary" name="back" onclick='location.href="/"'>Назад</button>


</div>
</body>
</html>