<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--
  "Chapter 2: JavaBeans", masslight,
  http://j2ee.masslight.com/Chapter2.html
 -->
<html>
  <head>
    <title>Hello Example</title>
  </head>
  <body>
    <jsp:useBean id="greeter" class="beans.GreeterBean" scope="session" />
    <%=greeter.sayHello()%>
  </body>
</html>
