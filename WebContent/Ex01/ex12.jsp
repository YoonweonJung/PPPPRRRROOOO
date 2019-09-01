<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex12</title>
</head>
<body>
<% /*application 내장객체(교재 p121)
		• javax.servlet.http.ServletContext
		• 웹 애플리케이션(컨텍스트) 에 관련된 정보를 제공
		• 개발자를 위한 서버 정보
		• 서버의 각종 자원 정보 */
		String server = application.getServerInfo();
		
	  //서블릿의 버전에서  소수점앞부분
	  //tomcat 9의  서블릿버전은 4.0
		int  majorVer = application.getMajorVersion();//4
		
		//서블릿의 버전에서  소수점뒷부분인데 int이므로 0
		int  minorVer = application.getMinorVersion();//0
		
		
		//폴더를 강제로 하나만들고(imgs)
		//서버가 이 폴더를 관리하는 실제 폴더의 위치를 알아보자
		String path = application.getRealPath("imgs");
		out.println("<p>application.getRealPath('imgs')="+path+"</p>");
		
%>
	application.getServerInfo()=<%=server %><br/>
	application.getMajorVersion()=<%=majorVer %><br/>
	application.getMinorVersion()=<%=minorVer %><br/>
</body>
</html>
<%-- 출력결과
application.getRealPath('imgs')=D:\workspace\JSP\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\uriPro\imgs

application.getServerInfo()=Apache Tomcat/9.0.21
application.getMajorVersion()=4
application.getMinorVersion()=0
 --%>








