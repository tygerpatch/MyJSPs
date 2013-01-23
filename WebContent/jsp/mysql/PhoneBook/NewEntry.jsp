<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>

<html>
  <body>
    <%
      String firstName = request.getParameter("firstName");
      String lastName = request.getParameter("lastName");
      String phoneNumber = request.getParameter("phoneNumber");

      if ((null != firstName) && (null != lastName) && (null != phoneNumber)) {
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        Class.forName(JDBC_DRIVER);
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8080/my_jdbc", "root", "password");

        StringBuffer sqlStatement = new StringBuffer("INSERT INTO phonebook VALUES(\"");

        sqlStatement.append(firstName);
        sqlStatement.append("\",\"");
        sqlStatement.append(lastName);
        sqlStatement.append("\",\"");
        sqlStatement.append(phoneNumber);
        sqlStatement.append("\")");

        Statement statement = connection.createStatement();
        statement.executeUpdate(sqlStatement.toString());
    %>
      <h3>New Entry Added</h3>
    <% } %>
    <form method="get" action="NewEntry.jsp">
      <table>
        <tr>
          <td>First</td>
          <td><input type="text" name="firstName" value="" /></td>
        </tr>
        <tr>
          <td>Last</td>
          <td><input type="text" name="lastName" value="" /></td>
        </tr>
        <tr>
          <td>Phone #</td>
          <td><input type="text" name="phoneNumber" value="" /></td>
        </tr>
        <tr>
          <td><input type="submit" value="Okay" /></td>
          <td><input type="reset" value="Clear" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>
