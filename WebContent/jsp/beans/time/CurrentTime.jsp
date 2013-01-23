<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id = "time" class= "beans.CurrentTimeBean" />
<html>
    <body>
        It is now:
        <jsp:getProperty name = "time" property = "hours"/>:<jsp:getProperty name = "time" property = "minutes"/>.
    </body>
</html>
