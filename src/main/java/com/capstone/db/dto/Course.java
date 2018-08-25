package com.capstone.db.dto;

import java.util.List;
import java.util.Objects;

public class Course
{
    private long id;
    private String name, code;
    private int priority;
    private int color;
    private List<Event> events;
    private List<Timeslot> timeslots;

    public long getId()
    {
        return id;
    }

    public void setId(long id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getCode()
    {
        return code;
    }

    public void setCode(String code)
    {
        this.code = code;
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

    public List<Event> getEvents()
    {
        return events;
    }

    public void setEvents(List<Event> events)
    {
        this.events = events;
    }

    public List<Timeslot> getTimeslots()
    {
        return timeslots;
    }

    public void setTimeslots(List<Timeslot> timeslots)
    {
        this.timeslots = timeslots;
    }

    @Override
    public boolean equals(Object o)
    {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Course course = (Course) o;
        return id == course.id &&
                priority == course.priority &&
                color == course.color &&
                Objects.equals(name, course.name) &&
                Objects.equals(code, course.code);
    }

    @Override
    public int hashCode()
    {
        return Objects.hash(id, name, code, priority, color);
    }
}
