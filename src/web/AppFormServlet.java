package web;

import dao.Dao;
import model.About;
import model.Education;
import model.Other;
import model.Person;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class AppFormServlet extends HttpServlet {
    private Dao dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new Dao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Person person = new Person();
        req.setAttribute("person", person);
        req.getRequestDispatcher("/WEB-INF/jsp/application-form.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate birthday = LocalDate.parse(req.getParameter("birthday"), formatter);
        String phone = req.getParameter("phone");
        Person person = new Person(id, name, surname, email, birthday);
        if (!"".equals(phone)) {
            person.setPhone(phone);
        }

        StringBuilder interest = new StringBuilder();
        for (int i = 1; i <= 12; i++) {
            if (req.getParameter(String.valueOf(i)) != null) {
                interest.append("\n").append(req.getParameter(String.valueOf(i)));
            }
        }
        person.setAbout(About.INTEREST, interest.toString());

        if (req.getParameter("comment") != null) {
            person.setAbout(About.COMMENT, req.getParameter("comment"));
        }

        if (req.getParameter("skills") != null) {
            person.setAbout(About.SKILL, req.getParameter("skills"));
        }

        if (req.getParameter("openDay") != null) {
            person.setOther(Other.OPENDAY, req.getParameter("openDay"));
        }

        person.setEducation(Education.INSTITUTION, req.getParameter("univ"));
        person.setEducation(Education.FACULTY, req.getParameter("faculty"));
        person.setEducation(Education.DEPARTMENT, req.getParameter("dep"));
        person.setEducation(Education.ENTRYYEAR, req.getParameter("year"));
        person.setAbout(About.ENGLISH, req.getParameter("english"));

        if (req.getParameter("exp") != null) {
            person.setAbout(About.EXPERIENCE, req.getParameter("exp"));
        }
        if (req.getParameter("hearFrom") != null) {
            person.setOther(Other.HEARFROM, req.getParameter("hearFrom"));
        }
        person.setOther(Other.AGREEMENT, req.getParameter("agree"));

        dao.save(person);
        resp.sendRedirect("/main-page");
    }
}