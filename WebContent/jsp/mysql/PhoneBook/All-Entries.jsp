<%-- http://localhost:8080/MyJSPs/PhoneBook/All-Entries.jsp --%>

<%@page import = "java.sql.*" %>
<%@page import = "com.mysql.jdbc.*" %>


<html>
	<body>
	<table border='1'>
		<tr>
			<th>First</th>
			<th>Last</th>
			<th>Phone #</th>
		</tr>
	
	<%
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

			// send sql statement to the DBMS 
			java.sql.Statement statement = connection.createStatement();

			// "For a SELECT statement, the method to use is executeQuery." (pg 40, JDBC book)
			java.sql.ResultSet resultSet = statement.executeQuery( "select * from phonebook");

			while( resultSet.next() )
			{
		%>
			<tr>
				<td><%= resultSet.getString("FirstName") %></td>
				<td><%= resultSet.getString("LastName") %></td>
				<td><%= resultSet.getString("PhoneNumber") %></td>
			</tr>
		<%
			}
		}
		catch (Exception ex) 
		{
	%>
				 <br><%= ex.toString() %> 1<br />
	<%	
		}
		%>
	</table>
	</body>
</html>
