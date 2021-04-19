package com.blackpepper.terraform.terraformexemplers.server.api.v1.model;

import org.immutables.value.Value;

import java.util.UUID;

@Value.Immutable
public interface CourseDetails {

    UUID getId();

    String getName();

}
