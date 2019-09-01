<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex13.jsp</title>
</head>
<body>
<%--  
	config 내장객체(ppt 05장 내장객체의 슬라이드12)
	• javax.servlet.http.ServletConfig가 new됨
	• 애플리케이션에서 공유할수 있는 초기화 변수 접근
	• web.xml 에 초기화 패러미터가 설정되어야 함.=> web.xml문서 설정하자
	• 애플리케이션의 ServetContext객체를 가져옴.


--%>
	<h1>ex13.jsp</h1>
	<p> url부분 http://localhost/uriPro/ex/ex13.jsp</p>
	<%
		//web.xml문서에서 설정한 myPhone 파라미터의 값을 가져옴
		String phone=config.getInitParameter("myPhone"); //1234
	%>
	*기본파라미터의 값 = <%= phone %>
</body>
</html>











