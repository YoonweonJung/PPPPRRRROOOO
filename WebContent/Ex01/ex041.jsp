<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>041</title>
</head>
<body>
	<%--
	 이 문서는 서버쪽 문서
	 클라이언트(ex04.jsp)가 보내준 
	 데이터(학생명과 학년)를 가져와서 
	 콘솔에 출력할 예정
	 --%>
	 <h1>ex041.jsp</h1>
	<%//request.getParameter("파라미터명")
		String name = request.getParameter("name");
	  System.out.println("name="+name);//콘솔에 출력
	  
	  String stName = request.getParameter("stName");
	  System.out.println("stName="+stName);//콘솔에 출력
	  
	  //★★★request.getParameter()의 리턴유형은 String!!!
	  String strGrade = request.getParameter("grade");
	  System.out.println("strGrade="+strGrade);//콘솔에 출력  //4
	  //System.out.println("strGrade="+(strGrade*100));   //에러
	    
	  //필요하면 형을 변환해야 한다
	  int grade = Integer.parseInt(strGrade); //String타입의 데이터를 int로 형변환
	  System.out.println("grade="+grade);//콘솔에 출력 //4
	  System.out.println("grade*100="+(grade*100)); //400
	%> 
</body>
</html>


<%--
*request 내장 객체(교재 p72)
-JSP 페이지에서 가장 많이 사용되는 기본 내장 객체
-웹 브라우저에서 서버의 JSP 페이지로 전달하는 정보를 저장
-폼 페이지로부터 입력된 데이터를 전달하는 요청 파라미터 값을 JSP 페이지로 가져옴 
-JSP 컨테이너는 웹 브라우저에서 서버로 전달되는 정보를 처리하기 위해 
  javax.servlet.http.HttpServletRequest 객체 타입의 
  request 내장 객체를 사용하여 사용자의 요구 사항을 얻어냄
 --%>










