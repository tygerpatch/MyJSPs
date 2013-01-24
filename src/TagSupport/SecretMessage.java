package TagSupport;

import java.io.IOException;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

// A tag that includes the body content only if the "debug" request parameter is set.
public class SecretMessage extends TagSupport {

  @Override
  public int doStartTag() throws JspException {
    ServletRequest request = pageContext.getRequest();
    String passwordFlag = request.getParameter("password");

    if ((passwordFlag != null) && (passwordFlag.equalsIgnoreCase("please"))) {
      try {
        JspWriter out = pageContext.getOut();
        out.print("This message is secret.  Shh...");
      } 
      catch (IOException ioe) {
        System.out.println("Error in ExampleTag: " + ioe);
      }

      return (SKIP_BODY);
    } 
    else {
      return (EVAL_BODY_INCLUDE);
    }
  }

}
