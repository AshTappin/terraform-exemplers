package com.blackpepper.terraform.dbmigrator;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

import static java.lang.String.format;

@Configuration
public class MigrationConfiguration {

    @Value("${spring.liquibase.url}")
    private String liquibaseUrl;

    @PostConstruct
    public void afterConstruction() {
        LoggerFactory.getLogger(getClass()).warn(format("Migrating database: [%s]", liquibaseUrl));
    }
}
