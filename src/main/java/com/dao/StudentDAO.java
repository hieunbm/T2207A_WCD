package com.dao;

import entities.Student;

import java.util.List;

public class StudentDAO implements DAOInterface<Student>  {
    @Override
    public List<Student> get() {
        return null;
    }

    @Override
    public boolean create(Student student) {
        return false;
    }

    @Override
    public boolean update(Student student) {
        return false;
    }

    @Override
    public boolean delete(Student student) {
        return false;
    }

    @Override
    public <K> Student find(K id) {
        return null;
    }
}
