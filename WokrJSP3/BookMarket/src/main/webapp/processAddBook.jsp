<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String filename = "";
	//String realFolder = "C:\\Users\\user\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket\\resources\\images";
	String realFolder = "C:\\WokrJSP1\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\BookMarket\\resources\\images";
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb
	String encType = "utf-8"; //인코딩 타입

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");	
	String description = multi.getParameter("description");	
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	int price;
	System.out.println(request.getParameter("bookId"));
	System.out.println(bookId);
	System.out.println(unitPrice);
	
	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	BookRepository dao = BookRepository.getInstance();
	Book newbook = new Book();
	newbook.setBookId(bookId);
	newbook.setName(name);
	newbook.setUnitPrice(price);
	newbook.setAuthor(author);
	newbook.setPublisher(publisher);
	newbook.setDescription(description);
	newbook.setCategory(category);
	newbook.setUnitsInStock(stock);
	newbook.setCondition(condition);
	newbook.setFilename(fileName);
	
	dao.addBook(newbook);
	
	response.sendRedirect("books.jsp");

%>
