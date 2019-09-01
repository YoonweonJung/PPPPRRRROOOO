<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06</title>
</head>
<body>
	<h2>request객체의 다양한 메소드(교재 p88)</h2>
	<p>-웹 브라우저는 HTTP 헤더에 부가적인 정보를 담아 서버로 전송</p>
	<p>http://localhost/uriPro/ex/ex06.jsp</p>
	<%
	 out.println("getServerName()="+request.getServerName()  );
	 out.println("<br/>getServerPort()="+request.getServerPort()  );
	 out.println("<br/>getRequestURI()="+request.getRequestURI()  );
	 out.println("<br/>getQueryString()="+request.getQueryString()  );
	 out.println("<br/>getProtocol()="+request.getProtocol()  );
	 out.println("<br/>getMethod()="+request.getMethod()  );
	 out.println("<br/>getCharacterEncoding() ="+request.getCharacterEncoding()  );
	%>
</body>
</html>

<%-- 출력결과
		getServerName()=localhost
		getServerPort()=80
		getRequestURI=/uriPro/ex/ex06.jsp
		getQueryString()=null
		getProtocol()=HTTP/1.1
		getMethod()=GET
		getCharacterEncoding() =UTF-8
 --%>







