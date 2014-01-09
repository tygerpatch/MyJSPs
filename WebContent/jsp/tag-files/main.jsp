<%@ taglib prefix = "tags" tagdir = "/WEB-INF/tags" %>
Your referer header: ${header.referer}
<br />
<tags:doBodyDemo>
${header.referer}
</tags:doBodyDemo>
<a href = "viewReferer.jsp">View</a> the referer as a Session attribute.
<%-- The above was taken from Budi Kurniawan's 
A Tutorial : Servlet & JSP, pg 194  --%>
