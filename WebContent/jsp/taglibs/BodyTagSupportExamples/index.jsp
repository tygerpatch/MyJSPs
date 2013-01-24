<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/tld/BodyTagSupportTLD" prefix="bts" %>
<%@ taglib uri="/WEB-INF/tld/TagSupportTLD" prefix="ts" %>

<html>
    <body>
        <a href="./FilterExample.jsp">FilterExample</a>        
        <br />
        <hr />
        <!-- Repeats N times. A null reps value means repeat once. -->
        <bts:repeat reps="3">
            Hello World.
            <br>
        </bts:repeat>
        <br>
        <hr />
        <!-- *************************************** -->                
        <p>
            Water boils at 100 Celsius which is <bts:convert to="Fahrenheit">100</bts:convert> Fahrenheit.<br />
            Water boils at 100 Celsius which is <bts:convert to="F">100</bts:convert> Fahrenheit.<br />
            Water boils at 100 Celsius which is <bts:convert>100</bts:convert> Fahrenheit.
        </p>
        <p>
            Water boils at 100 Celsius which is <bts:convert to="Kelvin">100</bts:convert> Kelvin.<br />
            Water boils at 100 Celsius which is <bts:convert to="K">100</bts:convert> Kelvin.
        </p>
        <hr />
        <!-- *************************************** -->          
        <!-- TODO: is there a way to declare tld's inline -->
        
        True <br />
        <bts:if predicate="<%= 5==5 %>">
            <ts:HelloWorld />   
        </bts:if>
        False <br />        
        <bts:if predicate="false">
            <ts:HelloWorld />   
        </bts:if>
        <br />        
        <hr />
        <!-- *************************************** -->          
         TODO: Outter/Inner Tags
         <%--
        <bts:outter msg="Outside">
            <ts:inner msg="Inner" /></bts:outter>
        </bts:outter> --%>
        <br />        
        <hr />
        <!-- *************************************** -->                      
        <bts:write fontColor="red">
            Hello World!
        </bts:write>
        <%--
        <bts:write  fontColor="red">
            Hello World!
        </bts:write> --%>
    </body>
</html>

<%--
// This doesn't work
	<%!
            for(int i = 0; i < 4; i++)
            {
	%>
            <%= i %>
        <%
            }
         %>
         <br /> --%>