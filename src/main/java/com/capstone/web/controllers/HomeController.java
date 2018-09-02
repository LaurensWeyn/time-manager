package com.capstone.web.controllers;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.capstone.db.dao.CourseDao;
import com.capstone.db.dao.EventDao;
import com.capstone.db.dao.TimeslotDao;
import com.capstone.db.dto.EventGroup;
import com.capstone.db.dto.Timeslot;
import com.capstone.db.dto.User;

@Controller
public class HomeController
{
    private CourseDao courseDao;
    private TimeslotDao timeslotDao;
    private EventDao eventDao;

    @Autowired
    public void setCourseDao(CourseDao courseDao)
    {
        this.courseDao = courseDao;
    }

    @Autowired
    public void setTimeslotDao(TimeslotDao timeslotDao)
    {
        this.timeslotDao = timeslotDao;
    }

    @Autowired
    public void setEventDao(EventDao eventDao)
    {
        this.eventDao = eventDao;
    }

    @RequestMapping("/")
    public String showHome(HttpSession session)
    {
        session.setAttribute("Key", "Value");//example of loading data into a session
        System.out.println("Mapping homepage");

        return "static/home";//maps to jsps/[string].jsp
    }

    @RequestMapping("/dashboard")
    public String showDashboard(HttpSession session, Authentication authentication)
    {
        User user = new User(authentication);

        int dayOfWeek = 2;//for demo purposes, this will be a constant so it actually works on the day.
        //(Also, it is permanently Wednesday, my dudes)
        List<Timeslot> timeslots = timeslotDao.getAllTimeslotsForDayOfWeek(user, dayOfWeek);
        Collections.sort(timeslots);//should probably be done database side later
        session.setAttribute("timeslots", timeslots);

        List<EventGroup> events = EventGroup.buildEventGroups(eventDao.getAllEventsForUser(user));
        session.setAttribute("upcomingEvents", events);

        return "dashboard";//maps to jsps/[string].jsp
    }

    @RequestMapping("/editEvent")
    public String showAssignment(HttpSession session){
        System.out.println("Mapping Assignment View");
        return "Placeholders/assignmentsView";
    }

	@RequestMapping("/viewCourse")
	public String showCourse(HttpSession session){
		System.out.println("Mapping Course View");
		return "Placeholders/courseDetail";
	}

	@RequestMapping("/courseDetail")
	public String showCourseDetail(HttpSession session){
		System.out.println("Mapping Course Detail View");
		return "Placeholders/courseDetail";
	}
}
