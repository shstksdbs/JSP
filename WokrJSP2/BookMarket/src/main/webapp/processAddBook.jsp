<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");


	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String releaseDate = request.getParameter("releaseDate");	
	String description = request.getParameter("description");	
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
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
	
	dao.addBook(newbook);
	
	response.sendRedirect("books.jsp");

%>
