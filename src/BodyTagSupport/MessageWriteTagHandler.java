package BodyTagSupport;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

//Beginning Apache Struts: From Novice to Professional, Arnold Doray, pg 28 & 29
//
//<message:write font-color="red">
//Hello World!
//</message:write>
public class MessageWriteTagHandler extends BodyTagSupport {
  private String fontColor = "black"; // default font color

  public String getFontColor() {
    return fontColor;
  }

  public void setFontColor(String fontColor) {
    this.fontColor = fontColor;
  }

  @Override
  public int doAfterBody() throws JspException {
    try {
      BodyContent bc = getBodyContent();
      JspWriter out = bc.getEnclosingWriter();

      out.write("<p style=\"color: ");
      out.write(fontColor);
      out.write(";\">");
      out.write(bc.getString());
      out.write("</p>");

      // out.write("<font color=\"");
      // out.write( fontColor);
      // out.write("/\">");
      // out.write(bc.getString());
      // out.write("</font>");

    } catch (Exception ignore) {
      // tell the servlet container to continue
      // processing the rest of the page:
      ignore.printStackTrace();
    }

    return EVAL_PAGE;
  }
}

