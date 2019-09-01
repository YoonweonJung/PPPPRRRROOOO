<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex051</title>
</head>
<body>
	<%--
		이 문서는 회원가입폼에서 입력한 회원의 정보를
		받아서 처리하는 서버쪽 문서(ex051.jsp)이다
		
		*request 내장 객체
		   -javax.servlet.http.HttpServletRequest가 new된 객체가 담긴 참조변수
		*요청 파라미터 관련 메소드(교재 p76)
			-요청 파라미터는 사용자가 폼 페이지에 데이터를 입력한 후 
			  서버에 전송할 때 전달되는 폼 페이지의 입력된 정보 형태를 말함
			-요청 파라미터는 <name=value> 형식으로 웹 브라우저에서 서버의 JSP 페이지로 전송
		   
		   
	 --%>
	 <%
	 	String id= request.getParameter("id");
	  String pw= request.getParameter("pw");
	  
   //동일한 파라미터명에   서로 다른 value가 여러개 넘어올때는
   //배열로 받아야한다
	 //String[] 변수 = request.getParameterValues("파라미터명");
	  String[] hobby= request.getParameterValues("hobby");
	  
	  int len = hobby.length;//선택한 취미의 개수를 알아보자
	  System.out.println("선택한 취미의 개수="+len);//콘솔출력
	 %>
	 <ul>
	 	<li>아이디 :<%= id %></li>
	 	<li>비번 :<%= pw %></li>
	 	<li>취미 :
	 	<% //표현식이용하여 브라우저에 출력
	 	for(int i=0; i<len ;i++){ %>
 			<%= hobby[i] %><br/>
    <%
    }
	 	%>
	 	
	 	<%
	 	/* out내장객체를 이용하여 브라우저에 출력
	 		for(int i=0; i<len ;i++){
	 			out.println(hobby[i]+"<br/>");
	     }
	 	*/
	 	%>
	 	</li>
	 	<li></li>
	 </ul> 
</body>
</html>










