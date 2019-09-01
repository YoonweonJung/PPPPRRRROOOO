<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex08</title>
</head>
<body>
	<% //헤더정보  보기
		 //서비스를 개발하다보면 유저의 정보를 필요로 할 때 사용
		 // 예) 사용자의 브라우저 종류 파악 등등..
		Enumeration<String> en = request.getHeaderNames();
		
		while( en.hasMoreElements() ){
			String name = en.nextElement();
			String data = request.getHeader(name);
			out.print(name + " : "+ data + "<br/>");
		}
	 %>

</body>
</html>




