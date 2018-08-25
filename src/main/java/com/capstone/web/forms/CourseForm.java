package com.capstone.web.forms;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.User;

public class CourseForm
{
    private String name;
    private String courseCode;
    private int priority;
    private int color;
    //non-real fields tracked for identification
    private long metaId;
    private String metaUsername;

    public CourseForm()
    {}

    public CourseForm(String name, User user)
    {
        this.name = name;
        this.metaUsername = user.getUsername();
    }

    public CourseForm(Course course)
    {
        this.metaId = course.getId();

        this.color = course.getColor();
        this.priority = course.getPriority();
        this.name = course.getName();
        this.courseCode = course.getCode();
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getCourseCode()
    {
        return courseCode;
    }

    public void setCourseCode(String courseCode)
    {
        this.courseCode = courseCode;
    }

    public int getPriority()
    {
        return priority;
    }

    public void setPriority(int priority)
    {
        this.priority = priority;
    }

    public int getColor()
    {
        return color;
    }

    public void setColor(int color)
    {
        this.color = color;
    }

    public long getMetaId()
    {
        return metaId;
    }

    public void setMetaId(long metaId)
    {
        this.metaId = metaId;
    }

    public String getMetaUsername()
    {
        return metaUsername;
    }

    public void setMetaUsername(String metaUsername)
    {
        this.metaUsername = metaUsername;
    }
}
