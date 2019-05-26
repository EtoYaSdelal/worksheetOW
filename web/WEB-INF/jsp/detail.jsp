<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <jsp:useBean id="person" type="model.Person" scope="request"/>
    <jsp:useBean id="dateFormatter" type="util.DateFormatter" class="util.DateFormatter"/>
    <title>${person.surname}&#8194;${person.name}
    </title>
</head>
<body>

<style>
    .detail {
        margin: 50px;
    }

    .text {
        font-size: larger;
        color: rgba(0, 0, 0, 0.79);
    }

    .lowText {
        font-size: medium;
        color: rgba(0, 0, 0, 0.37);
    }

</style>

<c:choose>
    <c:when test="${sessionScope.get('login') == null}">
        <jsp:forward page="/login"/>
    </c:when>
</c:choose>

<div class="detail">
    <h1><span style="margin-bottom: 20px"
              class="badge badge-secondary">Заявка на поступление в летнюю школу OpenWay</span></h1>
    <h3><span class="badge badge-secondary">Имя</span></h3><label class="text">${person.name}</label>
    <h3><span class="badge badge-secondary">Фамилия</span></h3><label class="text">${person.surname}</label>
    <h4><span class="badge badge-secondary">Дата рождения</span></h4><label

        class="text">${dateFormatter.nonStaticMyDateFormat(person.birthday)}
</label>
    <h4><span class="badge badge-secondary">E-mail</span></h4><label class="text">${person.email}</label>
    <c:choose>
        <c:when test="${!person.phone.equals('')}">
            <h4><span class="badge badge-secondary">Телефон</span></h4><label class="text">${person.phone}</label>
        </c:when>
    </c:choose>
    <h4><span class="badge badge-secondary">Дата регистрации</span></h4><label
        class="text">${dateFormatter.nonStaticMyDateFormat(person.registrationDate)}
</label>
    <hr>
    <c:forEach items="${person.about}" var="about">
        <jsp:useBean id="about" type="java.util.Map.Entry<model.About, java.lang.String>"/>
        <h4><span class="badge badge-secondary">${about.key.title}</span></h4><label class="text">${about.value}</label>
    </c:forEach>
    <hr>
    <c:forEach items="${person.education}" var="edu">
        <jsp:useBean id="edu" type="java.util.Map.Entry<model.Education, java.lang.String>"/>
        <h4><span class="badge badge-secondary">${edu.key.title}</span></h4><label class="text">${edu.value}</label>
    </c:forEach>
    <hr>

    <c:forEach items="${person.other}" var="other">
        <jsp:useBean id="other" type="java.util.Map.Entry<model.Other, java.lang.String>"/>
        <c:choose>
            <c:when test="${other.key.name().equals('OPENDAY')}">
                <h5><span class="badge badge-secondary">${other.key.title}</span></h5><label
                    class="text">${other.value}</label>
            </c:when>
            <c:when test="${other.key.name().equals('HEARFROM')}">
                <h5><span class="badge badge-secondary">${other.key.title}</span></h5><label
                    class="text">${other.value}</label>
            </c:when>
            <c:when test="${other.key.name().equals('AGREEMENT')}">
                <br>
                <hr>
                <label class="lowText">${other.key.title}</label>
            </c:when>
        </c:choose>
    </c:forEach>
    <hr>


    <button class="btn btn-primary" name="admin" onclick='location.href="admin-view"'>назад</button>
</div>
</body>
</html>