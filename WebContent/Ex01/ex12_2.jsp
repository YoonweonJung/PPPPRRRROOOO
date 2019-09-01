<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex12_2</title>
</head>
<body>
<% /*application 내장객체(교재 p121)
		• javax.servlet.http.ServletContext
		• 웹 애플리케이션(컨텍스트) 에 관련된 정보를 제공
		• 개발자를 위한 서버 정보
		• 서버의 각종 자원 정보 */
%>
	<h2>초기화 파라미터 읽어오기</h2>
	<p>application 내장객체(교재 p121)</p>
<%
 //파라미터이름을 알아내고
	Enumeration<String> en= application.getInitParameterNames();

 //파라미터의 개수가 몇 개인 지 모르므로
  while( en.hasMoreElements() ){
	   //파라미터명을 가져오자
	   String initParamName = en.nextElement();
	   
	   //파라미터값을 가져오자
	   String paramValue= application.getInitParameter(initParamName);
%>
	<p>*파라미터이름 : <%= initParamName %></p>
	<p>*파라미터값    : <%= paramValue %> </p>
<%
  }
 
 //로그메세지 남기기(교재 p125)
 application.log("로그메세지기록 ex12_2");
%>

</body>
</html>






