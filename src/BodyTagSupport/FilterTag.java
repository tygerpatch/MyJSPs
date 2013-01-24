package BodyTagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

// Converts < and > to &lt; and &gt;
public class FilterTag extends BodyTagSupport 
{
    public int doAfterBody() 
    {
        // BodyContent encapsulates information about the tag body.
        BodyContent bodyConent = getBodyContent();
        
        // String filteredBody = bodyContent.getString();
        String strBody = bodyContent.getString();
        
// public String replace(CharSequence target,  CharSequence replacement)        
        strBody = strBody.replace("<", "&lt;");
        strBody = strBody.replace(">", "&gt;");                      
        
        try 
        {
            JspWriter out = bodyContent.getEnclosingWriter();
            out.print(strBody);
        } 
        catch (IOException ioe) 
        {
            System.out.println("Error in FilterTag: " + ioe);
        }
        
        return (SKIP_BODY);
    }
}