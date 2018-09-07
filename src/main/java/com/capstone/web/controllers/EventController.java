package com.capstone.web.controllers;

import com.capstone.db.dao.CourseDao;
import com.capstone.db.dao.EventDao;
import com.capstone.db.dto.User;
import com.capstone.web.forms.EventForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class EventController {
	private EventDao eventDao;
	private CourseDao courseDao;

	@Autowired
	public void setEventDao(EventDao eventDao){
		this.eventDao = eventDao;
	}

	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	// TODO: Make those blow this todo happen
	@RequestMapping("/updateEventInfo")
	public String updateCourseInfo(HttpSession session, EventForm eventForm, HttpServletRequest request) {
		eventForm.setDescription(eventDao.getEventByID(Integer.parseInt(request.getParameter("eventId"))).getDescription());
		eventForm.setType(eventDao.getEventByID(Integer.parseInt(request.getParameter("eventId"))).getType());

		try {
			eventDao.editEvent(eventForm);
		} catch (Exception err) {
			return "viewCourse";
		}
		return "viewCourse";
	}
	@RequestMapping("/editEvent")
	public String viewEventEdit(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("eventForm", new EventForm());
		model.addAttribute("course",eventDao.getEventByID(Integer.parseInt(request.getParameter("courseId"))).getParentCourse());
		model.addAttribute("event", eventDao.getEventByID(Integer.parseInt(request.getParameter("eventId"))));
		model.addAttribute("courses", courseDao.getCoursesForUser((User) session.getAttribute("User")));
		return "assignmentEventEdit";
	}

	@RequestMapping("/addEvent")
	public String addEvent(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("eventForm", new EventForm());
		model.addAttribute("course",courseDao.getCourseByID(Integer.parseInt(request.getParameter("courseId"))));
		return "addEvent";
	}

	@RequestMapping("/doAddEvent")
	public String doAddEvent(HttpSession session, EventForm eventForm){
		try {
			eventDao.editEvent(eventForm);
		} catch (Exception err) {
			return "viewCourse";
		}
		return "viewCourse";
	}
}
