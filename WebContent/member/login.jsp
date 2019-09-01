<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%-- 		
				로그인여부에 따라 
				if(){
					로그인하지않았으면 로그인폼을 보여주고
				}
				else{
					로그인하였으면      로그인정보를 보여주자
				}
				
	--%>
	<p><a href="../index.jsp">메인</a></p>
	<%
		/*세션에 정보저장할 때
		session.setAttribute("UID",  "hongid");
		session.setAttribute("UNICK","의적");  */
		
		//세션에서 데이터를 꺼내보자 
   	    String id	  =(String)session.getAttribute("UID");
	   	String pw	=(String)session.getAttribute("UPW");
	   	String nick	=(String)session.getAttribute("UNICK");
	   	
	   	
		
		if( id==null || id.length()==0 ){  //데이터가 null이면 로그인x 
	%>
		<h1>login.jsp</h1>
		
		<%-- 로그인하지않았을경우 보여주는  로그인폼 --%>
		<form name="gaipFrm" id="gaipFrm" method="POST" action="../member/loginProc.jsp">
			<table border="1" width="400">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="id" id="id" />
						</td>
					</tr>
					<tr>
						<th>비 번</th>
						<td>
							<input type="password" name="pw" id="pw" />
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" id="submitBtn0" value="로그인" />
							<!-- <input type="button" id="submitBtn" value="로그인" /> -->
							<input type="reset"  id="resetBtn"  value="취소" />
						</td>
					</tr>
				</tbody>
			</table>			 
		</form>
	<%
		}else{
	%>
	<%-- 	<%-- 로그인했을경우          보여주는  회원정보 --%>
		<table border="1" width="400">
			<tbody>
				<tr>
					<td>
						 <%= nick %>님 접속중.   
					</td>
				</tr>
				<tr>	
					<td>
						<a href="../member/logout.jsp">로그아웃</a>
					</td>
				</tr>
			</tbody>
		</table> 
	<%
		}
	%>	
</body>
</html>









