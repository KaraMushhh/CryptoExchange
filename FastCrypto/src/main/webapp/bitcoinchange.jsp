<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="it.betacom.dao.ContoDAO, java.util.*"%>
<%
String mail=(String)session.getAttribute("username");
double eur=Double.valueOf(request.getParameter("euro"));
double bit=Double.valueOf(request.getParameter("bitVal"));
ContoDAO.addBitcoin(mail, eur, bit);
response.sendRedirect("conto.jsp");
%>

</body>
</html>