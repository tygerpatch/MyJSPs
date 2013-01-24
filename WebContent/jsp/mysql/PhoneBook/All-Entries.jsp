<%@ page errorPage="../../error-page/ErrorPage.jsp" %>
<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>

<html>
  <body>

    <table border='1'>
      <tr>
        <th>First</th>
        <th>Last</th>
        <th>Phone #</th>
      </tr>

      <%
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        Class.forName(JDBC_DRIVER);
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM phonebook");

        while (resultSet.next()) {
      %>
      <tr>
        <td><%= resultSet.getString("FirstName") %></td>
        <td><%= resultSet.getString("LastName") %></td>
        <td><%= resultSet.getString("PhoneNumber") %></td>
      </tr>
      <% } %>
    </table>
  </body>
</html>
