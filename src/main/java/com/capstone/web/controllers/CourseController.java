package com.capstone.web.controllers;

import com.capstone.db.dao.CourseDao;
import com.capstone.db.dto.Course;
import com.capstone.db.dto.Timeslot;
import com.capstone.util.Time;
import com.capstone.web.forms.CourseForm;
import com.capstone.web.forms.TimeslotForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CourseController {
	private CourseDao courseDao;
	private static long metaID = 5;

	@Autowired
	public void setCourseDao(CourseDao courseDao) { this.courseDao = courseDao; }

	@RequestMapping("/addCourse")
	public String addCourse(Model model){
		CourseForm blankForm = new CourseForm();
		blankForm.setMetaId(metaID++);
		model.addAttribute("courseForm", blankForm);
		return "static/newCourseForm";
	}

	@RequestMapping("/doAddCourse")
	public String doAddCourse(HttpSession session, CourseForm courseForm){
		session.setAttribute("courseCode", null);

		if (courseForm.getCourseCode().equals("")){
			session.setAttribute("courseCode", true);
			return "static/courseForm";
		}
		if (courseForm.getName().equals("")){
			courseForm.setName(courseForm.getCourseCode());
		}
		courseForm.setColor(0);
		courseForm.setPriority(4);
		try {
			courseDao.createCourse(courseForm);
		} catch(Exception err) {
			return "static/newCourseForm";
		}
		return "allCourses";
	}

	@RequestMapping("/addCourseAdv") // Advanced version of adding a course, with extra functionality
	public String addCourseAdv(HttpSession session, CourseForm courseForm){
		return"";
	}

	@RequestMapping("/deleteCourse")
	public String deleteCourse(HttpSession session) {
		return"";
	}

	@RequestMapping("/addTimeslot")
	public String addTimeslot(Model model){
		System.out.println("Mapping Add Timeslot");
		TimeslotForm blankForm = new TimeslotForm();
		model.addAttribute("timeslotForm", blankForm);
		return "static/newTimeslotForm";
	}

	@RequestMapping("/doAddTimeslot")
	public String doAddTimeslot(HttpSession session, TimeslotForm timeslotForm){
		try {
			Timeslot timeslot = new Timeslot();
			timeslot.setDaysOfWeek("");
			timeslot.setStartTime(new Time(0));
			timeslot.setEndTime(new Time(0));
			timeslot.setParentCourse(courseDao.getCourseByID(timeslotForm.getMetaCourseId()));
			courseDao.getCourseByID(timeslotForm.getMetaCourseId()).getTimeslots().add(timeslot);
		} catch(Exception err) {
			return "static/newTimeslotForm";
		}
		return "dashboard";
	}

	@RequestMapping("/viewCourse")
	public String viewCourse(Model model){
		System.out.println("Mapping Course View");
		CourseForm blankForm = new CourseForm();
		model.addAttribute("courseForm",blankForm);
		return "static/viewCourse";
	}

	@RequestMapping("/updateCourseInfo")
	public String updateCourseInfo(HttpSession session, CourseForm courseForm){
		try {

		} catch (Exception err){
			return "static/viewCourse";
		}
		return "static/viewCourse";
	}
}
