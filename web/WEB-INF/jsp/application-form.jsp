<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%-- <link rel="stylesheet" href="css/style.css">--%>
    <title>Application form</title>
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <jsp:useBean id="person" type="model.Person" scope="request"/>
</head>
<body>
<style>
    .my-page {
        margin: 50px;
    }
</style>
${person.id}
<div class="my-page">
    <form id="myForm" name="myForm" method="post" action="application-form" enctype="application/x-www-form-urlencoded">
        <input type="hidden" name="id" value=${person.id}>

        <div class="form-group">
            <label for="name">Имя*</label>
            <input class="form-control" required id="name" name="name" placeholder="Имя" size="30">

            <label for="surname">Фамилия*</label>
            <input class="form-control" required id="surname" name="surname" placeholder="Фамилия" size="30">

            <label for="email">E-mail*</label>
            <input type="email" class="form-control" required id="email" name="email" placeholder="email" size="30">

            <label for="birthday">Дата рождения*</label>
            <input class="form-control" required id="birthday" name="birthday" placeholder="dd-MM-yyyy" size="9">

            <label for="phone">Фамилия*</label>
            <input class="form-control" required id="phone" name="phone" placeholder="phone" size="30">
        </div>


        <label>Чем Вам было бы интересно заниматься?*</label>
        <div class="form-group questions">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="1" name="1"
                       value="Бизнес-анализ, IT-консалтинг">
                <label class="custom-control-label" for="1">Бизнес-анализ, IT-консалтинг</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="2" name="2" value="Backend-разработка">
                <label class="custom-control-label" for="2">Backend-разработка</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="3" name="3" value="Frontend-разработка">
                <label class="custom-control-label" for="3">Frontend-разработка</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="4" name="4"
                       value="Тестирование, управление качеством">
                <label class="custom-control-label" for="4">Тестирование, управление качеством</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="5" name="5"
                       value="Создание технической документации">
                <label class="custom-control-label" for="5">Создание технической документации</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="6" name="6"
                       value="Внедрение сложного ПО (enterprise)">
                <label class="custom-control-label" for="6">Внедрение сложного ПО (enterprise)</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="7" name="7" value="Участие в финтех-проектах">
                <label class="custom-control-label" for="7">Участие в финтех-проектах</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="8" name="8" value="Работа с базами данных">
                <label class="custom-control-label" for="8">Работа с базами данных</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="9" name="9" value="Поддержка клиентов">
                <label class="custom-control-label" for="9">Поддержка клиентов</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="10" name="10" value="Маркетинг в области IT">
                <label class="custom-control-label" for="10">Маркетинг в области IT</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="11" name="11" value="Компьютерная безопасность">
                <label class="custom-control-label" for="11">Компьютерная безопасность</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="12" name="12"
                       value="Другое (укажите в поле внизу)">
                <label class="custom-control-label" for="12">Другое (укажите в поле внизу)</label>
            </div>
        </div>


        <p><b>Ваши комментарии</b></p>
        <p><textarea rows="10" cols="160" name="comment"></textarea></p>


        <p><b>Расскажите о своих знаниях компьютерных технологий, прикладного ПО, языков программирования: *</b></p>
        <p><textarea required rows="10" cols="160" name="skills"></textarea></p>

        <div class="form-check">
            <p><b>Я планирую прийти на день открытых дверей и послушать презентацию Школы</b></p>
            <p><input required type="radio" name="openday" value="Да">Да</p>
            <p><input type="radio" name="openday" value="Нет">Нет</p>
        </div>
        <p><b>Университет *</b></p>
        <p><input required type="text" name="univ" size="31"></p>

        <p><b>Факультет *</b></p>
        <p><input required type="text" name="faculty" size="31"></p>

        <p><b>Кафедра *</b></p>
        <p><input required type="text" name="dep" size="31"></p>

        <p><b>Год поступления</b></p>
        <p><input type="text" name="year" size="31"></p>

        <p><b>Уровень английского языка *</b></p>
        <p><select required name="english">
            <option>Elementary</option>
            <option>Pre-Intermediate</option>
            <option>Intermediate</option>
            <option>Upper Intermediate</option>
            <option>Advanced</option>
        </select></p>

        <p><b>Опыт работы (если имеется)</b></p>
        <p><textarea rows="10" cols="160" name="exp"></textarea></p>

        <p><b>Откуда Вы узнали о Летней школе?</b></p>
        <input name="hearfrom" type="text" size="30">
        <br>
        <br>

        <div class="form-group agree">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="agree" name="agree"
                       value="yes">
                <label class="custom-control-label" for="agree"> Отправляя эту форму, я соглашаюсь на обработку своих
                    персональных данных, согласно с политике Конфиденциальности OpenWay*</label>
            </div>
        </div>


        <div class="error">

        </div>
        <button class="admin-view-css" type="submit">Сохранить</button>
    </form>
    <button class="admin-view-css" onclick="location.href='/'">Отменить</button>


</div>

<%--<script>

    $("form#myForm").submit(function (ev) {
        if ($(":checkbox:checked").length === 0) {
            ev.preventDefault();
            $(".error").text("Поля отмеченные * обязательны для заполнения?");
        }
    });
</script>--%>


<script>
    $("form#myForm").submit(function (ev) {

        var errorText = [];

        if ($(".questions input[type=checkbox]:checked").length === 0) {
            ev.preventDefault();
            errorText.push("А чекбокс выбрать?");
        }

        if ($("input[name=name]").val() === '') {
            ev.preventDefault();
            errorText.push("Введите имя");
        }

        if ($("input[name=surname]").val() === '') {
            ev.preventDefault();
            errorText.push("Введите фамилия");
        }

        if ($(".agree input[type=checkbox]:checked").length === 0) {
            ev.preventDefault();
            $(".error").text("Поля отмеченные * обязательны для заполнения?")
        }

        // if (errorText) {
        //     ev.preventDefault();
        //     $(".error").text(errorText);
        // }

    });
</script>
</body>

</html>