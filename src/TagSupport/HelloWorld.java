package TagSupport;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloWorld extends TagSupport {

  @Override
  public int doStartTag() throws JspException {
    try {
      JspWriter out = pageContext.getOut();
      out.print("Hello World");
    } 
    catch (IOException ioe) {
      System.out.println("Error in ExampleTag: " + ioe);
    }

    return (SKIP_BODY);
  }
}

