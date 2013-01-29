package TagSupport;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

// author: Todd Gerspacher
public class GroceryList extends TagSupport {

  private String[] items;
  private int index = 0;

  public void setItems(String items) {
    this.items = items.split(", ");
  }

  @Override
  public int doStartTag() throws JspException {
    try {
      JspWriter out = pageContext.getOut( );
      out.print("<ul>");
    }
    catch(IOException ioException) {
      System.out.println(ioException);
      return SKIP_BODY;
    }

    return EVAL_BODY_INCLUDE;
  }

  @Override
  public int doAfterBody() throws JspException {
    try {
      JspWriter out = pageContext.getOut();

      if(index < items.length) {
        out.print("<li>" + items[index++] + "</li>");
        return EVAL_BODY_AGAIN;
      }
    }
    catch(IOException ioException) {
      System.out.println(ioException);
    }

    return SKIP_BODY;
  }

  @Override
  public int doEndTag() throws JspException {
    try {
      JspWriter out = pageContext.getOut( );
      out.print("</ul>");
    }
    catch(IOException ioException) {
      System.out.println(ioException);
    }

    return EVAL_PAGE;
  }
}
