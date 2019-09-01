<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex09</title>
</head>
<body>
<% /*response 내장 객체(교재 p90)
		-사용자의 요청을 처리한 결과를 서버에서 웹 브라우저로 전달하는 정보를 저장하고 
		서버는 응답 헤더와 요청 처리 결과 데이터를 웹 브라우저로 보냄.
		- JSP 컨테이너는 서버에서 웹 브라우저로 응답하는 정보를 처리하기 위해 
		 javax.servlet.http.HttpServletResponse 객체 타입의 
		 response 내장 객체를 사용하여 사용자의 요청에 응답
		*/
		
		//5초 주기로 새로고침하기
		//response.setIntHeader("Refresh", 5);
		//out.println("<h3>"+new java.util.Date()+"</h3>");
		
		//클라이언트가 요청한 페이지(ex09.jsp)에 머물다가 다른 곳으로 이동시키는 방법
		out.println("<h3>12초후에 naver로 이동합니다</h3>");
		response.setHeader("Refresh", "12;URL=http://www.naver.com");
		
%>
</body>
</html>



