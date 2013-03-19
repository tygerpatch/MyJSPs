<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="/WEB-INF/tld/BodyTagSupportTLD" prefix="bodyTagSupport" %>
<%@ taglib uri="/WEB-INF/tld/TagSupportTLD" prefix="ts" %>

<html>
    <body>
        <a href="./FilterExample.jsp">FilterExample</a>        
        <br />
        <hr />
        <!-- Repeats N times. A null reps value means repeat once. -->
        <bodyTagSupport:repeat reps="3">
            Hello World.
            <br>
        </bodyTagSupport:repeat>
        <br>
        <hr />
        <!-- *************************************** -->
        <p>
            Water boils at 100 Celsius which is <bodyTagSupport:convert to="Fahrenheit">100</bodyTagSupport:convert> Fahrenheit.<br />
            Water boils at 100 Celsius which is <bodyTagSupport:convert to="F">100</bodyTagSupport:convert> Fahrenheit.<br />
            Water boils at 100 Celsius which is <bodyTagSupport:convert>100</bodyTagSupport:convert> Fahrenheit.
        </p>
        <p>
            Water boils at 100 Celsius which is <bodyTagSupport:convert to="Kelvin">100</bodyTagSupport:convert> Kelvin.<br />
            Water boils at 100 Celsius which is <bodyTagSupport:convert to="K">100</bodyTagSupport:convert> Kelvin.
        </p>
        <hr />
        <!-- *************************************** -->          
        <!-- TODO: is there a way to declare tld's inline -->
        
        True <br />
        <bodyTagSupport:if predicate="<%= 5==5 %>">
            <ts:HelloWorld />   
        </bodyTagSupport:if>
        False <br />        
        <bodyTagSupport:if predicate="false">
            <ts:HelloWorld />   
        </bodyTagSupport:if>
        <br />        
        <hr />
        <!-- *************************************** -->
         TODO: Outter/Inner Tags
         <%--
        <bodyTagSupport:outter msg="Outside">
            <ts:inner msg="Inner" /></bodyTagSupport:outter>
        </bodyTagSupport:outter> --%>
        <br />        
        <hr />
        <!-- *************************************** -->
        <bodyTagSupport:write fontColor="red">
            Hello World!
        </bodyTagSupport:write>
        <%--
        <bodyTagSupport:write  fontColor="red">
            Hello World!
        </bodyTagSupport:write> --%>
        <hr />
        <bodyTagSupport:GroceryList>apples, oranges, pears, carrots</bodyTagSupport:GroceryList>
    </body>
</html>
