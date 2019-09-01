<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04</title>
</head>
<body>
  <%-- 이 문서는 클라이언트쪽 문서
  		 서버(ex041.jsp)에게 클라이언트의 정보를 <a>를 이용해서 보낼줄 예정
   --%>
	<%
		String sname = "김구";
	  int    grade = 4;
	  
	  //out내장객체(교재 p114)이용 브라우저 화면에 출력
	  out.println("<h2>"+sname+"</h2>");
	  out.println("<p>" +grade+"</p>");
	%>
	<%-- 브라우저 화면에 출력 --%>	
	<%-- 표현식을 이용      화면에 출력 --%>
	<%= sname %><br/>
	<%= grade %>
	<hr/>
	
	<%--     요청주소?파라미터명=값&파라미터명=<%=변수명 %>&파라미터명=값   --%>
	<a href="ex041.jsp?name=홍길동&stName=<%= sname %>&grade=<%=grade%>">보내요</a>
	
	
</body>
</html>

<%--
*out내장객체(교재 p114)
-웹 브라우저에 데이터를 전송하는 출력 스트림 객체
-JSP 컨테이너는 JSP 페이지에 사용되는 
 모든 표현문 태그와 HTML, 일반 텍스트 등을 
 out 내장 객체를 통해 웹 브라우저에 그대로 전달
-스크립틀릿 태그에 사용하여 단순히 값을 출력하는 표현문 태그(<%= …%>)와 같은 결과를 얻을 수 있음

 --%>








