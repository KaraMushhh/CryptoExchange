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
double eth=Double.valueOf(request.getParameter("ethVal"));
ContoDAO.addEthereum(mail, eur, eth);
response.sendRedirect("conto.jsp");
%>

</body>
</html>