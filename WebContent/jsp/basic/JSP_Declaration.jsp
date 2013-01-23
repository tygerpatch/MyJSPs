<!--
  "JSP Declaration", JSP Tutorial,
  http://www.jsptut.com/declarations.jsp
-->
<%@ page import="java.util.*"%>

<html>
  <body>
    <%--
      "The date will be the same, no matter how often you reload the page.
      This is because these are declarations, and will only be evaluated once when the page is loaded!"

      <"JSP Declaration", JSP Tutorial, http://www.jsptut.com/declarations.jsp>
    --%>
    <%!
      Date theDate = new Date();

      Date getDate() {
        System.out.println("In getDate() method");
        return theDate;
      }
    %>
    Hello! The time is now <%=getDate()%>
  </body>
</html>
