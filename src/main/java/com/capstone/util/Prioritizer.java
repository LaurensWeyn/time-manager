package com.capstone.util;

import com.capstone.db.dto.Event;

import java.util.Comparator;
import java.util.Date;

public class Prioritizer {

    public static long getRelativePriority(Event event) {
        long relPriority;
        String eventName = event.getName().toLowerCase();
        Date due = event.getDue();
        int progress = event.getProgress();

        if (eventName == null || due == null) {
            return 9999999; // If the event doesnt exist, priority doesnt make sense
        }

        //Try and guess a priority based on the content of the title
        if (eventName.contains("test") && !eventName.contains("tutorial")){
            relPriority = 100;
        }
        if (eventName.contains("assignment")) {
            relPriority = 72;
        }

        if (eventName.contains("problemset")||eventName.contains("problem set")||eventName.contains("tutorial")){
            relPriority = 44;
        } else  {
            relPriority = 30;
        }

        //Adjust priority based on current progress
        if (progress ==0){
            relPriority *= 2;
        } else {
            relPriority *= 1 / (double) progress;
        }
        //Adjust based on time. Note that a smaller time means that its due earlier. This means that a smaller priority lends itself to a importance
        relPriority *= due.getTime();

        return relPriority;
    }
}
