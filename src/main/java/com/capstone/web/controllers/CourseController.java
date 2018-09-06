package com.capstone.web.controllers;

import com.capstone.db.dao.CourseDao;
import com.capstone.db.dao.TimeslotDao;
import com.capstone.db.dto.Timeslot;
import com.capstone.db.dto.User;
import com.capstone.util.Time;
import com.capstone.web.forms.CourseForm;
import com.capstone.web.forms.TimeslotForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CourseController {
	private static long courseMetaID = 3;
	private static long timeslotMetaID = 3;
	private CourseDao courseDao;
	private TimeslotDao timeslotDao;

	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	@Autowired
	public void setTimeslotDao(TimeslotDao timeslotDao) {
		this.timeslotDao = timeslotDao;
	}

	@RequestMapping("/addCourse")
	public String addCourse(Model model, HttpSession session) {
		CourseForm blankForm = new CourseForm();
		blankForm.setMetaId(courseMetaID++);
		model.addAttribute("courses", courseDao.getCoursesForUser((User) session.getAttribute("User")));
		model.addAttribute("courseForm", blankForm);
		return "newCourseForm";
	}

	@RequestMapping("/doAddCourse")
	public String doAddCourse(HttpSession session, CourseForm courseForm) {
		session.setAttribute("courseCode", null);

		if (courseForm.getCourseCode().equals("")) {
			session.setAttribute("courseCode", true);
			return "newCourseForm";
		}
		if (courseForm.getName().equals("")) {
			courseForm.setName(courseForm.getCourseCode());
		}
		courseForm.setColor(0);
		courseForm.setPriority(4);
		try {
			courseForm.setMetaUsername(((User) session.getAttribute("User")).getUsername());
			courseDao.createCourse(courseForm);
		} catch (Exception err) {
			return "newCourseForm";
		}
		return "allCourses";
	}

	@RequestMapping("/addCourseAdv") // Advanced version of adding a course, with extra functionality
	public String addCourseAdv(HttpSession session, CourseForm courseForm) {
		return "";
	}

	@RequestMapping("/deleteCourse")
	public String deleteCourse(HttpSession session) {
		return "";
	}

	@RequestMapping("/addTimeslot")
	public String addTimeslot(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("Mapping Add Timeslot");
		TimeslotForm blankForm = new TimeslotForm();
		model.addAttribute("courses", courseDao.getCoursesForUser((User) session.getAttribute("User")));
		model.addAttribute("timeslotForm", blankForm);
		return "newTimeslotForm";
	}

	@RequestMapping("/doAddTimeslot")
	public String doAddTimeslot(HttpSession session, TimeslotForm timeslotForm) {
		session.setAttribute("timeError", null);
		if (timeslotForm.getStartTime() < timeslotForm.getEndTime()) {
			session.setAttribute("timeError", true);
			return "static/newTimeSlotForm";
		}
		try {
			Timeslot timeslot = new Timeslot();
			timeslot.setDaysOfWeek(timeslot.getDaysOfWeek());
			timeslot.setStartTime(new Time(timeslotForm.getStartTime()));
			timeslot.setEndTime(new Time(timeslotForm.getEndTime()));
			timeslot.setParentCourse(courseDao.getCourseByID(timeslotForm.getMetaCourseId()));
			timeslot.setId(timeslotMetaID++);
			courseDao.getCourseByID(timeslotForm.getMetaCourseId()).getTimeslots().add(timeslot);
		} catch (Exception err) {
			return "newTimeslotForm";
		}
		return "dashboard";
	}

	@RequestMapping("/viewCourse")
	public String viewCourse(Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("Mapping Course View");
		CourseForm blankForm = new CourseForm();
		model.addAttribute("courseForm", blankForm);
		model.addAttribute("timeslots", timeslotDao.getAllTimeslotsForUser((User) session.getAttribute("User")));
		model.addAttribute("course", courseDao.getCourseByID(Integer.parseInt(request.getParameter("id"))));
		return "viewCourse";
	}

	@RequestMapping("/updateCourseInfo")
	public String updateCourseInfo(HttpSession session, CourseForm courseForm) {
		try {

		} catch (Exception err) {
			return "viewCourse";
		}
		return "viewCourse";
	}
}
