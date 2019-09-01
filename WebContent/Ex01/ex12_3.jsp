<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex12_3</title>
</head>
<body>
<% /*application 내장객체(교재 p121)
		• javax.servlet.http.ServletContext
		• 웹 애플리케이션(컨텍스트) 에 관련된 정보를 제공
		• 개발자를 위한 서버 정보
		• 서버의 각종 자원 정보 */
%>
	<h2>웹 어플리케이션의 자원구하기</h2>
	<p>application 내장객체(교재 p127)</p>	
<%
  char[] buff = new char[128]; //Reader는 char단위로 입출력되므로 char[]변수준비
  int len = -1; //읽어들인 실제 글자의 길이를 저장하기위한 변수
  
	String filePath = 
		"D:\\workspace\\JSP\\uriPro\\WebContent\\ex\\message\\notice.txt";

	//외부의 파일(notice.txt)을 읽어와=> FileInputStream, InputStreamReader이용
			//Reader는 char단위로 IO처리
	try{		
		InputStreamReader fr = 
			new InputStreamReader(new FileInputStream(filePath),"UTF-8");		
			
		//파일의 크기를 알수 없으므로
		//준비한 배열변수만큼 내용을 반복적으로 읽어오자
		while( (len = fr.read(buff)) != -1 ){
			//브라우저 화면에 출력
			out.println(  new String(buff,0,len) );
		}
	}
	catch(Exception e){  
		e.printStackTrace();
	}
	
	String path = application.getRealPath("./message/notice.txt");
	out.println("<p>application.getRealPath('notice.txt')="+path+"</p>");
%>	
</body>
</html>





