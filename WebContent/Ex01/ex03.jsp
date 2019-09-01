<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03문서</title>
</head>
<body>
 <%--	jsp주석문
 	이 문서는 실제로 유저가 서버에게 요청하는 문서
 	실제내용도 포함하지만, 
 	여기에서는 위(header.jsp),왼쪽(left.jsp), 아래쪽(footer.jsp)에 
 					 공통적으로 사용되는 문서를 포함할 예정
 		<%@ include file="jsp,html,txt문서" %>
 		
 *includ지시어 - 교재 p168
 - 현재 JSP 페이지의 특정 영역에 외부 파일의 내용을 포함하는 태그
 - 현재 JSP 페이지에 포함할 수 있는 외부 파일(HTML, JSP, 텍스트 파일)
 - include 디렉티브 태그는 JSP 페이지 어디에서든 선언 가능
       형식 <%@ include  file="jsp,html,txt문서" %>			 
--%>
  <table border="1" width="600" align="center">
  	<tr height="50">
  		<td colspan="2">
  			<%--  위(header.jsp)들어갈예정--%>
  			<%@ include file="header.jsp" %>
  		</td>
  	</tr>
  	<tr height="100">
  		<td width="200">
  			<%--왼쪽(left.jsp)들어갈예정  --%>
  			<%@ include file="left.jsp" %>
  		</td>
  		<td>
  			<h2>주 내용이 출력되는 영역</h2>
  		</td>
  	</tr>
  	<tr height="50">
  		<td colspan="2">
  			<%-- 아래쪽(footer.jsp)들어갈예정   --%>
  			<%@ include file="footer.jsp" %>
  		</td>
  	</tr>
  </table>
</body>
</html>







