<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex072</title>
</head>
<body>
	<%--	
		이 문서(ex072.jsp)는 클라이언트가 보낸 부가정보를 받아 화면에 출력 
	 --%>
	 <h2>ex072.jsp</h2>
	 <% //키값이 모를때
	 	Enumeration<String>  en = request.getParameterNames();
	 
	    //키의 개수가 몇개인지 모르므로 반복해서 처리
	  while( en.hasMoreElements() ){
	 	  //먼저 키값을 알아내야한다
			String key = en.nextElement();		  
		  
	 		//알아낸 키값을 이용하여 데이터를 꺼낸다
	 		String data =request.getParameter(key);
	 		out.println("<p>"+key + "의 data는 " + data + "</p>");
	  }
	 %>
</body>
</html>







