package beans;

import java.util.Calendar;

public class CurrentTimeBean {

  public int hours, minutes;

  public CurrentTimeBean() {
    Calendar calendar = Calendar.getInstance();
    hours = calendar.get(Calendar.HOUR_OF_DAY);
    minutes = calendar.get(Calendar.MINUTE);
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