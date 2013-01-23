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
              out.print("<PRE>");
              exception.printStackTrace(new PrintWriter(out));
              out.print("</PRE>");
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
                out.print("<PRE>");
                cause.printStackTrace(new PrintWriter(out));
                out.print("</PRE>");
              }
            }
          %>
        </td>
      </tr>
    </table>

    <hr>
    Header List
    <table border=3>
      <tr>
        <td>Name</td>
        <td>Value</td>
      </tr>
      <%
        String name = "";
        String value = "";

        java.util.Enumeration headers = request.getHeaderNames();
        while (headers.hasMoreElements()) {
          name = (String) headers.nextElement();
          value = request.getHeader(name);
      %>
      <tr>
        <td><%=name%></td>
        <td><%=value%></td>
      </tr>
      <%
        }
      %>
    </table>

    Attribute List
    <!-- "javax.servlet.jsp.jspException" for getting an Exception -->
    <table border=3>
      <%
        java.util.Enumeration attributes = request.getAttributeNames();
        while (attributes.hasMoreElements()) {
          name = (String) attributes.nextElement();

          if (request.getAttribute(name) == null) {
            value = "null";
          } else {
            value = request.getAttribute(name).toString();
          }
      %>
      <tr>
        <td><%=name%></td>
        <td><%=value%></td>
      </tr>
      <%
        }
      %>
    </table>

  </body>
</html>
