package BodyTagSupport;

import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

// Repeats the body content the number of times specified by the reps attribute.
public class RepeatTag extends BodyTagSupport 
{
    private int reps;

    public void setReps(String repeats) 
    {
        try 
        {
            reps = Integer.parseInt(repeats);
        } 
        catch (NumberFormatException nfe) 
        {
            reps = 1;
        }
    }

    public int doAfterBody() 
    {
        if((reps--) >= 1)
        {
            BodyContent body = getBodyContent();
            
            try 
            {
                JspWriter out = body.getEnclosingWriter();
                out.println(body.getString());

                // Clear for next evaluation
                body.clearBody(); 
            } 
            catch (IOException ioe) 
            {
                System.out.println("Error in RepeatTag: " + ioe);
            }
            
            return EVAL_BODY_AGAIN;
        } 
        else 
        {
            return SKIP_BODY;
        }
    }
}