<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<%! int count = 3; 
  String makeItLower(String data){
	  return data.toLowerCase();
  }%>
    Page Count is 
    <%
        for(int i = 1;i<=count;i++){
        	out.println("Java Server Pages "+ i + "<br>"); 
        }
    %>
    <%= makeItLower("Hello World") %>
</body>
</html>