<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="java.io.*" %>

<%
    try
    {
        // System.out.println("Driver...");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
    }
    catch (java.lang.ClassNotFoundException notFound)
    {
        // TODO:
    }
    catch (java.lang.IllegalAccessException illegalAccess) 
    {
        // TODO:
    }
    catch (java.lang.InstantiationException badInstantiation)
    {
        // TODO:
    }

    java.sql.Connection connection = null;
    java.sql.Statement statement = null;
    java.sql.ResultSet resultSet = null;

    try
    {
        // System.out.println("Connection...");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/todd?user=root");
        // System.out.println("Create Statement...");
        statement = connection.createStatement();
    }
    catch (java.sql.SQLException sqlException)
    {
        // TODO:
    }

    if (request.getParameter("search") != null)
    {
        String str = request.getParameter("search");
        // System.out.println("search = " + str);
        resultSet = statement.executeQuery("select author from authors where author like '" + str + "%';");

        //System.out.println( "select author from authors where author like '" + str + "%';" );

        System.out.println("******************************");
        try
        {                        
            while( resultSet.next() )
            {
                //resultSet.
                // out.write("<div>" + resultSet.toString() + "</div>");
                // System.out.println( "Author: " + resultSet.toString() );
                
                System.out.println( resultSet.getString("author") );
                out.write("<div>" + resultSet.getString("author") + "</div>");
            }

            // writer.close();
	}
        catch (java.sql.SQLException sqlException)
        {
            // TODO:
        }
    }
%>
