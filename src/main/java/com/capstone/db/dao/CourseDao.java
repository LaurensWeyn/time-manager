package com.capstone.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.User;

public class CourseDao
{
    private NamedParameterJdbcTemplate jdbc;

    private static final RowMapper<Course> courseRowMapper = (resultSet, i) -> {
        Course course = new Course();
        course.setId(resultSet.getLong(1));
        course.setCode(resultSet.getString(2));
        course.setName(resultSet.getString(3));
        course.setPriority(resultSet.getInt(4));
        course.setColor(resultSet.getInt(5));
        return course;
    };

    @Autowired
    public void setDatasource(DataSource datasource)
    {
        this.jdbc = new NamedParameterJdbcTemplate(datasource);
    }

    public List<Course> getCoursesForUser(User user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        return jdbc.query("SELECT id, code, name, priority, color FROM courses WHERE username = :username", paramSource, courseRowMapper);
    }

    public Course getCourseForTimeslot(long timeslotID)
    {
        SqlParameterSource paramSource = new MapSqlParameterSource("id", timeslotID);
        List<Course> result = jdbc.query("SELECT id, code, name, priority, color FROM courses WHERE id = :id", paramSource, courseRowMapper);
        if(result.size() == 1)
            return result.get(0);
        else
            return null;
    }

}
