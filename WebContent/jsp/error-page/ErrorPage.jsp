<%@ page isErrorPage="true"%>
<%@ page import="java.io.PrintWriter"%>
<html>
  <head>
    <title>Error Page</title>
  </head>
  <%--
    I copied this JSP Error Page a long time ago, but forgot to cite the source.
    A Google search says it comes from an open source web application named BigBlueButton,
    but I have my doubts on whether I originally copied it came from there.

    https://github.com/bigbluebutton/bigbluebutton/blob/master/bbb-api-demo/src/main/webapp/error.jsp
  --%>
  <body bgcolor="#FFFFFF">
    <%
      Object statusCode = request.getAttribute("javax.servlet.error.status_code");
      Object exceptionType = request.getAttribute("javax.servlet.error.exception_type");
      Object message = request.getAttribute("javax.servlet.error.message");
    %>
    <p>
      <a href="<%=response.encodeURL(request.getContextPath())%>">Home</a>
    </p>
    <hr>
    <h2>An Error has occured:</h2>
    <table cellpadding="2" CELLSPACING="2" BORDER="1" WIDTH="100%">
      <tr>
        <td width = "20%"><b>Status Code</b></td>
        <td width = "80%"><%= statusCode %></td>
      </tr>
      <tr>
        <td width = "20%"><b>Exception Type</b></td>
        <td width = "80%"><%= exceptionType %></td>
      </tr>
      <tr>
        <td width = "20%"><b>Message</b></td>
        <td width = "80%"><%= message %></td>
      </tr>
      <tr>
        <td width = "20%"><b>Exception</b></td>
        <td width = "80%">
          <%
            if (exception != null) {
              out.print("<pre]>");
              exception.printStackTrace(new PrintWriter(out));
              out.print("</pre>");
            }
          %>
        </td>
      </tr>
      <tr>
        <td width = "20%"><b>Root Cause</b></td>
        <td>
          <%
            if ((exception != null) && (exception instanceof ServletException)) {
              Throwable cause = ((ServletException) exception).getRootCause();
              if (cause != null) {
                out.print("<pre>");
                cause.printStackTrace(new PrintWriter(out));
                out.print("</pre>");
              }
            }
          %>
        </td>
      </tr>
    </table>
    <%@include file = "/WEB-INF/jspf/attribute-list.jspf" %>
  </body>
</html>
