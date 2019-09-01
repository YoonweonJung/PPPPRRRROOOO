<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 이 문서를 실행하는 도중에 예외발생하면 이 문서대신에 보여줄 다른 페이지를 지정할 수 있다 --%>
<%@ page errorPage="err.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>
		<h1>ex02.jsp</h1>
		<p>클라이언트가 서버에게 요청하는 페이지 </p>
		<%-- 0~100사이의 랜덤 숫자를 100으로 나눈 결과를 보여주는 페이지를 작성하자 --%>
		<%	//스크립트릿 - 자바적인 부분을 작성하는곳
			int num = (int)Math.random()*101;
			int result = 100/1;
		%>
		
			결과 : <%= result %>
			
</body>
</html>