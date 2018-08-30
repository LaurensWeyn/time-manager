package com.capstone.web.forms;

public class TimeslotForm
{
    private int startTime;
    private int endTime;
    private String daysOfWeek;
    private String venue;
    private int type;
    //non-real fields tracked for identification
    private long metaCourseId;
    private long metaId;
    private String metaUsername;

    public int getStartTime()
    {
        return startTime;
    }

    public void setStartTime(int startTime)
    {
        this.startTime = startTime;
    }

    public int getEndTime()
    {
        return endTime;
    }

    public void setEndTime(int endTime)
    {
        this.endTime = endTime;
    }

    public String getDaysOfWeek()
    {
        return daysOfWeek;
    }

    public void setDaysOfWeek(String daysOfWeek)
    {
        this.daysOfWeek = daysOfWeek;
    }

    public String getVenue()
    {
        return venue;
    }

    public void setVenue(String venue)
    {
        this.venue = venue;
    }

    public int getType()
    {
        return type;
    }

    public void setType(int type)
    {
        this.type = type;
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
