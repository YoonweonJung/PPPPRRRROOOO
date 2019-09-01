<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10_22</title>
</head>
<body>
	<h1>ex10_22.jsp</h1>
	<%
		String nowPage = request.getParameter("nowPage");
	  out.println("<p>귀하의 nowPage는 "+nowPage+"</p>");
	
		//응답페이지를 ex10_33.jsp로 변경하자
	%>
	<jsp:forward page="ex10_33.jsp" />	
	
</body>
</html>



