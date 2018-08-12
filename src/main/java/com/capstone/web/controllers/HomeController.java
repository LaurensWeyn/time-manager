package com.capstone.web.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController
{
    public HomeController()
    {
        System.out.println("init homeController");
    }

    @RequestMapping("/")
    public String showHome(HttpSession session)
    {
        session.setAttribute("Key", "Value");//example of loading data into a session
        System.out.println("Mapping homepage");

        return "home";//maps to jsps/[string].jsp
    }

    @RequestMapping("/dashboard")
    public String showDashboard(HttpSession session)
    {
        session.setAttribute("Key", "Value2");//example of loading data into a session
        System.out.println("Mapping dashboard");

        return "dashboard";//maps to jsps/[string].jsp
    }
}
