<%@ page errorPage="ErrorPage.jsp" %>

<html>
  <head>
    <title>Error Handling Example</title>
  </head>
  <body>
    <%--
      Simple JSP page for testing ErrorPage.jsp that was copied from
      http://www.tutorialspoint.com/jsp/jsp_exception_handling.htm
    --%>
    <%
       // Throw an exception to invoke the error page
       int x = 1;
       if (x == 1) {
          throw new RuntimeException("Error condition!!!");
       }
    %>
  </body>
</html>
