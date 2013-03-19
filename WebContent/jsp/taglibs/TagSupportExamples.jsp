<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/TagSupportTLD" prefix="tagSupport" %>
<%@ page errorPage="ErrorPage.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Tag Support</title>
    </head>
    <body>
        <p>
            Example 1: <tagSupport:HelloWorld /><br />
            <tagSupport:BlueBackground>Example 2</tagSupport:BlueBackground><br />
            <a href="./TagSupportExamples.jsp?password=please">
                Example 3: <tagSupport:SecretMessage></tagSupport:SecretMessage>
            </a><br />
            Example 4: <tagSupport:ReverseString str="This message is in reverse!" /><br />
            Example 5: <tagSupport:GroceryList items = "apples, oranges, pears, carrots"> </tagSupport:GroceryList>
            <%-- Note: The space is necessary between GroceryList tags in order for the doAfterBody method to be evaluated --%> 
        </p>
    </body>
</html>
