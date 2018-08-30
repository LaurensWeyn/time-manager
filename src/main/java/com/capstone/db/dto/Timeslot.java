package com.capstone.db.dto;

import com.capstone.util.Time;

public class Timeslot implements Comparable<Timeslot>
{
    private long id;
    private Course parentCourse;
    private Time startTime, endTime;
    private boolean[] daysOfWeek;
    private int type;
    private String venue;

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

    public Time getStartTime()
    {
        return startTime;
    }

    public void setStartTime(Time startTime)
    {
        this.startTime = startTime;
    }

    public Time getEndTime()
    {
        return endTime;
    }

    public void setEndTime(Time endTime)
    {
        this.endTime = endTime;
    }

    public void setDaysOfWeek(String days)
    {
        if(days.length() != 7)
            throw new IllegalArgumentException("String must have 7 characters");
        daysOfWeek = new boolean[7];
        for(int i = 0; i < 7; i++)
        {
            if(days.charAt(i) == 'Y')
                daysOfWeek[i] = true;
            else
                daysOfWeek[i] = false;
        }
    }

    public String getDaysOfWeek()
    {
        if(daysOfWeek == null)
            return null;
        StringBuilder builder = new StringBuilder(7);
        for(boolean b:daysOfWeek)
            builder.append(b?'Y':'N');
        return builder.toString();
    }

    public boolean isOnDay(int dayOfWeek)
    {
        return daysOfWeek[dayOfWeek];
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
    }

    public String getVenue()
    {
        return venue;
    }

    public void setVenue(String venue)
    {
        this.venue = venue;
    }

    @Override
    public int compareTo(Timeslot that)
    {
        return this.startTime.compareTo(that.startTime);
    }
}
