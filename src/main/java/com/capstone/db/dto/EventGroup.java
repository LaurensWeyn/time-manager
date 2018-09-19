package com.capstone.db.dto;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class EventGroup implements Comparable<EventGroup>
{
    private Date date;
    private List<Event> events = new ArrayList<>();
    private static final DateFormat df = new SimpleDateFormat("EEEEE, MMMMM dd", Locale.ENGLISH);
    private static final DateFormat dfCompare = new SimpleDateFormat("yyyyMMdd", Locale.ENGLISH);


    public EventGroup(Date date)
    {
        this.date = date;
    }

    public static List<EventGroup> buildEventGroups(List<Event> events)
    {
        for (Event event:events){
            event.setRelativePriority(); // Calculate the relative priorities first
        }
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

    public static EventGroup buildTodoEventGroup(List<Event> events)
    {
        events.sort(null);//sort by dates first such that items with same priority are still in date order
        events.sort(Comparator.comparingInt(o -> (int) o.getRelativePriority())); // Sort events list based on relative priority. This should have our stuff at the other end sorted based on priority.
        EventGroup group = new EventGroup(null);
        group.events = events;
        return group;
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
