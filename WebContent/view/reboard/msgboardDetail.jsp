<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>

//원글삭제하기 이벤트
$("#dBtn").click(function(){
	//prompt통해 비밀번호입력받기
	var pw = window.prompt("비밀번호를 입력하세요","");
	
	//글삭제요청으로 보낸다
	// <a href="~~~~?파라미터명=data"
	// window.location.href="~~~~?파라미터명=data"		
	// $(location).attr("href","~~~~?파라미터명=data")		==>get방식처럼 주소표시줄에노출
	// 비번, 개인정보, 많은 양의 데이터는 form post 방식으로 넘겨야한다
	/*<form id="imsiFrm" action="../reboard/boardDelete.bo" method="post">
	<input type="hidden" name="oriNo" value=""  id="imsiOriNo" />
	<input type="hidden" name="pw"    value=""  id="imsiPw"/> 
	<input type="hidden" name="nowPage" value="" id="imsiNowPage"/>*/
	
	//임시폼안의 요소에 데이터를 셋팅한다
	//$(선택자).val()						폼안의 선택요소의 값을 가져오기
	//$(선택자).val("데이터")		폼안의 선택요소에 값을 설정하기
	$("#imsiPw").val(pw);
	
	//서브밋
	$("#imsiFrm").submit();
	$("").hide();
});
</script>
</head>
<body>
<a href="../index.jsp">메인</a><br/>
<a href="../msgboard/msgBoardList.ho">쪽지 리스트로 돌아가기</a>
	<h2>(원글)상세보기화면-boardDetail.jsp</h2>
	<%-- request.setAttribute("DETAIL",vo);     //원글상세내용
  			request.setAttribute("nowPage",nowPage);//보고싶은페이지(릴레이용)
  			request.setAttribute("REPLY",list1);   //댓글내용
	 --%>
	<%
		String  mb_no  = request.getParameter("mb_no");  	//해당게시물번호
		String  nowPage = request.getParameter("nowPage"); //보고싶은페이지(릴레이용)
	%>
	DETAIL=${DETAIL}<br/>
  nowPage=${nowPage}<br/>
  
  
  
  
<%-- 	<%--	1.	상세보기 내용 보여주기 --%> --%>
	<c:set var="aaa" value="${DETAIL.m_id}" scope="session"/>
 	<c:if test = "${aaa eq DETAIL.mb_idchk }"> 
	<table width="700" border="1" align="center">
		<tr>
			<td>글번호</td>
			<td>${DETAIL.mb_no}</td>
			<td>확인 여부</td>
			<td>${DETAIL.mb_comf}</td>
		</tr>
		<tr>
			<td>받은이</td>
			<td >${DETAIL.mb_idchk}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${DETAIL.m_id}</td>
			<td>작성일</td>
			<td>${DETAIL.mb_date}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${DETAIL.mb_title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${DETAIL.mb_comm}</td>
		</tr>
		
	</table>
	<table>
		<tr>
			<td align="center">
				<%-- 로그인한 유저만  작성자의 글에대해 수정, 삭제가능 --%>
					<input type="button" id="dBtn" value="원글삭제하기"/>
			</td>
		</tr>
	</table>
  	</c:if> 
  	<div>
  		${DETAIL.m_id} <p>과</p> ${DETAIL.mb_idchk } <p>이 서로 다름</p>
  	</div>
	<%-- 원글삭제를 위한 임시폼 --%>
	<form id="imsiFrm" action="../msgboard/msgboardDelete.ho" method="post">
		<input type="hidden" name="m_num" value="${DETAIL.mb_no}"  id="imsiM_num" />
		<input type="hidden" name="pw"    id="imsiPw"/> 
		<input type="hidden" name="nowPage" value="${nowPage}" id="imsiNowPage"/>
	</form>
	
</body>
</html>







