<%@page errorPage="../error-page/ErrorPage.jsp" %>
<html>
  <head>
    <script type="text/javascript">
      function ShowHints() {
          var xmlHttp = null;

          // Firefox, Mozilla, and Opera
          if (window.XMLHttpRequest) {
              xmlHttp = new XMLHttpRequest();
          }
          // Internet Explorer 5.5 and later
          else if (window.ActiveXObject) {
              xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
          }

          xmlHttp.onreadystatechange = function() {
              if ((xmlHttp.readyState == 4) || (xmlHttp.readyState == "complete")) {
                  var resultsDiv = document.getElementById("resultsDiv");
                  resultsDiv.innerHTML = xmlHttp.responseText;
                  resultsDiv.style.visibility = "visible";
              }
          }

          var searchBy = document.getElementById('searchBy');
          searchBy = searchBy.options[searchBy.selectedIndex].value;

          var userInput = document.getElementById('userInput').value;

          var url = "http://localhost:8080/MyJSPs/Suggest?searchBy=" + searchBy + "&userInput=" + userInput;
          xmlHttp.open("GET", url, true);
          xmlHttp.send(null);
      }
    </script>
  </head>
  <body>
    Search By:
    <select name="searchBy">
        <option value="title">Title</option>
        <option value="author" selected>Author</option>
    </select>
    <input onkeyup="ShowHints()" id="userInput">
    <div id="resultsDiv" style="border-style: solid; border-width: thin; visibility: hidden;"></div>
</html>