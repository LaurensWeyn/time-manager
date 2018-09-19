package com.capstone.web.forms;

import com.capstone.db.dto.Course;
import com.capstone.db.dto.Event;
import com.capstone.db.dto.User;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class EventForm
{
    private String name;
    private int due;
    private int progress;
    private String description;
    private int type;
    private int color;

    //non-real fields tracked for identification
    private long metaCourseId;
    private long metaId;
    private String metaUsername;

    public EventForm()
    {
        due = (int)(new Date().getTime() / 1_000L);//sensible default value for UI
    }

    public EventForm(String name, int due, String username, long courseId)
    {
        this.name = name;
        this.due = due;
        this.metaUsername = username;
        this.metaCourseId = courseId;
    }

    public EventForm(Event event)
    {
        metaId = event.getId();

        name = event.getName();
        due = (int)(event.getDue().getTime() / 1_000);
        progress = event.getProgress();
        description = event.getDescription();
        type = event.getType();
        color = event.getColor();
    }
    public EventForm(Event event, User user, Course course)
    {
        this(event);
        metaUsername = user.getUsername();
        metaCourseId = course.getId();
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public int getDue()
    {
        return due;
    }

    public void setDue(int due)
    {
        this.due = due;
    }

    private static final DateFormat inputFormat = new SimpleDateFormat("dd MMMMM yyyy - hh:mm", Locale.ENGLISH);

    public void setDueInput(String input)
    {
        try {
            this.due = (int)(inputFormat.parse(input).getTime() / 1_000L);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    public String getDueInput()
    {
        return inputFormat.format(new Date(due * 1_000L));
    }

    public int getProgress()
    {
        return progress;
    }

    public void setProgress(int progress)
    {
        this.progress = progress;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
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

    public long getMetaCourseId()
    {
        return metaCourseId;
    }

    public void setMetaCourseId(long metaCourseId)
    {
        this.metaCourseId = metaCourseId;
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
