package com.capstone.db.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

import com.capstone.util.Time;
import com.capstone.db.dto.Timeslot;
import com.capstone.db.dto.User;

/**
 * In charge of managing Timeslot objects on the database.
 */
public class TimeslotDao
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
     * Finds a list of all timeslots for the given user.
     * @param user the relevant user
     * @return a list of all timeslots for all days of the week for the given user
     */
    public List<Timeslot> getAllTimeslotsForUser(User user)
    {
        SqlParameterSource paramSource = new BeanPropertySqlParameterSource(user);
        return jdbc.query("SELECT id, courseid, type, daysofweek, starttime, endtime, venue FROM timeslots WHERE username = :username", paramSource, new RowMapper<Timeslot>()
        {
            @Override
            public Timeslot mapRow(ResultSet resultSet, int i) throws SQLException
            {
                Timeslot timeslot = new Timeslot();
                timeslot.setId(resultSet.getLong(1));
                timeslot.setParentCourse(courseDao.getCourseByID(resultSet.getLong(2)));
                timeslot.setType(resultSet.getInt(3));
                timeslot.setDaysOfWeek(resultSet.getString(4));
                timeslot.setStartTime(new Time(resultSet.getInt(5)));
                timeslot.setEndTime(new Time(resultSet.getInt(6)));
                timeslot.setVenue(resultSet.getString(7));
                return timeslot;
            }
        });
    }

    /**
     * Gets all timeslots on a specific day of the week for a certain user
     * @param user the user to search for
     * @param dayOfWeek the day of the week (0 for monday to 6 for sunday)
     * @return a list of the relevant Timeslots
     */
    public List<Timeslot> getAllTimeslotsForDayOfWeek(User user, int dayOfWeek)
    {
        if(dayOfWeek >= 7 || dayOfWeek < 0)
            throw new IllegalArgumentException("Invalid dayOfWeek number: " + dayOfWeek);
        List<Timeslot> all = getAllTimeslotsForUser(user);//TODO this could be more efficient
        List<Timeslot> match = new ArrayList<>();
        for(Timeslot slot:all)
            if(slot.isOnDay(dayOfWeek))
                match.add(slot);
        return match;
    }

}
