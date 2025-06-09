<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Cookie</title>
</head>
<body>
	<%
		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			cookies[i].setMaxAge(0); // 쿠키 삭제
			response.addCookie(cookies[i]);
		}
		response.sendRedirect("cookie01.jsp");
	%>
</body>
</html>