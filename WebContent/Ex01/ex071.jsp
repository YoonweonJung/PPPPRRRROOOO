<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex071</title>
</head>
<body>
	<%--	
		이 문서(ex071.jsp)는 클라이언트가 보낸 부가정보를 받아 화면에 출력 
	 --%>
	 <h2>ex071.jsp</h2>
	 <%	//파라미터받자
	 Map<String, String[]> map = request.getParameterMap();
	 // map.put("kind", "sport" );
	 // map.put("page", "10" ); 이렇게 된 효과가 있다
	 
	 String[] kind = map.get("kind");
	 String[] nowPage = map.get("page");
	 %>
	 선택한 기사의 종류 : <%= kind[0] %><br/>
	 현재 page : <%= nowPage[0] %>
</body>
</html>

<%--
*요청 파라미터 관련 메소드(교재 p76)
-요청 파라미터는 사용자가 폼 페이지에 데이터를 입력한 후 
 서버에 전송할 때 전달되는 폼 페이지의 입력된 정보 형태를 말함
-요청 파라미터는 <name=value> 형식으로 웹 브라우저에서 서버의 JSP 페이지로 전송
 --%>





