package com.capstone.db.dto;

import java.util.Date;

public class Event
{
    private long id;
    private Course parentCourse;
    private Date due;
    private int type;
    private int color;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public Course getParentCourse()
    {
        return parentCourse;
    }

    public void setParentCourse(Course parentCourse)
    {
        this.parentCourse = parentCourse;
    }

    public Date getDue()
    {
        return due;
    }

    public void setDue(Date due)
    {
        this.due = due;
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public int getColor()
    {
        return color;
    }

    public void setColor(int color)
    {
        this.color = color;
    }
}
