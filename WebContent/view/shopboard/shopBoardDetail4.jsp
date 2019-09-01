<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
	<h2>(원글)상세보기화면-boardDetail.jsp</h2>
	<%-- request.setAttribute("DETAIL",vo);     //원글상세내용
  			request.setAttribute("nowPage",nowPage);//보고싶은페이지(릴레이용)
  			request.setAttribute("REPLY",list1);   //댓글내용
	 --%>
	<%
		String  oriNo  = request.getParameter("oriNo");  	//해당게시물번호
		String  nowPage= request.getParameter("nowPage"); //보고싶은페이지(릴레이용)
	%>
	DETAIL=${DETAIL}<br/>
    nowPage=${nowPage}<br/>
  
	<%--	1.	상세보기 내용 보여주기 --%>
	<table width="700" border="1" align="center">
		<tr>
			<td>글번호</td>
			<td>${DETAIL.b_id}</td>
			<td>조회수</td>
			<td>${DETAIL.u_id}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${DETAIL.b_name}</td>
			<td>작성일</td>
			<td>${DETAIL.b_create}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${DETAIL.b_name}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${DETAIL.b_name}</td>
		</tr>
	</table>
	
</body>
</html>







