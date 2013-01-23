<%@ page errorPage="ErrorPage.jsp" %>

<html>
  <head>
    <title>Error Handling Example</title>
  </head>
  <body>
  <%--
    Simple JSP page for testing ErrorPage.jsp that was derived from
    http://www.tutorialspoint.com/jsp/jsp_exception_handling.htm
  --%>
  <% throw new RuntimeException("Error condition!!!"); %>
  </body>
</html>
