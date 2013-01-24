<%@page errorPage="../error-page/ErrorPage.jsp" %>
<%@page import="com.mysql.jdbc.Driver, java.sql.DriverManager, java.sql.Connection, java.sql.Statement, java.sql.ResultSet"%>

<%
  Class.forName("com.mysql.jdbc.Driver").newInstance();
  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_jdbc", "root", "password");
  Statement statement = connection.createStatement();
  statement.executeUpdate("INSERT INTO books(name, author) values('"+ name + "','" + author + "')");
  ResultSet resultSet = statement.executeQuery("SELECT * FROM books");

  statement.close();
  connection.close();

  if (request.getParameter("search") != null) {
    String str = request.getParameter("search");
    // System.out.println("search = " + str);
    resultSet = statement.executeQuery("select author from authors where author like '" + str + "%';");

    //System.out.println( "select author from authors where author like '" + str + "%';" );

    System.out.println("******************************");
    try {
      while (resultSet.next()) {
        //resultSet.
        // out.write("<div>" + resultSet.toString() + "</div>");
        // System.out.println( "Author: " + resultSet.toString() );

        System.out.println(resultSet.getString("author"));
        out.write("<div>" + resultSet.getString("author") + "</div>");
      }

      // writer.close();
    } catch (java.sql.SQLException sqlException) {
      // TODO:
    }
  }
%>

<html>
  <head>
    <script type="text/javascript">
      function ShowHints() {
        var xmlHttp = null;

        // Firefox, Mozilla, and Opera
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
        // Internet Explorer 5.5 and later
        else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.onreadystatechange = function() {
            if ((xmlHttp.readyState == 4) || (xmlHttp.readyState == "complete")) {
                var myDiv = document.getElementById("myDiv");
                myDiv.innerHTML = xmlHttp.responseText;
                myDiv.style.visibility = "visible";
            }
        }

        var url = "Suggest.jsp?search=" + document.myForm.myInput.value;

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
      }
    </script>
  </head>
  <body>
    <form name="myForm">
      <table border="0">
        <tr>
          <td>Search</td>
          <td><input onkeyup="ShowHints()" name="myInput"></td>
        </tr>
        <tr>
          <td colspan="2"><div id="myDiv" style="border-style: solid; border-width: thin; visibility: hidden;"></div></td>
        </tr>
      </table>
    </form>
  </body>
</html>
