<%@ tag import = "java.util.Date" import = "java.text.DateFormat" %>
<%
  DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
  Date now = new Date(System.currentTimeMillis());
  out.println(dateFormat.format(now));
%>
<%-- The above was taken from Budi Kurniawan's 
A Tutorial : Servlet & JSP, pg 181  --%>
