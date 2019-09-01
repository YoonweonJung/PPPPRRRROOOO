<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기폼</title>
<script>
	//글등록클릭시 호출
	function WriteProc(){
		//무결성검사
		//예정~~~
		
		//폼객체.submit();
		document.getElementById("wfrm").submit();
	}
</script>
</head>
<body>
 <a href="http://localhost/uni/index.jsp">HOME(대문index.jsp)</a><hr/>
 <h2>원글 쓰기</h2>
 <p>writeFrm.jsp</p>
 	<form method="GET" id="wfrm" action="../reboard/writeProc.bo">
		<table width="800" border="1" align="center">
			<tr>
				<td>글제목</td>
				<td><input type="text" name="title" id="title"/></td>
			</tr>
			<tr>
				<td>글내용</td>
				<td><textarea name="body" id="body"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"/>
					<input type="button" id="wbtn" value="글등록" onClick="WriteProc()"/>
					<%--	필요하면 다른 단추도 만들어서 사용 --%>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
















