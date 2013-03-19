<%@ page errorPage="../error-page/ErrorPage.jsp" %>
<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>

<html>
  <body>
    <%
      String title = request.getParameter("title");
      String author = request.getParameter("author");

      if ((null != title) && (null != author)) {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");
        Statement statement = connection.createStatement();
        statement.executeUpdate("INSERT INTO books(title, author) values('"+ title + "','" + author + "')");

        statement.close();
        connection.close();
    %>
      <h3>Book Successfully Added</h3>
    <% } %>
    <%-- TODO: create menu to Add New Book, View All Books, and Search for a Book --%>
    <%-- TODO: How to add entry on server, not through JSP page --%>
    <%-- TODO: validate form, never accept anything from client without validating first --%>
    <form action="NewBook.jsp" method="post">
      <table>
        <tr>
          <td>Title:</td>
          <td><input name="title" type="text" size="50">
          </td>
        </tr>
        <tr>
          <td>Author:</td>
          <td><input name="author" type="text" size="50">
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="Okay" /></td>
          <td><input type="reset" value="Clear" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>
