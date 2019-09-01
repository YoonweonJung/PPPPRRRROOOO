<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap 라이브러리 등록 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<script type="text/javascript">
$(function(){
	// 이벤트 처리
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>
<body>
<a href = "../msgboard/msgBoardList.ho">돌아가기</a>
	<div class="container">
		<h2>쪽지 쓰기</h2>
		<form action="msgwriteProc.jsp">
			<div class="form-group">
			<label for="content">받는이</label>
						<input  type="text" 
						name="m_nickcheck" 
						class="form-control"
			 			id ="titleform" pattern=".{4,}"  
			 			required title="아이디를 작성하십시오" autocomplete="off" />	
			 			
			 				
				<label for="content">제목</label>
						<input  type="text" 
						name="title" 
						class="form-control"
			 			id ="titleform" pattern=".{4,}"  
			 			required title="4자 이상 작성하십시오" autocomplete="off" />		
			 			
			 					
			 	<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"></textarea>
				
				
				<label for="content">작성자</label>
					
			</div>
			<!--등록 , 취소버튼-->
			<div class="btn-group">
			
			<!-- button tag의 기본 type은 submit -->
			<button class="btn btn-success" id="writeBtn">등록</button>
			<button class="btn btn-danger" id="cancelBtn">취소</button>
			
			</div>
		</form>
		
	</div>
	
</body>
</html>