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

    .label-default {
        font-size: x-large;

    }

    .textx {
        margin-left: 20px;
        font-size: larger;
        color: rgba(0, 0, 0, 0.79);
    }

</style>

<c:choose>
    <c:when test="${sessionScope.get('login') == null}">
        <jsp:forward page="/login"/>
    </c:when>
</c:choose>

<div class="detail">
    <h1><span style="margin-bottom: 20px"
              class="label label-default">Заявка на поступление в летнюю школу OpenWay</span></h1>
    <span class="label label-default">Имя:</span><label class="textx"> ${person.name}</label><br>

    <span class="label label-default">Фамилия:</span><label class="textx">${person.surname}</label><br>

    <span class="label label-default">Дата рождения:</span><label
        class="textx">${dateFormatter.nonStaticMyDateFormat(person.birthday)}
</label><br>

    <span class="label label-default">E-mail:</span><label class="textx">${person.email}</label><br>
    <c:choose>
        <c:when test="${!person.phone.equals('')}">
            <span class="label label-default">Телефон:</span><label class="textx">${person.phone}</label><br>
        </c:when>
    </c:choose>
    <span class="label label-default">Дата регистрации:</span><label
        class="textx">${dateFormatter.nonStaticMyDateFormat(person.registrationDate)}
</label><br>
    <hr>
    <c:forEach items="${person.about}" var="about">
        <jsp:useBean id="about" type="java.util.Map.Entry<model.About, java.lang.String>"/>
        <c:choose>
            <c:when test="${about.key.name().equals('INTEREST')}">
                <span class="label label-default">${about.key.title}</span><br>
                <c:forEach items="${about.value.split('\\\n')}" var="interest">
                    <jsp:useBean id="interest" type="java.lang.String" class="java.lang.String"/>
                    <label class="text">${interest}</label><br>
                </c:forEach>
            </c:when>

            <c:when test="${about.key.name().equals('COMMENT') && !about.value.equals('')}">
                <span class="label label-default">${about.key.title}</span><br>
                <label class="text">${about.value}</label><br>
            </c:when>

            <c:when test="${about.key.name().equals('SKILL') && !about.value.equals('')}">
                <span class="label label-default">${about.key.title}</span><br>
                <label class="text">${about.value}</label><br>
            </c:when>

            <c:when test="${about.key.name().equals('EXPERIENCE') && !about.value.equals('')}">
                <span class="label label-default">${about.key.title}</span><br>
                <label class="text">${about.value}</label><br>
            </c:when>

            <c:when test="${about.key.name().equals('ENGLISH') && !about.value.equals('')}">
                <span class="label label-default">${about.key.title}:</span>
                <label class="textx">${about.value}</label><br>
            </c:when>

        </c:choose>

    </c:forEach>
    <hr>
    <c:forEach items="${person.education}" var="edu">
        <jsp:useBean id="edu" type="java.util.Map.Entry<model.Education, java.lang.String>"/>
        <c:choose>
            <c:when test="${edu.key.name().equals('INSTITUTION') && !edu.value.equals('')}">
                <span class="label label-default">${edu.key.title}:</span>
                <label class="textx">${edu.value}</label><br>
            </c:when>

            <c:when test="${edu.key.name().equals('FACULTY') && !edu.value.equals('')}">
                <span class="label label-default">${edu.key.title}:</span>
                <label class="textx">${edu.value}</label><br>
            </c:when>

            <c:when test="${edu.key.name().equals('DEPARTMENT') && !edu.value.equals('')}">
                <span class="label label-default">${edu.key.title}:</span>
                <label class="textx">${edu.value}</label><br>
            </c:when>

            <c:when test="${edu.key.name().equals('ENTRYYEAR') && !edu.value.equals('')}">
                <span class="label label-default">${edu.key.title}:</span>
                <label class="textx">${edu.value}</label><br>
            </c:when>
        </c:choose>
    </c:forEach>
    <hr>

    <c:forEach items="${person.other}" var="other">
        <jsp:useBean id="other" type="java.util.Map.Entry<model.Other, java.lang.String>"/>
        <c:choose>

            <c:when test="${other.key.name().equals('HEARFROM') && !other.value.equals('')}">
                <span class="label label-default">${other.key.title}</span> <br>
                <label
                        class="text">${other.value}</label><br>
            </c:when>

            <c:when test="${other.key.name().equals('OPENDAY')}">
                <span class="label label-default">${other.key.title}</span>
                <label class="textx">${other.value}</label><br>
            </c:when>

            <c:when test="${other.key.name().equals('AGREEMENT')}">
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