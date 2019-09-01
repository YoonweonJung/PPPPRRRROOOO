<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10_3</title>
</head>
<body>
	<h1>ex10_3.jsp</h1>
	<%
		String id = request.getParameter("id");
	  out.println("<p>귀하의 (전달받은)id는 "+id+"</p>");
	%>
	
</body>
</html>



