package com.capstone.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import com.capstone.util.CombinedSqlParameterSource;
import com.capstone.web.forms.EventForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.capstone.db.dto.Event;
import com.capstone.db.dto.User;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

public class EventDao
{
    private NamedParameterJdbcTemplate jdbc;
    private CourseDao courseDao;

    private RowMapper<Event> eventRowMapper = new RowMapper<Event>()
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
    };

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
     * @param user the user to search for
     * @return all events associated with that user
     */
    public List<Event> getAllEventsForUser(User user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        return jdbc.query("SELECT id, courseid, type, name, description, due, progress, color FROM events " +
                "WHERE username = :username " +
                "ORDER BY due", paramSource, eventRowMapper);
    }

    /**
     * Retrieves a list of all events within the given date range for a given user
     * @param user the user to search for
     * @param startDate the minimum date/time of events to return (inclusive)
     * @param endDate the maximun date/time of events to return (inclusive)
     * @return all events associated with that user that fall within the specified range
     */
    public List<Event> getEventsInRangeForUser(User user, Date startDate, Date endDate)
    {
        CombinedSqlParameterSource paramSource = new CombinedSqlParameterSource(user);
        paramSource.addValue("startDate", startDate.getTime() * 1000L);
        paramSource.addValue("endDate", endDate.getTime() * 1000L);
        return jdbc.query("SELECT id, courseid, type, name, description, due, progress, color FROM events " +
                "WHERE username = :username AND due >= :startDate AND due <= :endDate" +
                " ORDER BY due", paramSource, eventRowMapper);
    }

    public long createEvent(EventForm eventForm)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(eventForm);
        KeyHolder holder = new GeneratedKeyHolder();
        jdbc.update("INSERT INTO events(username, courseid, name, due, progress, description, type, color) " +
                "VALUES(:metaUsername, :metaCourseId, :name, :due, :progress, :description, :type, :color)",
                paramSource, holder, new String[]{"ID"});
        //noinspection ConstantConditions
        return holder.getKey().longValue();
    }

    /**
     * Edits an event already on the database
     * @param eventForm the form containing the updated information
     */
    public void editEvent(EventForm eventForm)
    {
        SqlParameterSource  paramSource = new BeanPropertySqlParameterSource(eventForm);
        jdbc.update("UPDATE events SET name = :name, due = :due, progress = :progress, description = :descroption, type = :type, color = :color WHERE id = :metaId", paramSource);
    }

    /**
     * Deletes an event by ID from the database if it exists.
     * @param eventID the id of the event to delete
     */
    public void deleteEvent(long eventID)
    {
        jdbc.update("DELETE FROM events WHERE id = :id", new MapSqlParameterSource("id", eventID));
    }


}
