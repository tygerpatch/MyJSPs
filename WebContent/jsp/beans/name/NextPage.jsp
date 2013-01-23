<jsp:useBean id="user" class="beans.UserData" scope="session" />

<!--
  "Beans and Form processing", JSP Tutorial,
  http://www.jsptut.com/forms.jsp
 -->
<html>
  <body>
    You entered <br />
    Name: <%=user.getUsername()%><br />
    Email: <%=user.getEmail()%><br />
    Age: <%=user.getAge()%><br />
  </body>
</html>