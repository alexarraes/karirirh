<%@page import="java.util.Date" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>  

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<f:formatDate value="<%=new Date() %>" type="date" />dd/mm/aaaa  
<f:formatDate value="<%= new Date()%>" type="time" />  
  
<f:formatDate value="<%= new Date()%>" type="both" /> data e hora 
</body>
</html>