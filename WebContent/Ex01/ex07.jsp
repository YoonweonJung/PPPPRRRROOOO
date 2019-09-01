<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07</title>
</head>
<body>
	<%--	
		이 문서(ex07.jsp)는 클라이언트가 서버(ex071.jsp)에게 보내는 요청문서
		부가정보를 보낼예정
	 --%>
	 <h2>ex07.jsp</h2>
	 <a href="ex072.jsp?kind=it&page=100">getParameterNames()이용</a>
	 
	 <hr/>
	 <a href="ex071.jsp?kind=sport&page=10">getParameterMap()이용</a>
	 
</body>
</html>

<%--
*요청 파라미터 관련 메소드(교재 p76)
-요청 파라미터는 사용자가 폼 페이지에 데이터를 입력한 후 
 서버에 전송할 때 전달되는 폼 페이지의 입력된 정보 형태를 말함
-요청 파라미터는 <name=value> 형식으로 웹 브라우저에서 서버의 JSP 페이지로 전송
 --%>





