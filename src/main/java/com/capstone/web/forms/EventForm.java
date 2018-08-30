package com.capstone.web.forms;

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
