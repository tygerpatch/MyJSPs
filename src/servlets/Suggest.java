package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Suggest extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html");

    String searchBy = request.getParameter("searchBy"); // either "author" or "title"
    String userInput = request.getParameter("userInput");

    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    }
    catch(IllegalAccessException illegalAccessException) {
      illegalAccessException.printStackTrace();
      return;
    }
    catch(InstantiationException instantiationException) {
      instantiationException.printStackTrace();
      return;
    }
    catch(ClassNotFoundException classNotFoundException) {
      classNotFoundException.printStackTrace();
      return;
    }

    try {
      Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");

      String sql = "SELECT " + searchBy + " FROM books WHERE " + searchBy + " LIKE '%" + userInput + "%'";
      Statement statement = connection.createStatement();

      ResultSet resultSet = statement.executeQuery(sql);

      String title, author;

      PrintWriter out = response.getWriter();

      while(resultSet .next( )) {
        out.println("<div>" + resultSet.getString(searchBy) + "</div>");
      }

      statement.close();
      connection.close();
    }
    catch(SQLException sqlException) {
      sqlException.printStackTrace();
      return;
    }
  }
}

//<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>
//
//<%-- TODO: create menu to Add New Book, View All Books, and Search for a Book --%>
//<%-- TODO: How to Search for book on server, not through JSP page --%>
//<%-- TODO: How to pass results of Search to page through AJAX --%>
//<%-- TODO: How to search for BOTH author and title --%>
//
//<%
//%>

// ****************************

//// Write response data as JSON.
//response.setContentType("text/plain");   
//response.getWriter().write("Hello World");

// **************************************************

//Class.forName("com.mysql.jdbc.Driver").newInstance();
//Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");
//Statement statement = connection.createStatement();
//statement.executeUpdate("SELECT * FROM books where title = userInput");
//statement.executeUpdate("SELECT * FROM books where author = userInput");
//
//statement.executeUPdate
//    "" +
//    "INSERT INTO books(name, author) values('"+ name + "','" + author + "')");
//ResultSet resultSet = statement.executeQuery("SELECT * FROM books");
//
//statement.close();
//connection.close();
//
//if (request.getParameter("search") != null) {
//  String str = request.getParameter("search");
//  resultSet = statement.executeQuery("select author from authors where author like '" + str + "%';");
//  try {
//    while (resultSet.next()) {
//      //resultSet.
//      // out.write("<div>" + resultSet.toString() + "</div>");
//      // System.out.println( "Author: " + resultSet.toString() );
//
//      System.out.println(resultSet.getString("author"));
//      out.write("<div>" + resultSet.getString("author") + "</div>");
//    }
//
//    // writer.close();
//  } catch (java.sql.SQLException sqlException) {
//    // TODO:
//  }
//}
//
//
//System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//System.out.println("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
//System.out.println("Suggest Servlet");
//
//System.out.println("searchBy = " + searchBy);
//System.out.println("userInput = " + userInput);
//
//
//PrintWriter out = response.getWriter();
//out.println("<html>");
//out.println("<body>");
//out.println("<h3>Hello World</h3>");
//out.println("</body>");
//out.println("</html>");
