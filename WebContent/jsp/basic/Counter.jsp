<!--
  "Introduction to JSP Declaratives", roseindia,
  http://www.roseindia.net/jsp/jspdeclaratives.shtml
-->
<%@page contentType="text/html"%>
<html>
  <body>
    <%!
    int count = 0;

    private int getCount() {
      count++;
      return count;
    }
    %>

    <p>Values of Count are:</p>
    <p><%= getCount() %></p>
    <p><%= getCount() %></p>
    <p><%= getCount() %></p>
    <p><%= getCount() %></p>
    <p><%= getCount() %></p>
    <p><%= getCount() %></p>
  </body>
</html>