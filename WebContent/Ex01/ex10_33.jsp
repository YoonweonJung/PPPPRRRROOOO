<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10_33</title>
</head>
<body>
	<h1>ex10_33.jsp</h1>
	<%
	//클라이언트의 요청을 유지한 상태에서      다른 문서로 이동
		String nowPage = request.getParameter("nowPage");
	  out.println("<p>nowPage: "+nowPage+"</p>");
	%>
	
</body>
</html>



