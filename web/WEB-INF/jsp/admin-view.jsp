<%@ page import="model.Person" %>
<%@ page import="util.DateFormatter" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Administrator view</title>
</head>
<body>
<%--<jsp:include page="fragments/header.jsp"/>--%>
<section>

    </p>
    <table class="greyGridTable" border="1" cellpadding="8" cellspacing="0">
        <tr>
            <th><a href="admin-view?sort=byName">Имя</a></th>
            <th>почта</th>
            <th><a href="admin-view?sort=byDate">дата регистрации</a></th>
            <th></th>
        </tr>
        <c:forEach items="${personList}" var="person">
            <jsp:useBean id="person" type="model.Person"/>
            <tr>
                <td>${person.surname}&#8194;${person.name}
                </td>

                <td>${person.email}
                </td>
                <td><%=DateFormatter.myDateFormat(person.getRegistrationDate())%>
                </td>
                <td><a href="admin-view?id=${person.id}&action=detail">подробно</a></td>
                <td><a href="admin-view?id=${person.id}&action=delete">удалить</a></td>
            </tr>
        </c:forEach>
    </table>
    <h1 class="text-css">всего заявок: <%=((List<Person>) request.getAttribute("personList")).size()%>
    </h1>
</section>
<%--<jsp:include page="fragments/header.jsp"/>--%>
<button class="admin-view-css" name="back" onclick='location.href="/"'>назад</button>
</body>
</html>