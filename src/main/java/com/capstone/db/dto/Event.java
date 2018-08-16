package com.capstone.db.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Event implements Comparable<Event>
{
    private long id;
    private Course parentCourse;
    private String name;
    private String description;
    private Date due;
    private int type;
    private int progress;
    private int color;

    private static final DateFormat df = new SimpleDateFormat("HH:MM");

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

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public int getProgress()
    {
        return progress;
    }

    public void setProgress(int progress)
    {
        this.progress = progress;
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

    public String getDueTimeString()
    {
        return df.format(due);
    }

    @Override
    public int compareTo(Event other)
    {
        return due.compareTo(other.due);
    }
}
