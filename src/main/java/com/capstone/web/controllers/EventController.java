package com.capstone.web.controllers;

import com.capstone.db.dao.EventDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class EventController {
	private EventDao eventDao;

	@Autowired
	public void setEventDao(EventDao eventDao){ this.eventDao = eventDao;}

	@RequestMapping("/completeEvent")
	public String completeEvent(HttpSession session){
		System.out.println("Event completed");
		return "dashboard";
	}
}
