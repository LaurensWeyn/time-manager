package com.capstone.web.controllers;

import java.security.Principal;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.capstone.db.dao.UserDao;
import com.capstone.db.dto.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
    private UserDao userDao;

    @Autowired
    public void setUserDao (UserDao userDao) { this.userDao = userDao;}

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
        session.setAttribute("User", user);

        int dayOfWeek = 2;//for demo purposes, this will be a constant so it actually works on the day.
        //(Also, it is permanently Wednesday, my dudes)
        List<Timeslot> timeslots = timeslotDao.getAllTimeslotsForDayOfWeek(user, dayOfWeek);
        Collections.sort(timeslots);//should probably be done database side later
        session.setAttribute("timeslots", timeslots);

        List<EventGroup> events = EventGroup.buildEventGroups(eventDao.getAllEventsForUser(user));
        session.setAttribute("upcomingEvents", events);

        return "dashboard";//maps to jsps/[string].jsp
    }

    @RequestMapping("calendar")
    public String showCalendar(HttpSession session){
        System.out.println("Mapping Calendar");
        return "calendar";
    }

    @RequestMapping("/viewAllCourses")
    public String showAllCourses(HttpSession session){
        System.out.println("Mapping all courses");
        User user = (User) session.getAttribute("User");
        List<Course> courses = courseDao.getCoursesForUser(user);
        session.setAttribute("courses", courses);
        return "allCourses";
    }

//    @RequestMapping("/logout")
//    public String logout(HttpSession session){
//        // TODO: fix the logout button disappearing. This happens because the security context has been cleared. Need to refresh with notValidated
//        SecurityContextHolder.clearContext();
//        session.removeAttribute("User");
//        session.invalidate();
//        return "static/home";
//    }
}
