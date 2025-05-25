package com.example.laba7.Controller;

import com.example.laba7.Entity.Teacher;
import com.example.laba7.Repository.TeacherRepository;
import com.example.laba7.Repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TeacherController {

    private final TeacherRepository teacherRepository;
    private final CourseRepository courseRepository;

    @Autowired
    public TeacherController(TeacherRepository teacherRepository, CourseRepository courseRepository) {
        this.teacherRepository = teacherRepository;
        this.courseRepository = courseRepository;
    }
    @GetMapping("/teachers")
    public String getAllTeachers(Model model) {
        Iterable<Teacher> teachers = teacherRepository.findAll();
        model.addAttribute("teachers", teachers);

        return "layout/teachers";
    }

    @GetMapping("/courses")
    public String coursesList(Model model) {
        model.addAttribute("courses", courseRepository.findAll());
        return "layout/courses";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "layout/register";
    }
}