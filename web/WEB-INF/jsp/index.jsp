<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <title>Application</title>
</head>
<body>
<style>
    .index {
        width: 200px;
        padding: 10px;
        margin: 120px 120px 0px 550px;
    }
</style>
<div class="index">
    <button style="margin-bottom: 30px; margin-left: 11px" class="btn btn-primary" name="appform" onclick='location.href="application-form"'> подать заявку</button>
    <button class="btn btn-primary" name="admin" onclick='location.href="admin-view"'>просмотр заявок</button>
</div>
</body>
</html>
