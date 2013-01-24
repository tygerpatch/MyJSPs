package BodyTagSupport;

import javax.servlet.jsp.tagext.BodyTagSupport;

public class OutterTag extends BodyTagSupport
{
    private String msg;

    public String getMsg() 
    {
        return msg;
    }

    public void setMsg(String msg) 
    {
        this.msg = msg;
    }
}