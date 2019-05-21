<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <jsp:useBean id="person" type="model.Person" scope="request"/>
    <title>${person.surname}&#8194;${person.name}
    </title>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<section>

    <h5>Имя</h5>
    <p>${person.name}</p>
    <h5>Фамилия</h5>
    <p>${person.surname}</p>
    <h5>Почта</h5>
    <p>${person.email}</p>
    <h5>Дата рождения</h5>
    <p>${person.birthday.toString()}</p>
    <h5>Телефон</h5>
    <p>${person.phone}</p>

    <c:forEach items="${person.about}" var="about">
        <jsp:useBean id="about" type="java.util.Map.Entry<model.About, java.lang.String>"/>
        ${about.key.title}<br>
        ${about.value}<br>
    </c:forEach>
    <hr>
    <c:forEach items="${person.education}" var="edu">
        <jsp:useBean id="edu" type="java.util.Map.Entry<model.Education, java.lang.String>"/>
        ${edu.key.title}:&#8194;${edu.value}<br>
    </c:forEach>
    <hr>

    <c:forEach items="${person.other}" var="other">
        <jsp:useBean id="other" type="java.util.Map.Entry<model.Other, java.lang.String>"/>
        <c:choose>
            <c:when test="${other.key.name().equals('OPENDAY')}">
                ${other.key.title}&#8194;${other.value}<br>
            </c:when>
            <c:when test="${other.key.name().equals('HEARFROM')}">
                ${other.key.title}<br>
                ${other.value}<br>
            </c:when>
            <c:when test="${other.key.name().equals('AGREEMENT')}">
                ${other.key.title}
            </c:when>
        </c:choose>
    </c:forEach>
    <hr>

</section>
<jsp:include page="fragments/footer.jsp"/>
<button class="admin-view-css" name="admin" onclick='location.href="admin-view"'>назад</button>
</body>
</html>
