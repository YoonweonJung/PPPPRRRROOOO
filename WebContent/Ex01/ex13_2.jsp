<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex13_2.jsp</title>
</head>
<body>
	<h1>ex13_2.jsp</h1>
	<p> url부분 http://localhost/uriPro/ex/ex13_2.jsp</p>
	<%
		String phone=config.getInitParameter("myPhone"); //null
	%>
	*기본파라미터의 값 = <%= phone %>
</body>
</html>











