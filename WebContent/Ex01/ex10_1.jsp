<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex10_1</title>
</head>
<body>
	<h1>main화면(ex10_1.jsp)</h1>
	
	<%-- ex10_1  -> ex10_22를 요청하지만 -> ex10_33.jsp로 강제 이동될 예정     --%>
	*forward방식 : <a href="ex10_22.jsp?nowPage=100">ex10_22보여줘</a>
	<hr/>
	
	<%-- ex10_1  -> ex10_2를 요청하지만 -> ex10_3.jsp로 강제 이동될 예정     --%>
	*sendRedirect방식 : <a href="ex10_2.jsp?id=hongid">ex10_2보여줘</a>
	
</body>
</html>
<%--
1. Redirect(교재 p93)
	=> 클라이언트의 요청을  완전히 삭제한 후    다른 문서로 이동하는 방법
	1) 현재 클라이언트의 모든 정보가 잊혀진다
2. Forward(교재 p177, p186)
	=> 클라이언트의 요청을 유지한 상태에서      다른 문서로 이동하는 방법
	1) 현재 클라이언트의 모든 정보가 그대로 유지한다

	형식1> pageContext.forward("이동할문서");
	형식2> <jsp:forward page="이동할문서"> =>jsp문서에서 사용
	형식3> RequestDispacher rd = request.getRequestDispacher("이동할문서");
	     rd.forward(request, response);
		 =>Servlet에서 주로 사용

 --%>







