package com.capstone.db.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import com.capstone.web.forms.CourseForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.User;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

/**
 * Manages course objects on the database
 */
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

    /**
     * Gets a list of all courses associated with a user
     * @param user the user
     * @return a list of all courses for that user
     */
    public List<Course> getCoursesForUser(User user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        return jdbc.query("SELECT id, code, name, priority, color FROM courses WHERE username = :username", paramSource, courseRowMapper);
    }

    /**
     * Get a course by its id on the database
     * @param id the ID of the timeslot
     * @return the course object allocated to that timeslot
     */
    public Course getCourseByID(long id)
    {
        SqlParameterSource paramSource = new MapSqlParameterSource("id", id);
        List<Course> result = jdbc.query("SELECT id, code, name, priority, color FROM courses WHERE id = :id", paramSource, courseRowMapper);
        if(result.size() == 1)
            return result.get(0);
        else
            return null;
    }

    /**
     * Registers a new course on the database
     * @param form a form containing details of the course to register
     * @return the id of the newly created course
     */
    public long createCourse(CourseForm form)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(form);
        KeyHolder holder = new GeneratedKeyHolder();
        jdbc.update("INSERT INTO courses(username, name, code, priority, color) VALUES(:metaUsername, :name, :courseCode, :priority, :color)", paramSource, holder, new String[]{"ID"});
        //noinspection ConstantConditions
        return holder.getKey().longValue();
    }

    /**
     * Edits a course already on the database
     * @param form the form containing the updated information
     */
    public void editCourse(CourseForm form)
    {
        SqlParameterSource  paramSource = new BeanPropertySqlParameterSource(form);
        jdbc.update("UPDATE courses SET name = :name, code = :courseCode, color = :color, priority = :priority WHERE id = :metaId", paramSource);
    }

}
