package wcd.jpa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import wcd.jpa.entities.Student;

import java.io.IOException;
import java.util.List;

@WebServlet(value="/list-student")
public class StudentController extends HttpServlet {
    private SessionFactory sessionFactory;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(Session session=sessionFactory.openSession()) {
            session.beginTransaction();
            List<Student> list=session.createQuery("FROM Student ",Student.class).getResultList();
            session.getTransaction().commit();
            req.setAttribute("students",list);
        }
        req.getRequestDispatcher("student/list.jsp").forward(req,resp);
    }

    @Override
    public void init() throws ServletException {
        try {
            sessionFactory= new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String entityId = req.getParameter("id");
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            Student student = session.get(Student.class, Integer.parseInt(entityId));
            if (student != null) {
                session.delete(student);
            }
            session.getTransaction().commit();
            resp.setStatus(200);
            return;
        }catch (Exception e){
            resp.setStatus(403);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }
}

