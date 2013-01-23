<html>
  <body>
    <%
      String strTxt;

      if (null != (strTxt = request.getParameter("txtInput"))) {
    %>
    <p>
      You entered "<%= strTxt %>"
    </p>

    <% } else { %>

      <form method="get" action="Parrot.jsp">
        <table>
          <tr>
            <td>Enter Text</td>
            <td><input type="text" name="txtInput" /></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" value="Repeat Back" /></td>
          </tr>
        </table>
      </form>
    <% } %>
  </body>
</html>
