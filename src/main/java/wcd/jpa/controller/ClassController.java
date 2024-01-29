package wcd.jpa.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Classes;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/list-class")
public class ClassController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    public void init() throws ServletException {
        try{
            sessionFactory = new Configuration()
                    .configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            List<Classes> ls = session.createQuery("SELECT DISTINCT c FROM Classes c JOIN FETCH c.students",Classes.class)
                    .getResultList();
            req.setAttribute("classes",ls);
            session.getTransaction().commit();
            req.getRequestDispatcher("classes/list.jsp").forward(req,resp);
            return;
        }

    }


}