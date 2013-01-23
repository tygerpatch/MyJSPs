<!--
  "Cookies in JSP", roseindia.net
  http://roseindia.net/jsp/jspsession/Cookies.shtml
-->
<%@ page language="java" import="java.util.*"%>

<%
  String username = request.getParameter("username");

  if (username == null)
    username = "NULL";

  // Date now = new Date();
  // String timestamp = now.toString();

  Cookie cookie = new Cookie("username", username);
  cookie.setMaxAge(-1);

  response.addCookie(cookie);
%>

<html>
  <head>
    <title>Cookie Saved</title>
  </head>

  <body>
    <p>
      <a href="ShowCookie.jsp"> Next Page to view the cookie value </a>
    <p>
  </body>
</html>
