package com.capstone.db.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

public class EventGroup implements Comparable<EventGroup>
{
    private Date date;
    private List<Event> events = new ArrayList<>();
    private static final DateFormat df = new SimpleDateFormat("EEEEE, MMMMM dd");
    private static final DateFormat dfCompare = new SimpleDateFormat("yyyyMMdd");


    public EventGroup(Date date)
    {
        this.date = date;
    }

    public static List<EventGroup> buildEventGroups(List<Event> events)
    {
        ArrayList<EventGroup> groups = new ArrayList<>();
        for(Event event:events)
        {
            boolean found = false;
            //search for existing group and add if possible
            for(EventGroup group:groups)
            {
                if(group.fallsIntoGroup(event.getDue()))
                {
                    group.getEvents().add(event);
                    found = true;
                    break;
                }
            }
            //not found? make a new group
            if(!found)
            {
                EventGroup newGroup = new EventGroup(event.getDue());
                newGroup.getEvents().add(event);
                groups.add(newGroup);
            }
        }
        //sort everything
        for(EventGroup group:groups)
            Collections.sort(group.getEvents());
        Collections.sort(groups);
        //return result
        return groups;
    }


    public Date getDate()
    {
        return date;
    }

    public boolean fallsIntoGroup(Date date)
    {
        return dfCompare.format(this.date).equals(dfCompare.format(date));
    }

    public void setDate(Date date)
    {
        this.date = date;
    }

    public List<Event> getEvents()
    {
        return events;
    }

    public String getDateString()
    {
        return df.format(date);
    }

    @Override
    public int compareTo(EventGroup that)
    {
        return dfCompare.format(this.date).compareTo(dfCompare.format(that.date));
    }

    public boolean isEmpty(){
        return events.isEmpty();
    }
}
