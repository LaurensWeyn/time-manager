package com.capstone.web.forms;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

public class UserForm
{
    private String username;
    private String pass1;
    private String pass2;
    private String passEncoded;

    public UserForm()
    {
    }

    public UserForm(String username, String pass)
    {
        this(username, pass, pass);
    }

    public UserForm(String username, String pass1, String pass2)
    {
        this.username = username;
        this.pass1 = pass1;
        this.pass2 = pass2;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPass1()
    {
        return pass1;
    }

    public void setPass1(String pass1)
    {
        this.pass1 = pass1;
    }

    public String getPass2()
    {
        return pass2;
    }

    public void setPass2(String pass2)
    {
        this.pass2 = pass2;
    }

    public void encodePassword(PasswordEncoder encoder)
    {
        if(passwordsMatch())
            passEncoded = encoder.encode(pass1);
    }
    public String getPassEncoded()
    {
        return passEncoded;
    }

    public boolean passwordsMatch()
    {
        return pass1.equals(pass2);
    }

    public boolean fieldsValid()
    {
        return pass1.length() >= 4 && username.length() >= 3;//database will check the other bounds
    }

    @Override
    public String toString()
    {
        return "User{" +
                "username='" + username + '\'' +
                ", pass1='" + pass1 + '\'' +
                ", pass2='" + pass2 + '\'' +
                '}';
    }
}
