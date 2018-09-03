package com.capstone.db.dao;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.Event;
import com.capstone.db.dto.User;
import com.capstone.web.forms.CourseForm;
import com.capstone.web.forms.EventForm;
import com.capstone.web.forms.UserForm;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ActiveProfiles("testing")
@ContextConfiguration(locations={"classpath:spring/beans.xml", "classpath:spring/securityContext.xml"})
public class EventDaoTest
{

    @Autowired
    public UserDao userDao;
    @Autowired
    public EventDao eventDao;
    @Autowired
    public CourseDao courseDao;

    @Autowired
    public DataSource datasource;


    private User user1;
    private User user2;
    private Course course1;
    private Course course2;
    private Course course3;

    @Before
    public void cleanDB() throws SQLException
    {
        Connection connection = datasource.getConnection();
        connection.createStatement().execute("DELETE FROM events");
        connection.createStatement().execute("DELETE FROM courses");
        connection.createStatement().execute("DELETE FROM authorities");
        connection.createStatement().execute("DELETE FROM users");
        connection.close();

        user1 = userDao.registerNewUser(new UserForm("user1", "password1"));
        user2 = userDao.registerNewUser(new UserForm("user2", "password2"));

        course1 = courseDao.getCourseByID(courseDao.createCourse(new CourseForm("Course1", user1)));
        course2 = courseDao.getCourseByID(courseDao.createCourse(new CourseForm("Course2", user1)));
        course3 = courseDao.getCourseByID(courseDao.createCourse(new CourseForm("Course3", user2)));
    }

    @Test
    public void testCreateEvent()
    {
        EventForm form = new EventForm();
        form.setName("First event");
        form.setMetaCourseId(course1.getId());
        form.setMetaUsername(user1.getUsername());
        form.setColor(0xFFEE88);
        form.setDescription("Some description");
        form.setDue((int)(new Date(10, 11, 12).getTime() / 1_000));//TODO store date as long not int?
        form.setProgress(42);
        form.setType(3);
        Assert.assertEquals(0, eventDao.getAllEventsForUser(user1).size());
        long eventID = eventDao.createEvent(form);
        Event event = eventDao.getEventByID(eventID);
        //test all event fields:
        Assert.assertEquals(eventID, event.getId());
        Assert.assertEquals(form.getName(), event.getName());
        Assert.assertEquals(form.getDescription(), event.getDescription());
        Assert.assertEquals(form.getDue(), event.getDue().getTime() / 1_000);
        Assert.assertEquals(form.getColor(), event.getColor());
        Assert.assertEquals(form.getProgress(), event.getProgress());
        Assert.assertEquals(form.getType(), event.getType());

        Assert.assertEquals(0, eventDao.getAllEventsForUser(user2).size());//ensure not mapped to other user
        List<Event> events = eventDao.getAllEventsForUser(user1);
        Assert.assertEquals(1, events.size());
        Event listedEvent = events.get(0);
        Assert.assertEquals(event.getId(), listedEvent.getId());
        Assert.assertEquals(event, listedEvent);
    }

    @Test
    public void testEventRange()
    {
        EventForm before = new EventForm("before", 990, user2.getUsername(), course3.getId());
        Event beforeInst = eventDao.getEventByID(eventDao.createEvent(before));
        EventForm onStart = new EventForm("onstart", 1000, user2.getUsername(), course3.getId());
        Event onStartInst = eventDao.getEventByID(eventDao.createEvent(onStart));
        EventForm inRange = new EventForm("inrange", 1300, user2.getUsername(), course3.getId());
        Event inRangeInst = eventDao.getEventByID(eventDao.createEvent(inRange));
        EventForm onEnd = new EventForm("onend", 1500, user2.getUsername(), course3.getId());
        Event onEndInst = eventDao.getEventByID(eventDao.createEvent(onEnd));
        EventForm after = new EventForm("after", 2000, user2.getUsername(), course3.getId());
        Event afterInst = eventDao.getEventByID(eventDao.createEvent(after));

        Assert.assertEquals(5, eventDao.getAllEventsForUser(user2).size());
        List<Event> results = eventDao.getEventsInRangeForUser(user2, new Date(1000 * 1000), new Date(1500 * 1000));
        Assert.assertEquals(3, results.size());
        Assert.assertTrue(results.contains(onStartInst));
        Assert.assertTrue(results.contains(inRangeInst));
        Assert.assertTrue(results.contains(onEndInst));
        Assert.assertFalse(results.contains(beforeInst));
        Assert.assertFalse(results.contains(afterInst));
    }

    @Test
    public void testEditAndDeleteEvent()
    {
        EventForm moving = new EventForm("before", 990, user1.getUsername(), course2.getId());
        long movingID = eventDao.createEvent(moving);
        Event movingInst = eventDao.getEventByID(movingID);
        EventForm center = new EventForm("center", 1000, user1.getUsername(), course2.getId());
        Event centerInst = eventDao.getEventByID(eventDao.createEvent(center));
        //test order and presence of the two events:
        List<Event> results = eventDao.getAllEventsForUser(user1);
        Assert.assertEquals(2, results.size());
        Assert.assertEquals(movingInst, results.get(0));
        Assert.assertEquals(movingID, results.get(0).getId());
        Assert.assertEquals("before", results.get(0).getName());
        Assert.assertEquals(centerInst, results.get(1));

        //edit moving event
        moving = new EventForm(movingInst);
        moving.setName("after");
        moving.setDue(1010);
        eventDao.editEvent(moving);

        //test order and presence of two events:
        results = eventDao.getAllEventsForUser(user1);
        Assert.assertEquals(2, results.size());
        Assert.assertEquals(centerInst, results.get(0));
        Assert.assertEquals(movingID, results.get(1).getId());
        Assert.assertEquals("after", results.get((1)).getName());

        //delete moving event
        eventDao.deleteEvent(movingID);

        //ensure event is no longer present on database
        results = eventDao.getAllEventsForUser(user1);
        Assert.assertEquals(1, results.size());
        Assert.assertEquals(centerInst, results.get(0));
    }
}