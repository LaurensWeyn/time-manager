package com.capstone.web.controllers;

import com.capstone.db.dao.CourseDao;
import com.capstone.web.forms.CourseForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class CourseController {
	private CourseDao courseDao;

	@Autowired
	public void setCourseDao(CourseDao courseDao) { this.courseDao = courseDao; }

	@RequestMapping("/addCourse")
	public String addCourse(HttpSession session, CourseForm courseForm){
		session.setAttribute("courseCode", null);

		if (courseForm.getCourseCode() == null){
			session.setAttribute("courseCode", true);
			return "component/courseForm";
		}
		if (courseForm.getName() == null){
			courseForm.setName(courseForm.getCourseCode());
		}
		courseForm.setColor(0);
		courseForm.setPriority(4);
		try {
			courseDao.createCourse(courseForm);
		} catch(Exception err) {
			return "component/courseForm";
		}
		return "dashboard";
	}

	@RequestMapping("/addCourseAdv") // Advanced version of adding a course, with extra functionality
	public String addCourseAdv(HttpSession session, CourseForm courseForm){
		return"";
	}

	@RequestMapping("/deleteCourse")
	public String deleteCourse(HttpSession session) {
		return"";
	}
}
