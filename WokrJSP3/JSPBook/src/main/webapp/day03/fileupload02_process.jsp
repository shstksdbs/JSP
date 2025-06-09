<%@page contentType="text/html; charset=utf-8"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<title>File Upload</title>
</head>
<body>
<%
	String fileUploadPath = "C:\\upload";

	DiskFileUpload upload = new DiskFileUpload(); // MultipartRequest랑 다른 방식

	List items = upload.parseRequest(request);

	Iterator params = items.iterator();

	while (params.hasNext()) {
		FileItem fileItem = (FileItem) params.next();
		if (!fileItem.isFormField()) {
			String fileName = fileItem.getName();
			System.out.println(fileName+"1");
			// C:\\upload\\a.jpg
			fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); // c://hello//a.jpg
			System.out.println(fileName+"2");
			File file = new File(fileUploadPath + "/" + fileName); // c://upload//a.jpg
			fileItem.write(file); // 파일이 실제 써집니다.
		}
	}
%>
</body>
</html>