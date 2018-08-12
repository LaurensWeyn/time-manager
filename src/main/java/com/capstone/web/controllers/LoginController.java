package com.capstone.web.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.capstone.db.dao.User;

@Controller
public class LoginController
{
    @RequestMapping("/login")
    public String showLogin()
    {
        return "login";
    }

    @RequestMapping("/createAccount")
    public String showCreateAccountPage(Model model)
    {
        model.addAttribute("user", new User());//by default, navigate here with a blank User. (fields stay filled in on failure)
        return "createAccount";
    }

    public static void main(String[] args)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("password"));
    }
}
