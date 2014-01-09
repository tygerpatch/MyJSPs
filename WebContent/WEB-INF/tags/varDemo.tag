<%@ tag import = "java.util.Date" import = "java.text.DateFormat" %>
<%@ variable name-given = "longDate" %>
<%@ variable name-given = "shortDate" %>
<%
Date now = new Date(System.currentTimeMillis());
DateFormat longFormat = DateFormat.getDateInstance(DateFormat.LONG);
DateFormat shortFormat = DateFormat.getDateInstance(DateFormat.SHORT);
jspContext.setAttribute("longDate", longFormat.format(now));
jspContext.setAttribute("shortDate", shortFormat.format(now));
%>
<jsp:doBody />
<%-- The above was taken from Budi Kurniawan's 
A Tutorial : Servlet & JSP, pg 191  --%>
