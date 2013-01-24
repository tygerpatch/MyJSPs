<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" dcontent="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<!-- 888888888888888888888888888888888888888888888 -->

<html>
<head>
<script type="text/javascript">
    function ShowHints() {
        //alert("Show Hints");

        // *** Create XMLHttpRequest object
        //alert("Create XMLHttpRequest");

        var xmlHttp = null;

        // Firefox, Mozilla, and Opera
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
        }
        // Internet Explorer 5.5 and later
        else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        // *** State Change Function
        // alert("Ready State Change");

        xmlHttp.onreadystatechange = function() {
            // alert("State Changed");
            if ((xmlHttp.readyState == 4) || (xmlHttp.readyState == "complete")) {
                // var myDiv = document.myForm.myDiv;
                var myDiv = document.getElementById("myDiv");

                // alert( xmlHttp.responseText );
                // remove children nodes from myDiv
                //for(i = 0; i < myDiv.childNodes.length; i++)
                //{
                //    myDiv.removeChild( myDiv.childNodes[i] );
                //}

                // add new children nodes to myDiv
                myDiv.innerHTML = xmlHttp.responseText;
                myDiv.style.visibility = "visible";
                // alert("Updating Page");
            }
        }

        // *** Sending request
        //alert("Open/Send");

        var url = "Suggest.jsp?search=" + document.myForm.myInput.value;

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);

        //alert(xmlHttp.readyState);
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
        <td>Suggestion</td>
        <td>
          <div id="myDiv"
            style="border-style: solid; border-width: thin; visibility: hidden;">
          </div>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>

<!-- 888888888888888888888888888888888888888888888 -->

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
