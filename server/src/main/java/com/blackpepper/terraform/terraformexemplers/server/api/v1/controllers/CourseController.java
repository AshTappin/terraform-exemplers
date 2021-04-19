package com.blackpepper.terraform.terraformexemplers.server.api.v1.controllers;

import com.blackpepper.terraform.terraformexemplers.server.api.v1.model.CourseDetails;
import com.blackpepper.terraform.terraformexemplers.server.jpa.repositories.CourseRepository;
import org.springframework.core.convert.ConversionService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@RestController
@RequestMapping("/api/v1/courses")
public class CourseController {

    private final CourseRepository courseRepository;
    private final ConversionService conversionService;

    public CourseController(CourseRepository courseRepository, ConversionService conversionService) {
        this.courseRepository = courseRepository;
        this.conversionService = conversionService;
    }

    @GetMapping
    public List<CourseDetails> findCourses() {
        return StreamSupport.stream(courseRepository.findAll().spliterator(), false)
                .map(course -> conversionService.convert(course, CourseDetails.class))
                .collect(Collectors.toList());
    }
}
