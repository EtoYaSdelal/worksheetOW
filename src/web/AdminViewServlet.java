package web;

import dao.DAO;
import model.Person;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminViewServlet extends HttpServlet {
    private DAO dao;


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new DAO();

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String action = req.getParameter("action");
        Person person;

        if (action == null) {
            req.setAttribute("personList", dao.getAll());
            req.getRequestDispatcher("/WEB-INF/jsp/admin-view.jsp").forward(req, resp);
        }

        if ("detail".equals(action)) {
            person = dao.get(id);
            req.setAttribute("person", person);
            req.getRequestDispatcher("/WEB-INF/jsp/detail.jsp").forward(req, resp);
        }

    }


}

