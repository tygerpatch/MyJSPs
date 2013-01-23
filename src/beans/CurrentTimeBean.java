package beans;

import java.util.Calendar;


// import java.util.Date;

public class CurrentTimeBean {

    public int hours;
    public int minutes;

    public CurrentTimeBean() 
    {
        Calendar cal = Calendar.getInstance();
        // Date now = new Date();
        
        // the following methods were deprecated, use Calendar instead
        // this.hours = now.getHours();
        // this.minutes = now.getMinutes();
        
        hours = cal.get(Calendar.HOUR_OF_DAY);
        minutes = cal.get(Calendar.MINUTE);
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getMinutes() {
        return minutes;
    }

    public void setMinutes(int minutes) {
        this.minutes = minutes;
    }
}