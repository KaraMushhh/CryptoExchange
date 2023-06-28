<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<link rel="icon" type="image/x-icon" href="img/bitcoin.ico">
</head>
<body>

<%
session.invalidate();
response.sendRedirect("login.jsp");
%>

</body>
</html>