package BodyTagSupport;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

// author: Todd Gerspacher
public class GroceryList extends BodyTagSupport {

  @Override
  public int doStartTag() throws JspException {
    System.out.println("doStartTag");
    try {
      JspWriter out = pageContext.getOut( );
      out.print("<ul>");
    }
    catch(IOException ioException) {
      System.out.println(ioException);
      return SKIP_BODY;
    }

    return EVAL_BODY_BUFFERED;
  }

  @Override
  public void doInitBody() throws JspException {
    System.out.println("doInitBody");
      try {
        JspWriter out = pageContext.getOut();
        out.write("");
      } catch(IOException ioe) {
        throw new JspException(ioe.getMessage());
      } 
  }
  
  @Override
  public int doAfterBody() throws JspException {
    System.out.println("doAfterBody");
    try {
      BodyContent bodyContent = getBodyContent();
      String items[] = bodyContent.getString().split(", ");
      JspWriter out = pageContext.getOut();
      out.write("");

      for(String item : items) {
        bodyContent.print("<li>" + item + "</li>");
      }
    } catch(IOException ioe) {
      throw new JspException(ioe.getMessage());
    } 

    return SKIP_BODY;
  }


  @Override
  public int doEndTag() throws JspException {
    System.out.println("doEndTag");
    try {
      JspWriter out = pageContext.getOut( );

      out.print(bodyContent.getString());
      out.print("</ul>");
    }
    catch(IOException ioException) {
      System.out.println(ioException);
    }

    return EVAL_PAGE;
  }

}
