package wcd.jpa.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import wcd.jpa.entities.Classes;
import wcd.jpa.entities.Student;
import wcd.jpa.entities.Subject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/create-student")
public class StudentCreateController extends HttpServlet {
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
        List<Classes> classesList = new ArrayList<>();
        List<Subject> subjectList = new ArrayList<>();
        // query db
        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();
            classesList = session.createQuery("FROM Classes",Classes.class).getResultList();
            subjectList = session.createQuery("FROM Subject", Subject.class).getResultList();
            session.getTransaction().commit();
        }
        req.setAttribute("classesList",classesList);
        req.setAttribute("subjectList",subjectList);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Student student = new Student();
        student.setName(req.getParameter("name"));
        student.setEmail(req.getParameter("email"));
        student.setAddress(req.getParameter("address"));
        try(Session session = sessionFactory.openSession()){
            session.beginTransaction();
            // find Classes
            int classID = Integer.parseInt(req.getParameter("class_id"));
            Classes c = session.find(Classes.class,classID);
            student.setClasses(c);
            // find subjects
            List<Integer> s_ids = Arrays.stream(req.getParameterValues("subject_id[]"))
                    .map(Integer::parseInt).collect(Collectors.toList());
            Query<Subject> query = session.createQuery("FROM Subject WHERE id IN (:ids)", Subject.class);
            query.setParameter("ids", s_ids);
            List<Subject> subjects = query.getResultList();
            student.setSubjects(subjects);
            session.save(student);
            session.getTransaction().commit();
        }
        resp.sendRedirect("list-student");
    }


}