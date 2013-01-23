<%-- http://localhost:8080/MyJSPs/PhoneBook/NewEntry.jsp --%>

<%@page import = "java.sql.*" %>
<%@page import = "com.mysql.jdbc.*" %>


<html>
	<body>
	<%
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phoneNumber = request.getParameter("phoneNumber");

		if((null != firstName) && (null != lastName) && (null != phoneNumber))
		{
			try 
			{
				// The newInstance() call is a work around for some
				   // broken Java implementations
				   Class.forName("com.mysql.jdbc.Driver").newInstance();
			} 
			catch (Exception ex) 
			{
	%>
				 <br><%= ex.toString() %> 1<br />
	<%	
			}

			try
			{
			// loading the driver
	               //	Class.forName("com.mysql.jdbc.Driver");

			// connecting the driver to the DBMS
	//Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:8080/todd");

java.sql.Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/todd?user=root");

			// "The JDBC URL format for MySQL Connector/J is as follows, 
			//   with items in square brackets ([, ]) being optional:
			//
			// jdbc:mysql://[host][,failoverhost...][:port]/[database] »
			// [?propertyName1][=propertyValue1][&propertyName2][=propertyValue2].."
			//
			// page 12, connect-j.pdf

			// INSERT INTO table_name VALUES (value1, value2, value3,...)
			StringBuffer sqlStatement = new StringBuffer( "insert into phonebook values(\"" );

			sqlStatement.append( firstName );
			sqlStatement.append( "\",\"" );
			sqlStatement.append( lastName );
			sqlStatement.append( "\",\"" );
			sqlStatement.append( phoneNumber );
			sqlStatement.append( "\")" );

			// send sql statement to the DBMS 
			java.sql.Statement statement = connection.createStatement();

			// "For statements that create or modify tables, use the executeUpdate method." (pg 40, JDBC book)
			statement.executeUpdate( sqlStatement.toString() ); 
		%>
			<h3>New Entry Added</h3>
		<%
			}
			catch(Exception e)
			{
		%>
				<%= e.toString() %> 2<br />
		<%
			}
		}
		%>

	<form method = "get" action = "NewEntry.jsp" >
	<table>
		<tr>
			<td>First</td>
			<td><input type = "text" name = "firstName" value = "" /></td>
		</tr>
		<tr>
			<td>Last</td>
			<td><input type = "text" name = "lastName" value = "" /></td>
		</tr>
		<tr>
			<td>Phone #</td>
			<td><input type = "text" name = "phoneNumber" value = "" /></td>
		</tr>
		<tr>
			<td><input type = "submit" value = "Okay" /></td>
			<td><input type = "reset" value = "Clear" /></td>
		</tr>
	</table>
	</form>
</html>
