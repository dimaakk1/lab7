package com.example.laba7.Controller;

import com.example.laba7.Entity.Course;
import com.example.laba7.Entity.Teacher;
import com.example.laba7.Repository.CourseRepository;
import com.example.laba7.Repository.TeacherRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/courses")
public class CourseController {

    private final CourseRepository courseRepo;
    private final TeacherRepository teacherRepo;

    public CourseController(CourseRepository courseRepo, TeacherRepository teacherRepo) {
        this.courseRepo = courseRepo;
        this.teacherRepo = teacherRepo;
    }

    @GetMapping("/addcourse")
    public String showAddCoursePage(Model model) {
        model.addAttribute("teachers", teacherRepo.findAll());
        return "layout/addcourse";
    }

    @PostMapping("/addcourse")
    public String createCourse(@RequestParam String title,
                               @RequestParam Integer teacherId) {
        Teacher teacher = teacherRepo.findById(teacherId).orElseThrow();
        Course course = new Course();
        course.setTitle(title);
        course.setTeacher(teacher);
        courseRepo.save(course);
        return "redirect:/courses";
    }
}