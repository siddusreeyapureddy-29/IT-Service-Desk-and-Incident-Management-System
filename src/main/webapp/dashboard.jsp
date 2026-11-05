<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<%
		User u=(User) session.getAttribute("user");
		if(u!=null)
		{
		%>
		<h2>Welcome  <%=u.getName() %></h2>
		<p>Role:<%=u.getRole() %></p>
		<%
		}%>
		
	</body>
</html>