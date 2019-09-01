<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex11</title>
</head>
<body>
<% /* pageContext내장객체(교재 p119)
		- javax.servlet.jsp.PageContext가 new시켜놓은 내장 객체
		- 현재 페이지를 관리하는 데 필요한 정보를 얻기 위한 클래스 */
	
		JspWriter jwout =  pageContext.getOut();
		//내장객체 out이 존재하지만 없다라고 가정하고 ... 브라우저에 출력해보자
		jwout.println("out내장객체를 강제로 만들어서 사용한 부분이예요");
%>
</body>
</html>




