<%@ attribute name="productDetails" fragment="true"%>
<%@ variable name-given="productName"%>
<%@ variable name-given="description"%>
<%@ variable name-given="price"%>
<%
   jspContext.setAttribute("productName", "Pelesonic DVD Player");
   jspContext.setAttribute("description",
         "Dolby Digital output through coaxial digital-audio jack,"
         + " 500 lines horizontal resolution-image digest viewing");
   jspContext.setAttribute("price", "65");
%>
<jsp:invoke fragment="productDetails" />
<%-- The above was taken from Budi Kurniawan's 
A Tutorial : Servlet & JSP, pg 196  --%>
