<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10_2</title>
</head>
<body>
	<h1>ex10_2.jsp</h1>
	<%
		String id = request.getParameter("id");
	  out.println("<p>귀하의 id는 "+id+"</p>");
	
		//응답페이지를 ex10_3.jsp로 변경하자
		//response.sendRedirect("ex10_3.jsp");//값이 전달되지 않는다
		
		//값이 전달되지 않으므로 필요하면 파라미터값을 릴레이시켜야 한다
		response.sendRedirect("ex10_3.jsp?id="+id);
	%>
	
	
</body>
</html>



