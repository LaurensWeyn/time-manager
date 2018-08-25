package com.capstone.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.capstone.db.dto.Event;
import com.capstone.db.dto.User;

public class EventDao
{
    private NamedParameterJdbcTemplate jdbc;
    private CourseDao courseDao;

    @Autowired
    public void setDatasource(DataSource datasource)
    {
        this.jdbc = new NamedParameterJdbcTemplate(datasource);
    }

    @Autowired
    public void setCourseDao(CourseDao courseDao)
    {
        this.courseDao = courseDao;
    }

    /**
     * Retrieves a list of all events for a given user
     * @param user the user to seach for
     * @return all events associated with that user
     */
    public List<Event> getAllEventsForUser(User user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        return jdbc.query("SELECT id, courseid, type, name, description, due, progress, color FROM events WHERE username = :username", paramSource, new RowMapper<Event>()
        {
            @Override
            public Event mapRow(ResultSet resultSet, int i) throws SQLException
            {
                Event event = new Event();
                event.setId(resultSet.getLong(1));
                event.setParentCourse(courseDao.getCourseByID(resultSet.getLong(2)));
                event.setType(resultSet.getInt(3));
                event.setName(resultSet.getString(4));
                event.setDescription(resultSet.getString(5));
                event.setDue(new Date(resultSet.getLong(6) * 1000L));
                event.setProgress(resultSet.getInt(7));
                event.setColor(resultSet.getInt(8));
                return event;
            }
        });
    }
    //TODO more specific date range searches

}
