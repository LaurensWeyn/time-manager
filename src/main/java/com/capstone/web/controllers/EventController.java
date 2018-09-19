package com.capstone.web.controllers;

import com.capstone.db.dao.CourseDao;
import com.capstone.db.dao.EventDao;
import com.capstone.db.dao.TimeslotDao;
import com.capstone.db.dto.Course;
import com.capstone.db.dto.Event;
import com.capstone.db.dto.User;
import com.capstone.web.forms.CourseForm;
import com.capstone.web.forms.EventForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.capstone.web.controllers.HomeController.prepareDashboard;

@Controller
public class EventController {
	private EventDao eventDao;
	private CourseDao courseDao;
	private TimeslotDao timeslotDao;

	@Autowired
	public void setEventDao(EventDao eventDao){ this.eventDao = eventDao;}

	@Autowired
	public void setCourseDao(CourseDao courseDao){ this.courseDao = courseDao;}

	@Autowired
    public void setTimeslotDao(TimeslotDao timeslotDao)
    {
        this.timeslotDao = timeslotDao;
    }

    @RequestMapping("/completeEvent")
	public String completeEvent(HttpSession session, HttpServletRequest request, Authentication auth){
		eventDao.deleteEvent(Long.parseLong(request.getParameter("eventId")));
		System.out.println("Event completed");
		return prepareDashboard(session, timeslotDao, eventDao, new User(auth));
	}

    @RequestMapping("/updateEventInfo")
    public String updateCourseInfo(HttpSession session, Model model, EventForm eventForm, HttpServletRequest request, Authentication auth) {
	    if(request.getParameter("eventId").equals("0"))//create
        {
            //TODO set courseID!!!
            long newID = eventDao.createEvent(eventForm);
            System.out.println("event created with ID " + newID);
        }
        else//update
        {
            Event event = eventDao.getEventByID(Long.parseLong(request.getParameter("eventId")));
            Course course = courseDao.getCourseByID(Long.parseLong(request.getParameter("courseId")));
            //NOTE why was the form updated by the original event? It goes this way around
            eventForm.setMetaId(event.getId());
            //model.addAttribute("courseForm", eventForm);
            model.addAttribute("courseForm", new CourseForm(course));
            try {
                eventDao.editEvent(eventForm);
            } catch (Exception err) {
                err.printStackTrace();
            }
        }
        return HomeController.prepareDashboard(session, timeslotDao, eventDao, new User(auth));
    }

    @RequestMapping("/editEvent")
    public String viewEventEdit(Model model, HttpServletRequest request, HttpSession session, Authentication auth) {
        EventForm form = new EventForm(eventDao.getEventByID(Long.parseLong(request.getParameter("eventId"))));
        form.setMetaCourseId(Long.parseLong(request.getParameter("courseId")));
        form.setMetaId(Long.parseLong(request.getParameter("eventId")));
        form.setMetaUsername(auth.getName());
        model.addAttribute("eventForm", form);
        model.addAttribute("course", courseDao.getCourseByID(Integer.parseInt(request.getParameter("courseId"))));
        model.addAttribute("event", eventDao.getEventByID(Integer.parseInt(request.getParameter("eventId"))));
        model.addAttribute("courses", courseDao.getCoursesForUser(new User(auth)));
        return "assignmentEventEdit";
    }

    @RequestMapping("/createEvent")
    public String createEvent(Model model, HttpServletRequest request, HttpSession session, Authentication auth) {
        EventForm form = new EventForm();
        form.setMetaCourseId(-1);
        form.setMetaId(-1);
        form.setMetaUsername(auth.getName());
        model.addAttribute("eventForm", form);
        model.addAttribute("course", new Course());
        model.addAttribute("event", new Event());
        model.addAttribute("courses", courseDao.getCoursesForUser(new User(auth)));
        return "assignmentEventEdit";
    }

}
