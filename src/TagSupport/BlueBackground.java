package TagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/*
    Changes the background color of Tag's body to blue
*/
public class BlueBackground extends TagSupport 
{
    public int doStartTag() 
    {
        try 
        {
            JspWriter out = pageContext.getOut();
            out.print("<span style=\"background-color: blue;\">");
        } 
        catch (IOException ioe) 
        {
            System.out.println("Error in HeadingTag: " + ioe);
        }
        
        return (EVAL_BODY_INCLUDE); 
    }

    public int doEndTag() 
    {
        try 
        {
            JspWriter out = pageContext.getOut();
            out.print("</span>");
        } 
        catch (IOException ioe) 
        {
            System.out.println("Error in HeadingTag: " + ioe);
        }
        
        return (EVAL_PAGE);
    }
}