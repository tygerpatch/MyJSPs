<jsp:useBean id="user" class="beans.UserData" scope="session" />

<!--
  "Beans and Form processing", JSP Tutorial,
  http://www.jsptut.com/forms.jsp
 -->
<jsp:setProperty name="user" property="*" />
<html>
  <body>
    <a href="NextPage.jsp">Continue</a>
  </body>
</html>