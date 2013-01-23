package beans;

// "Beans and Form processing", JSP Tutorial,
// http://www.jsptut.com/forms.jsp
public class UserData {

  private String username;

  public void setUsername(String value) {
    this.username = value;
  }

  public String getUsername() {
    return username;
  }

  private String email;

  public void setEmail(String value) {
    email = value;
  }

  public String getEmail() {
    return email;
  }

  private int age;

  public void setAge(int value) {
    age = value;
  }

  public int getAge() {
    return age;
  }
}
