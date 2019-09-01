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

	$(document).ready(function(){
		
		//댓글좋아요   kind=좋아요(1)
		$(".rgBtn").click(function(){
			//이벤트가 발생한 좋아요 버튼의 param속성값을 알아내야 한다-> 추천할 댓글번호이므로
			var reNo = $(this).attr("param");
			$(location).attr("href",
					"../reboard/replyRecommend.bo?reNo="+reNo+"&kind=1&oriNo=${DETAIL.no}&nowPage=${nowPage}");
		});
		
		//댓글나빠요  kind=나빠요(0) 
		$(".rbBtn").click(function(){
			var reNo = $(this).attr("param");
			$(location).attr("href",
					"../reboard/replyRecommend.bo?reNo="+reNo+"&kind=0&oriNo=${DETAIL.no}&nowPage=${nowPage}");
	
		});
		
		
		//	댓글 삭제단추 이벤트
		$(".rdBtn").click(function(){		  
			 //비번입력받기
			 var pw = prompt("댓글삭제를 위한 비번을 입력하세요","");
			 
			 //임시폼의 value셋팅
			 $("#tempOriNo").val("${DETAIL.no}");
			 
			 //클릭한 댓글삭제버튼요소에 있는 param데이터가 삭제하고싶은 댓글번호
			 var reNo=$(this).attr("param");	 
			 $("#tempReNo").val(reNo);
			 $("#tempPw").val(pw);
			 $("#tempNowPage").val("${nowPage}");
			 
			 //서브밋
			 $("#tempFrm").submit(); 
			
		});
		//	댓글 수정 요청하기
		$(".modifyB").click(function(){
			/*<form method="POST" action="../reboard/replyModify.bo" 
			      style="display:none;"  id="frm${temp.no}">*/
			var frm = $(this).parents("form");      
			//해당 댓글폼.submit();
			frm.submit();      
		});
		
		
		//	댓글 수정하기
		//  댓글마다  댓글수정하기 버튼이 있으므로 선택자는 class
		$(".rmBtn").click(function(){
			//클릭한 댓글수정하기 버튼이 무엇인지부터 알아내야한다
			var button = $(this);
			
			//버튼이 속한 폼, 테이블을 알아내자...=> DOM(Document Object Model)
			//parents("찾고싶은조상요소")  조상요소를 찾아라
			var table = button.parents("table");
			
			// 선택자.attr("속성명")  선택자의 특정속성명의 값을 가져오기
			var id = table.attr("id");    //<table id="4">   <table id="3">   
			
			// 테이블감추기
			$("#"+id).hide();
			
			//숨겨진 댓글수정폼을 보이기
			//style="display:none;"  id="frm${temp.no}">
			
			$("#frm"+id).show();
			
			
		});		
		
		
		//	원글수정하기 이벤트
		$("#mBtn").click(function(){
			$(location).attr("href", "../reboard/modifyFrm.bo?oriNo=${DETAIL.no}&nowPage=${nowPage}");
		});
		
		//	원글삭제하기 이벤트
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
			
		});
		
		//	목록보기 이벤트
		$("#lBtn").click(function(){
			//$(객체).attr("속성명")  		 => 해당객체의 속성값을 가져오기
			//$(객체).attr("속성명", 값)  => 해당객체의 속성값을 설정하기
			//자바스크립트에서의   location.href="../reboard/boardList.bo?nowPage=${nowPage}"
			$(location).attr("href", "../reboard/boardList.bo?nowPage=${nowPage}");
		});
		
		//	댓글쓰기
		$("#wBtn").click(function(){
			//무결성검사하시고...
			//입력요소에 유저가 입력한 내용가져올때
			//jQuery에서의   $(선택자).val()는
			//자바스크립트의   document.getElementById("title").value;와 동일
			var title=$("#title").val();
			if( title=="" ){
				alert("제목을 입력하세요");
				$("#title").focus();
				return;  //함수의 종료
			}
			
			//전송
			$("#frm").submit();
		});

	});
</script>
</head>
<body>
<a href="../index.jsp">메인</a>
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
  REPLY=${REPLY}
  
	<%--	1.	상세보기 내용 보여주기 --%>
	<table width="700" border="1" align="center">
		<tr>
			<td>글번호</td>
			<td>${DETAIL.no}</td>
			<td>조회수</td>
			<td>${DETAIL.hit}</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${DETAIL.writer}</td>
			<td>작성일</td>
			<td>${DETAIL.wday}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${DETAIL.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${DETAIL.brBody}</td>
		</tr>
	</table>
	<%--	2.	기타 부가 기능 만들기(목록보기, 삭제하기, 수정하기...) --%>
	<table width="700" border="1" align="center">
		<tr>
			<td align="center">
				<input type="button" id="lBtn" value="목록보기"/>
				<%-- 로그인한 유저만  작성자의 글에대해 수정, 삭제가능 --%>
				<c:if test="${sessionScope.UID  eq DETAIL.writer}">	
					<input type="button" id="mBtn" value="원글수정하기"/>
					<input type="button" id="dBtn" value="원글삭제하기"/>
				</c:if>	
			</td>
		</tr>
	</table>	
	<%--	3.	댓글 보여주기 --%>
	<c:if test="${empty REPLY}">  
		<table width="700" border="1" align="center">
			<tr>
				<td align="center"><font color="red">아직 댓글이 달리지 않았어요 당신이 첫번째 주인이 되세요</font></td>
			</tr>
		</table>
	</c:if> 	
	<%--	댓글이 존재하면 댓글을 반복해서 보여주는 부분 --%>
	<c:if test="${not empty REPLY}">
		<c:forEach var="temp" items="${REPLY}"> <%-- 반복문 한번 돌때마다 temp변수안에 vo가 담긴다--%>
			<%-- 동적인 웹을 구현하기위해서는 제어해야할 필요가 있다
					 특정부분에 접근하기위해서는 id가 필요하고, id는 unique해야 한다
			 --%> 
			<table width="700" border="1" align="center" id="${temp.no}">
				<tr>
					<td>댓글번호</td>
					<td>${temp.no}</td>
					<td>원글번호</td>
					<td>${temp.oriNo}</td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td>${temp.writer}</td>
					<td>작성일</td>
					<td>${temp.wday}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td colspan="3">${temp.title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">${temp.brBody}</td>
				</tr>
				<tr>
					<td colspan="4" align="center">
						<%-- 댓글수만큼 버튼이 생성되므로 동일한이름을 허용하는 class속성을 부여 --%>
						<input type="button" class="rmBtn" value="댓글수정하기">
						<input type="button" class="rdBtn" value="댓글삭제하기" param="${temp.no}"/>
						<input type="button" class="rgBtn" value="좋아요(${temp.good})"   param="${temp.no}"/>
						<input type="button" class="rbBtn" value="나빠요(${temp.bad})"  param="${temp.no}"/>
					</td>
				</tr>
			</table>

 <%-- 댓글 수정 폼 --%>
   	<%-- 댓글마다 수정폼이 생기면서  id값을 unique하게 하기위해  댓글번호를 이용하였다  --%>	 
			<form method="POST" action="../reboard/replyModify.bo" 
			      style="display:none;"  id="frm${temp.no}">
			 <%-- reNo=댓글번호
			  		oriNo=게시물글번호
	          nowPage=보고싶은페이지(릴레이용) --%>
	      <input type="hidden" name="reNo" 		value="${temp.no}" />
	      <input type="hidden" name="oriNo" 	value="${temp.oriNo}" />
	      <input type="hidden" name="nowPage" value="${nowPage}" />    
				<table width="700" border="1" align="center">
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title${temp.no}" value="${temp.title}"/></td>
					</tr>
					<tr>
						<td>본문</td>
						<td><textarea name="body" id="body${temp.no}">${temp.body}</textarea></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" id="pw${temp.no}"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수정하기" class="modifyB">
						</td>
					</tr>
				</table>
			</form>
		</c:forEach> 	
 </c:if>
	<%--	4.	댓글 쓰기 폼 보여주기 --%>
	<%-- 비밀번호와 같은 개인정보는 노출되지않도록 주의한다 --%>
	<form method="POST" id="frm" action="../reboard/replyWrite.bo">
		<!-- oriNo=댓글에 대한 원글번호
	 			 nowPage=보고싶은페이지(nowPage)	 릴레이용 -->
	 	<input type="hidden" name="oriNo"   value="${DETAIL.no}" />
	 	<input type="hidden" name="nowPage" value="${nowPage}" />		
		<table width="700" border="1" align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<td>댓글</td>
				<td><textarea id="body" name="body"></textarea></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="pw" name="pw"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="button" id="wBtn" value="댓글등록">
				</td>
			</tr>
		</table>
	</form>
	
	<%-- 원글삭제를 위한 임시폼 --%>
	<form id="imsiFrm" action="../reboard/boardDelete.bo" method="post">
		<input type="hidden" name="oriNo" value="${DETAIL.no}"  id="imsiOriNo" />
		<input type="hidden" name="pw"    id="imsiPw"/> 
		<input type="hidden" name="nowPage" value="${nowPage}" id="imsiNowPage"/>
	</form>
	
	
	<%-- 댓글삭제를 위한 임시폼 --%>
	<form id="tempFrm" action="../reboard/replyDelete.bo" method="post">
		<input type="hidden" name="oriNo" id="tempOriNo" />
		<input type="hidden" name="reNo" id="tempReNo" />
		<input type="hidden" name="pw" id="tempPw" />
		<input type="hidden" name="nowPage" id="tempNowPage" />
	</form>
</body>
</html>







