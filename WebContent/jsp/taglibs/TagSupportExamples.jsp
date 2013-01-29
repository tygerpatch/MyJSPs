<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/TagSupportTLD" prefix="ts" %>
<%@ page errorPage="ErrorPage.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title>Tag Support</title>
    </head>
    <body>
        <p>
            Example 1: <ts:HelloWorld /><br />
            <ts:BlueBackground>Example 2</ts:BlueBackground><br />
            <a href="./TagSupportExamples.jsp?password=please">
                Example 3: <ts:SecretMessage></ts:SecretMessage>
            </a><br />
            Example 4: <ts:ReverseString str="This message is in reverse!" /><br />
            Example 5: <ts:GroceryList items = "apples, oranges, pears, carrots"> </ts:GroceryList>
            <%-- Note: The space is necessary between GroceryList tags in order for the doAfterBody method to be evaluated --%> 
        </p>
    </body>
</html>
