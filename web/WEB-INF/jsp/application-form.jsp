<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        margin: 100px 150px 150px 200px;
    }

    .label {
        font-size: larger;
        color: rgba(0, 0, 0, 0.39);
    }
</style>

<div class="my-page">
    <h1><span class="badge badge-secondary">Заявка на поступление в летнюю школу OpenWay</span></h1>
    <form id="myForm" name="myForm" method="post" action="application-form" enctype="application/x-www-form-urlencoded">
        <input type="hidden" name="id" value=${person.id}>


        <div class="form-group">
            <div class="form-row">
                <div class="col" style="padding-bottom: 30px">
                    <label class="label" for="name" style="">Имя *</label>
                    <input class="form-control" id="name" name="name" placeholder="Имя" size="30">
                    <div id="nameAlert" class="alert alert-danger collapse">
                        Поле обязательно для заполнения
                    </div>
                </div>

                <div class="col" style="padding-bottom: 30px">
                    <label class="label" for="surname">Фамилия *</label>
                    <input class="form-control" id="surname" name="surname" placeholder="Фамилия" size="30">
                    <div id="surnameAlert" class="alert alert-danger collapse">
                        Поле обязательно для заполнения
                    </div>
                </div>
            </div>

            <label class="label" for="email">E-mail *</label>
            <input type="text" class="form-control" id="email" name="email" placeholder="email"
                   size="30">
            <div id="emailAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>

            <label class="label" for="birthday">Дата рождения *</label>
            <input class="form-control" id="birthday" name="birthday" placeholder="dd-MM-yyyy" maxlength="10">
            <div id="birthAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения, формат dd-MM-yyyy
            </div>

            <label class="label" for="phone">Телефон</label>
            <input class="form-control" id="phone" name="phone" placeholder="phone" size="30">
        </div>


        <label class="label">Чем Вам было бы интересно заниматься? *</label>
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
                <input type="checkbox" class="custom-control-input" id="7" name="7"
                       value="Участие в финтех-проектах">
                <label class="custom-control-label" for="7">Участие в финтех-проектах</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="8" name="8"
                       value="Работа с базами данных">
                <label class="custom-control-label" for="8">Работа с базами данных</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="9" name="9" value="Поддержка клиентов">
                <label class="custom-control-label" for="9">Поддержка клиентов</label>
            </div>
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="10" name="10"
                       value="Маркетинг в области IT">
                <label class="custom-control-label" for="10">Маркетинг в области IT</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="11" name="11"
                       value="Компьютерная безопасность">
                <label class="custom-control-label" for="11">Компьютерная безопасность</label>
            </div>

            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="12" name="12"
                       value="Другое (укажите в поле внизу)">
                <label class="custom-control-label" for="12">Другое (укажите в поле внизу)</label>
            </div>
            <div id="checkBoxAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>
        </div>


        <div class="form-group">
            <label class="label" for="comment">Ваши комментарии</label>
            <textarea class="form-control" itemtype="text" id="comment" rows="10" cols="140"
                      name="comment"></textarea>
        </div>

        <div class="form-group">
            <label class="label" for="skills">Расскажите о своих знаниях компьютерных технологий, прикладного ПО, языков
                программирования: *</label>
            <textarea class="form-control" itemtype="text" id="skills" rows="10" cols="140"
                      name="skills"></textarea>
            <div id="skillsAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>
        </div>

        <label class="label">Я планирую прийти на день открытых дверей и послушать презентацию Школы</label>
        <div class="custom-control custom-radio">
            <input type="radio" id="openDay1" name="openDay" class="custom-control-input" value="Да">
            <label class="custom-control-label" for="openDay1">Да</label>
        </div>

        <div class="custom-control custom-radio">
            <input type="radio" id="openDay2" name="openDay" class="custom-control-input" value="Нет">
            <label class="custom-control-label" for="openDay2">Нет</label>
        </div>

        <div class="form-group">
            <label class="label" for="univ">Университет *</label>
            <input type="text" class="form-control" id="univ" name="univ">
            <div id="univAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>
        </div>

        <div class="form-group">
            <label class="label" for="faculty">Факультет *</label>
            <input type="text" class="form-control" id="faculty" name="faculty">
            <div id="facultyAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>
        </div>

        <div class="form-group">
            <label class="label" for="dep">Кафедра *</label>
            <input type="text" class="form-control" id="dep" name="dep">
            <div id="depAlert" class="alert alert-danger collapse">
                Поле обязательно для заполнения
            </div>
        </div>

        <div class="form-group">
            <label class="label" for="year">Год поступления</label>
            <input type="text" class="form-control" id="year" name="year" maxlength="4">
        </div>

        <label class="label">Уровень английского языка *</label>
        <p><select itemtype="text" name="english" style="border-radius: 3px ">
            <option>Elementary</option>
            <option>Pre-Intermediate</option>
            <option>Intermediate</option>
            <option>Upper Intermediate</option>
            <option>Advanced</option>
        </select></p>
        <div id="englishAlert" class="alert alert-danger collapse">
            Поле обязательно для заполнения
        </div>

        <div class="form-group">
            <label class="label" for="exp">Опыт работы (если имеется)</label>
            <textarea class="form-control" itemtype="text" id="exp" rows="10" cols="140" name="exp"></textarea>
        </div>

        <div class="form-group">
            <label class="label" for="hearFrom"> Вы узнали о Летней школе?</label>
            <input type="text" class="form-control" id="hearFrom" name="hearFrom">
        </div>

        <div class="form-group agree">
            <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="agree" name="agree"
                       value="yes">
                <label class="custom-control-label" for="agree"> Отправляя эту форму, я соглашаюсь на обработку
                    своих
                    персональных данных, согласно с политике Конфиденциальности OpenWay*</label>
                <div id="agreeAlert" class="alert alert-danger collapse">
                    Поле обязательно для заполнения
                </div>
            </div>
        </div>


        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
    <button class="btn btn-primary" onclick="location.href='/'">Назад</button>

</div>
<script>
    $("form#myForm").on('submit', function (ev) {

        if ($(".questions input[type=checkbox]:checked").length === 0) {
            $('#checkBoxAlert').show();
            $('#9').trigger('focus');
            ev.preventDefault();
        }

        if ($("input[name=name]").val() === '') {
            $('#nameAlert').show();
            $('#name').trigger('focus');
            ev.preventDefault();
        }

        if ($("input[name=surname]").val() === '') {
            $('#surnameAlert').show();
            $('#surname').trigger('focus');
            ev.preventDefault();
        }


        if (!$("input[name=email]").val().match(/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/)) {
            $('#emailAlert').show();
            $('#email').trigger('focus');
            ev.preventDefault();
        }

        if (!$('input[name=birthday]').val().match(/(\d{2})-(\d{2})-(\d{4})/)) {
            $('#birthAlert').show();
            $('#birthday').trigger('focus');
            ev.preventDefault();
        } else {
            var birth = $("input[name=birthday]").val();
            var data = birth.split("-");
            if (isNaN(Date.parse(data[2] + "-" + data[1] + "-" + data[0]))) {
                $('#birthAlert').show();
                $('#birthday').trigger('focus');
                ev.preventDefault();
            }
        }

        if ($("textarea[name=skills]").val() === '') {
            $('#skillsAlert').show();
            $('#skills').trigger('focus');
            ev.preventDefault();
        }

        if ($("input[name=univ]").val() === '') {
            $('#univAlert').show();
            $('#univ').trigger('focus');
            ev.preventDefault();
        }

        if ($("input[name=faculty]").val() === '') {
            $('#facultyAlert').show();
            $('#faculty').trigger('focus');
            ev.preventDefault();
        }

        if ($("input[name=dep]").val() === '') {
            $('#depAlert').show();
            $('#dep').trigger('focus');
            ev.preventDefault();
        }

        if ($("select[name=english]").val() === '') {
            $('#englishAlert').show();
            ev.preventDefault();
        }


        if ($(".agree input[type=checkbox]:checked").length === 0) {
            $('#agreeAlert').show();
            ev.preventDefault();
        }

        setTimeout(function () {
            $('#agreeAlert').hide();
            $('#englishAlert').hide();
            $('#depAlert').hide();
            $('#facultyAlert').hide();
            $('#univAlert').hide();
            $('#skillsAlert').hide();
            $('#birthAlert').hide();
            $('#emailAlert').hide();
            $('#surnameAlert').hide();
            $('#nameAlert').hide();
            $('#checkBoxAlert').hide();
        }, 8000);
    });
</script>
</body>

</html>