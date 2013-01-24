<%@ page errorPage="../../error-page/ErrorPage.jsp" %>
<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>

<html>
  <body>
    <h2>Books List</h2>
    <table border='1'>
      <tr>
        <th>Book Name</th>
        <th>Author</th>
      </tr>
      <%-- TODO: create menu to Add New Book, View All Books, and Search for a Book --%>
      <%
        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        Class.forName(JDBC_DRIVER);
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM books");

        while (resultSet.next()) {
      %>
      <tr>
        <td><%= resultSet.getString("name") %></td>
        <td><%= resultSet.getString("author") %></td>
      </tr>
      <%
        }

        resultSet.close();
        statement.close();
        connection.close();
      %>
    </table>
  </body>
</html>
