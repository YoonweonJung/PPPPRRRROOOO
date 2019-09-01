<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

 	<%
        String select = request.getParameter("pageChange");
 
        if (select == null) {
            select = "content.jsp";
        }
        if (select == "../shop/ShopboardDatail.ho") {
        	select = "sub3.jsp";
        }
    %>
 

    <jsp:include page="header.html"/>

    <jsp:include page="<%=select%>"/>
 	
 	<%
         System.out.print("셀렉트는\n"+select);
    
    %>
 
    <jsp:include page="footer.html"/>
    
</body>
</html>

