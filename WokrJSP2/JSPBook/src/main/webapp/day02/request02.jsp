<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Enumeration en = request.getHeaderNames();
		while(en.hasMoreElements()){
			String headerName = (String) en.nextElement();
			String headerVaule = request.getHeader(headerName);
	
	%>
	<%=headerName %> : <%=headerVaule %><br>
	<%
		}
	%>
</body>
</html>