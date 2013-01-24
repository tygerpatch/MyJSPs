package TagSupport;

/*
    A tag that includes the body content only if
    the "debug" request parameter is set.
 */

import java.io.IOException;
import javax.servlet.ServletRequest;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class SecretMessage extends TagSupport
{
    public int doStartTag() 
    {
        ServletRequest request = pageContext.getRequest();        
        String passwordFlag = request.getParameter("password");
                
        if((passwordFlag != null) && (passwordFlag.equalsIgnoreCase("please"))) 
        {
            try 
            {
                JspWriter out = pageContext.getOut();
                out.print("This message is secret.  Shh...");
            } 
            catch (IOException ioe) 
            {
                System.out.println("Error in ExampleTag: " + ioe);
            }
    
            return(SKIP_BODY);            
        } 
        else 
        {
            return(EVAL_BODY_INCLUDE);
        }
    }
}

        
        
        
        
        
        
        
        
