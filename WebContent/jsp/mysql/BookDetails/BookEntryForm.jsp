<%@ page language="java" import="java.sql.*" %>

<%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (java.lang.ClassNotFoundException notFound) {
%>
<br><%= notFound.toString()%><br />
<%
} catch (java.lang.IllegalAccessException illegalAccess) {
%>
<br><%= illegalAccess.toString()%><br />
<%
} catch (java.lang.InstantiationException badInstantiation) {
%>
<br><%= badInstantiation.toString()%><br />
<%
            }

            java.sql.Connection connection = null;
            java.sql.Statement statement = null;
            java.sql.ResultSet resultSet = null;

            try {
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabases?user=root");
                statement = connection.createStatement();
            } catch (java.sql.SQLException sqlException) {
%>
<br><%= sqlException.toString()%><br />
<%
            }

            if (request.getParameter("action") != null) {
                String bookname = request.getParameter("bookname");
                String author = request.getParameter("author");

                try {
                    statement.executeUpdate("insert into books_details(book_name, author) values('" + bookname + "','" + author + "')");
                    resultSet = statement.executeQuery("select * from books_details");
                } catch (java.sql.SQLException sqlException) {
%>
<br><%= sqlException.toString()%><br />
<%
    }
%>

<html>
    <body>
        <center>
            <h2>Books List</h2>
            
            <table border="1" cellspacing="0" cellpadding ="0">
                <tr>
                    <th>S.No</th>
                    <th>Book Name</th>
                    <th>Author</th>
                </tr>
                <%
    int id = 1;
    while (resultSet.next()) {
                %>
                <tr>
                    <td><%= id%></td>
                    <td><%= resultSet.getString("book_name")%></td>
                    <td> <%=resultSet.getString("author")%> </td>
                </tr>
                <%
        id++;
    }

    try {
        resultSet.close();
        statement.close();
        connection.close();
    } catch (java.sql.SQLException sqlException) {
                %>		
                <br><%= sqlException.toString()%><br />
                <%
    }
                %>
            </table>
        </center>
    </body>
</html>

<%
} else {
%>

<html>
    <head>
        <title>Book Entry FormDocument</title>
        
        <script language="javascript">

            function validate(objForm)
            {
                if( objForm.bookname.value.length == 0 )
                {
                    alert("Please enter Book Name!");

                    objForm.bookname.focus();

                    return false;
                }

                if( objForm.author.value.length == 0 )
                {
                    alert("Please enter Author name!");

                    objForm.author.focus();

                    return false;
                }

                return true;
            }
        </script>
    </head>
    
    <body>
        <center>
            
            <form action="BookEntryForm.jsp" method="post" name="entry" onSubmit="return validate(this)">
                
                <input type="hidden" value="list" name="action">
                
                <table border="1" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table>
                                <tr>
                                    <td colspan="2" align="center">
                                        <h2>Book Entry Form</h2>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2">&nbsp;</td>
                                </tr>
                                
                                <tr>
                                    <td>Book Name:</td>
                                    <td>
                                        <input name="bookname" type="text" size="50">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>Author:</td>
                                    <td>
                                        <input name="author" type="text" size="50">
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td colspan="2" align="center">
                                        <input type="submit" value="Submit">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>

<%            }
%>
