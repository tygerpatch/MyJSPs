package TagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

// To change this template, choose Tools | Templates and open the template in the editor.
// Author: Todd Gerspacher
public class ReverseString extends TagSupport {
  private String str;

  public String getStr() {
    return str;
  }

  public void setStr(String str) {
    this.str = str;
  }

  public int doStartTag() {
    try {
      JspWriter out = pageContext.getOut();
      out.print(new StringBuffer(str).reverse().toString());
    } 
    catch (IOException ioe) {
      System.out.println("Error in ExampleTag: " + ioe);
    }

    return (SKIP_BODY);
  }
}
