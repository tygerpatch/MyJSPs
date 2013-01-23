package beans;

import java.util.Calendar;

// "How to use JavaBeans and JSP:useBean action in JSP"
// http://www.java-tips.org/java-ee-tips/javaserver-pages/how-to-use-javabeans-and-jsp-usebean-action-i-2.html
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