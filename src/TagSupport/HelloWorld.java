package TagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class HelloWorld extends TagSupport 
{
    public int doStartTag() 
    {
        try 
        {
            JspWriter out = pageContext.getOut();
            out.print("Hello World");
        } 
        catch (IOException ioe) 
        {
            System.out.println("Error in ExampleTag: " + ioe);
        }
        
        return (SKIP_BODY);  
    }
}
        
        
        
        
        
        