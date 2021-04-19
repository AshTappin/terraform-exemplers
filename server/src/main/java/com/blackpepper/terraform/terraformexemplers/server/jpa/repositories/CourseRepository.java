package com.blackpepper.terraform.terraformexemplers.server.jpa.repositories;

import com.blackpepper.terraform.terraformexemplers.server.jpa.entities.Course;
import org.springframework.data.repository.CrudRepository;

import java.util.UUID;

public interface CourseRepository extends CrudRepository<Course, UUID> {


}
