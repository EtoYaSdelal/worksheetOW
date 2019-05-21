package web;

import dao.DAO;
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
    private DAO dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new DAO();
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
        //   Person person = new Person();
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String surname = req.getParameter("surname");
        String email = req.getParameter("email");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        LocalDate birthday = LocalDate.parse(req.getParameter("birthday"), formatter);
        String phone = req.getParameter("phone");
        Person person = new Person(id, name, surname, email, birthday);
        person.setPhone(phone);
        dao.save(person);
        resp.sendRedirect("/ow-summer-school-spb");
    }
}
