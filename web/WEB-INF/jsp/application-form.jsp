<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Application form</title>
    <jsp:useBean id="person" type="model.Person" scope="request"/>
</head>
<body>
<jsp:include page="fragments/header.jsp"/>
<section>
    ${person.id}
    <form method="post" action="application-form" enctype="application/x-www-form-urlencoded">
        <input type="hidden" name="id" value="${person.id}">

        <dl>
            <dt>Имя*</dt>
            <dd><input type="text" name="name" size="31"></dd>
        </dl>

        <dl>
            <dt>Фамилия*</dt>
            <dd><input type="text" name="surname" size="31"></dd>
        </dl>

        <dl>
            <dt>E-mail*</dt>
            <dd><input type="text" name="email"></dd>
        </dl>

        <dl>
            <dt>Дата рождения*</dt>
            <dd><input type="text" name="birthday"></dd>
        </dl>

        <dl>
            <dt>Мобильный телефон</dt>
            <dd><input type="text" name="phone" size="31"></dd>
        </dl>
        <button class="admin-view-css" type="submit">Сохранить</button>
        <button class="admin-view-css" onclick="window.history.back()">Отменить</button>
    </form>


</section>
<jsp:include page="fragments/footer.jsp"/>
</body>
</html>
