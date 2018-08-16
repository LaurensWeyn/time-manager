package com.capstone.web.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.capstone.db.dao.UserDao;
import com.capstone.db.dto.User;
import com.capstone.web.forms.UserForm;

@Controller
public class LoginController
{
    private UserDao userDao;

    @Autowired
    public void setUserDao(UserDao userDao)
    {
        this.userDao = userDao;
    }

    @RequestMapping("/login")
    public String showLogin()
    {
        return "login";
    }

    @RequestMapping("/createAccount")
    public String showCreateAccountPage(Model model)
    {
        model.addAttribute("userForm", new UserForm());//by default, navigate here with a blank User. (fields stay filled in on failure)
        return "createAccount";
    }

    @RequestMapping("/doCreateAccount")
    public String createAccount(HttpSession session, UserForm userForm)
    {
        session.setAttribute("passmismatch", null);
        session.setAttribute("fielderror", null);
        session.setAttribute("nametaken", null);
        if(!userForm.passwordsMatch())
        {
            session.setAttribute("passmismatch", true);
            return "createAccount";
        }

        if(!userForm.fieldsValid())
        {
            session.setAttribute("fielderror", true);
            return "createAccount";
        }

        if(userDao.getUserByUsername(userForm.getUsername()) != null)
        {
            session.setAttribute("nametaken", true);
            return "createAccount";
        }

        try
        {
            userDao.registerNewUser(userForm);
        }
        catch(Exception err)
        {
            session.setAttribute("fielderror", true);
            return "createAccount";
        }

        return "home";//TODO create account success page
    }

    public static void main(String[] args)
    {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println(encoder.encode("password"));
    }
}
