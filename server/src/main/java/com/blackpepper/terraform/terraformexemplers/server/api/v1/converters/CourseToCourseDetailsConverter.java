package com.blackpepper.terraform.terraformexemplers.server.api.v1.converters;

import com.blackpepper.terraform.terraformexemplers.server.api.v1.model.CourseDetails;
import com.blackpepper.terraform.terraformexemplers.server.api.v1.model.ImmutableCourseDetails;
import com.blackpepper.terraform.terraformexemplers.server.jpa.entities.Course;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class CourseToCourseDetailsConverter implements Converter<Course, CourseDetails> {

    @Override
    public CourseDetails convert(Course course) {
        return ImmutableCourseDetails.builder()
                .id(course.getId())
                .name(course.getName())
                .build();
    }
}
