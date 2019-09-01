<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%-- 이 문서(ex05.jsp)는 회원가입페이지의 일부분이다
		    user가 form에 기입한 여러타입의 data를 서버(ex051.jsp)로 보낼 예정이다
		    <form name="폼이름" id="폼id명" method="GET|POST" action="처리할서버페이지">
		      GET  방식 : USER가 입력한 정보가  브라우저의 주소표시줄에 노출
		      POST 방식 : USER가 입력한 정보가  브라우저의 주소표시줄에 노출X
		      					 비밀번호와 같이 개인정보는  노출되지 않도록 주의
		      					 
		   request 내장 객체
		   -javax.servlet.http.HttpServletRequest가 new된 객체가 담긴 참조변수   					 
		      					 
	 --%>
	 <form name="frm" id="frm" method="POST" action="ex051.jsp">
	 	<table border="1" width="600">
	 		<tr>
	 			<th>아이디</th>
	 			<td>
	 				<input type="text" name="id" id="id"/> 
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>비밀번호</th>
	 			<td>
	 				<input type="password" name="pw" id="pw"/> 
	 			</td>
	 		</tr>
	 		<tr>
	 			<th>취미</th>
	 			<td>
	 				<!-- 동일한 name에   서로 다른 value가 1개이상 담겨서 서버에 전송가능 
	 						 checkbox는 중복체크 허용 => value가 1개이상 담겨서 서버에 전송
	 						 파라미터명=data
	 						   hobby=운동
	 						   hobby=운동&hobby=영화
	 				-->
	 				<input type="checkbox" name="hobby" id="h1" value="운동" /><label for="h1">운동</label>
	 				<input type="checkbox" name="hobby" id="h2" value="영화" /><label for="h2">영화</label>
	 				<input type="checkbox" name="hobby" id="h3" value="게임" /><label for="h3">게임</label>
	 				<input type="checkbox" name="hobby" id="h4" value="독서" /><label for="h4">독서</label>
	 				<input type="checkbox" name="hobby" id="h5" value="바둑" /><label for="h5">바둑</label>
	 			</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<input type="submit" value="회원가입"/>
	 				<%--
	 					데이터를 서버에 보내는 방식 3가지.
	 					1. HTML의 TAG이용	<input type="submit">
	 						 무결성검사를 하기위해서는 javascript나 jQuery를 이용하여
	 						 유효한 데이터인지 필수입력등 무결성통과한 데이터만 서버로 보낸다
	 					2. JAVASCRIPT이용
	 					3. jQuery이용 
	 				 --%>
	 			</td>
	 		</tr>
	 	</table>
	 </form>
</body>
</html>











