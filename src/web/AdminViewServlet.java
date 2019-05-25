package web;

import dao.Dao;
import model.Person;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminViewServlet extends HttpServlet {
    private Dao dao;


    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new Dao();

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
        String sort = req.getParameter("sort");
        Person person;

        if ("byDate".equals(sort)) {
            req.setAttribute("personList", dao.getAllSortedByRegDate());
            req.getRequestDispatcher("/WEB-INF/jsp/admin-view.jsp").forward(req, resp);
        }

        if (action == null || "byName".equals(sort)) {
            req.setAttribute("personList", dao.getAllSortedByName());
            req.getRequestDispatcher("/WEB-INF/jsp/admin-view.jsp").forward(req, resp);
        }

        if ("detail".equals(action)) {
            person = dao.get(id);
            req.setAttribute("person", person);
            req.getRequestDispatcher("/WEB-INF/jsp/detail.jsp").forward(req, resp);
        }

        if ("delete".equals(action)) {
            dao.delete(id);
            req.setAttribute("personList", dao.getAllSortedByName());
            req.getRequestDispatcher("/WEB-INF/jsp/admin-view.jsp").forward(req, resp);
        }

    }


}