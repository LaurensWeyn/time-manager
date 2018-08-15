package com.capstone.web.controllers;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.capstone.web.forms.UserForm;

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
        model.addAttribute("user", new UserForm());//by default, navigate here with a blank User. (fields stay filled in on failure)
        return "createAccount";
    }

    @RequestMapping("/doCreateAccount")
    public String createAccount(UserForm user)
    {
        System.out.println("Found user details " + user);
        return "createAccount";//TODO success page
    }

    public static void main(String[] args)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("password"));
    }
}
