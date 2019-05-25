<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="css/style.css">
    <title>Application</title>
</head>
<body>
<%--<jsp:include page="fragments/header.jsp"/>--%>
<section>
<button class="app-form-css" name="appform" onclick='location.href="application-form"'> подать заявку</button>
<br>
<br>
<!--<button class="admin-view-css" name="admin" onclick='location.href="sessions"'>просмотр заявок</button>-->
<button class="admin-view-css" name="admin" onclick='location.href="admin-view"'>просмотр заявок</button>
</section>
<%--<jsp:include page="fragments/footer.jsp"/>--%>
</body>
</html>
