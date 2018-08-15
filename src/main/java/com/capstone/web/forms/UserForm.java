package com.capstone.web.forms;

import org.springframework.stereotype.Component;

public class UserForm
{
    private String username;
    private String pass1;
    private String pass2;
    private boolean enabled = false;
    private String authority;

    public UserForm()
    {
    }

    public UserForm(String username, String pass1, String pass2, boolean enabled, String authority)
    {
        this.username = username;
        this.pass1 = pass1;
        this.pass2 = pass2;
        this.enabled = enabled;
        this.authority = authority;
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

    public boolean isEnabled()
    {
        return enabled;
    }

    public void setEnabled(boolean enabled)
    {
        this.enabled = enabled;
    }

    public String getAuthority()
    {
        return authority;
    }

    public void setAuthority(String authority)
    {
        this.authority = authority;
    }

    @Override
    public String toString()
    {
        return "User{" +
                "username='" + username + '\'' +
                ", pass1='" + pass1 + '\'' +
                ", pass2='" + pass2 + '\'' +
                ", enabled=" + enabled +
                ", authority='" + authority + '\'' +
                '}';
    }
}
