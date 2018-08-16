package com.capstone;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Time implements Comparable<Time>
{
    private int minutesSinceMidnight;

    private static final NumberFormat twoDigit = new DecimalFormat("00");

    public Time(int minutesSinceMidnight)
    {
        this.minutesSinceMidnight = minutesSinceMidnight;
    }
    public Time(int hours, int minutes)
    {
        minutesSinceMidnight = hours * 60 + minutes;
    }
    public int getHours()
    {
        return minutesSinceMidnight / 60;
    }
    public int getMinutes()
    {
        return minutesSinceMidnight % 60;
    }

    public int getMinutesSinceMidnight()
    {
        return minutesSinceMidnight;
    }

    public String getString24()
    {
        return getHours() + ":" + twoDigit.format(getMinutes());
    }

    @Override
    public int compareTo(Time o)
    {
        return minutesSinceMidnight - o.minutesSinceMidnight;
    }
}
