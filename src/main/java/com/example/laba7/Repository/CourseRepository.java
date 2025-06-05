package com.example.laba7.Repository;

import com.example.laba7.Entity.Course;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CourseRepository extends CrudRepository<Course, Long> {
    List<Course> findAllByOrderByTitleAsc();
    List<Course> findAllByOrderByTitleDesc();
    List<Course> findByTitleContainingIgnoreCase(String keyword);
    List<Course> findByTitleContainingIgnoreCaseOrderByTitleAsc(String keyword);
    List<Course> findByTitleContainingIgnoreCaseOrderByTitleDesc(String keyword);
}
