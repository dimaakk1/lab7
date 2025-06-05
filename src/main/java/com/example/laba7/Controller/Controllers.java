package com.example.laba7.Controller;

import com.example.laba7.Entity.Course;
import com.example.laba7.Entity.Teacher;
import com.example.laba7.Repository.TeacherRepository;
import com.example.laba7.Repository.CourseRepository;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class Controllers {

    private final TeacherRepository teacherRepository;
    private final CourseRepository courseRepository;

    @Autowired
    public Controllers(TeacherRepository teacherRepository, CourseRepository courseRepository) {
        this.teacherRepository = teacherRepository;
        this.courseRepository = courseRepository;
    }

    @GetMapping("/index")
    public String index() {
        return "layout/index";
    }

    @GetMapping("/teachers")
    public String getAllTeachers(Model model) {
        Iterable<Teacher> teachers = teacherRepository.findAll();
        model.addAttribute("teachers", teachers);

        return "layout/teachers";
    }

    /*@GetMapping("/courses")
    public String coursesList(@RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "asc") String sort,
            Model model) {

        List<Course> courses;

        if (sort.equalsIgnoreCase("desc")) {
            courses = courseRepository.findAllByOrderByTitleDesc();
        } else {
            courses = courseRepository.findAllByOrderByTitleAsc();
        }

        if (keyword != null && !keyword.isEmpty()) {
            courses = courseRepository.findByTitleContainingIgnoreCase(keyword);
        } else {
            courses = courseRepository.findAllByOrderByTitleDesc();
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("courses", courses);
        model.addAttribute("sortDirection", sort);

        return "layout/courses";
    }*/

    @GetMapping("/courses")
    public String coursesList(@RequestParam(required = false) String keyword,
                              @RequestParam(defaultValue = "asc") String sort,
                              Model model) {

        List<Course> courses;

        if (keyword != null && !keyword.isEmpty()) {
            // Пошук + сортування
            if (sort.equalsIgnoreCase("desc")) {
                courses = courseRepository.findByTitleContainingIgnoreCaseOrderByTitleDesc(keyword);
            } else {
                courses = courseRepository.findByTitleContainingIgnoreCaseOrderByTitleAsc(keyword);
            }
        } else {
            // Лише сортування
            if (sort.equalsIgnoreCase("desc")) {
                courses = courseRepository.findAllByOrderByTitleDesc();
            } else {
                courses = courseRepository.findAllByOrderByTitleAsc();
            }
        }

        model.addAttribute("keyword", keyword);
        model.addAttribute("courses", courses);
        model.addAttribute("sortDirection", sort);

        return "layout/courses";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model, HttpServletRequest request,
                                   @RequestParam(value = "error", required = false) String error) {
        CsrfToken csrfToken = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        model.addAttribute("_csrf", csrfToken);
        return "layout/register";
    }

    @GetMapping("/login")
    public String loginPage(Model model,
                            @RequestParam(value = "error", required = false) String error) {
        model.addAttribute("error", error != null);
        return "layout/login";
    }
}