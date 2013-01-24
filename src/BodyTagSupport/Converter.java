package BodyTagSupport;

import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class Converter extends BodyTagSupport
{
    private String _to = null;

    public String getTo()
    { 
        return _to; 
    }
    
    public void setTo(String t)
    {
        _to = t; 
    }
    
    public int doAfterBody()
    {
        try
        {
            BodyContent bc = getBodyContent();

            double temperature = Double.parseDouble(bc.getString());

            if(_to == null || _to.length() == 0 ||
                    _to.toUpperCase().startsWith("F"))
            {
                bc.getEnclosingWriter().print( toFahrenheit(temperature) );

            }
            else
            {       
                bc.getEnclosingWriter().print( toKelvin(temperature) );
            }
        }
        catch(Exception ignore)
        {
            ignore.printStackTrace();
        }

        return EVAL_PAGE; 
    }

    private double toFahrenheit(double c)
    {
        return 32.0 + (c*1.8);
    }

    private double toKelvin(double c)
    {
        return 273.0 + c;
    }
}