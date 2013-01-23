<%--
	The JSP you write turns into a class definition.  
	All the scriptlets you write are placed inside a single method of this class.
	
	To add a declaration, you must use the <%! and %> sequences to enclose your declarations, as shown below.
--%>
<%@ page import="java.util.*" %>

<HTML>
	<BODY>
		<%!
		    Date theDate = new Date();

		    Date getDate()
		    {
		        System.out.println( "In getDate() method" );
		        return theDate;
		    }
		%>

		Hello!  The time is now <%= getDate() %>
	</BODY>
</HTML>

<!--
	The date will be the same, no matter how often you reload the page.  
	This is because these are declarations, and will only be evaluated once when the page is loaded!  

	It is generally not a good idea to use variables as shown here. 
	The JSP usually will run as multiple threads of one single instance. 
	Different threads would interfere with variable access, because it will be the same variable for all of them. 

	If you do have to use variables in JSP, you should use synchronized access, which will hurt the performance. 

	In general, any data you need should go either in the session object or the request object
	 if passing data between different JSP pages. 

	Variables you declare inside scriptlets are fine, 
	because these are declared inside the local scope and are not shared. 
	e.g. <% int i = 45; %> 
-->