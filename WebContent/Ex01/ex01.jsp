<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01</title>
</head>
<body>
	<h1>ex.jsp문서</h1>
	<!-- HTML과 XML 주석문 -->
	<%-- JSP 주석문 --%>
	<%
		// 스크립트릿 - 자바코트를 기입하는 부분 
		String name = "홍길동";
		int age = 29;
		//<%=은 표현식
	%>

	귀하의 이름은
	<%=name%>
	<br /> 나이는
	<%=age%>
	<br />
	<hr />
	<%
		String ename = "이순신";
	%>

	너의 이름 :
	<%=ename%>
	<br/>

	<%
		//스크립트릿  
		Date d = new Date();
		String date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(d);
	%>

	오늘 :
	<%=date%>

	<%!//선언부
	//전역변수 또는 함수를 선언해도 된다
	private String sname = "김구";

	public String getSname() {
		return sname;
	}

	public void setSname(String name) {
		this.sname = name;
	}%>


</body>
</html>