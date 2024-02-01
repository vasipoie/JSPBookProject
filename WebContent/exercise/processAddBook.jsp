<%@page import="kr.or.ddit.vo.Book"%>
<%@page import="kr.or.ddit.dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>


<%
	request.setCharacterEncoding("utf-8");

	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String description = request.getParameter("description");
	String publisher = request.getParameter("publisher");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String totalPages = request.getParameter("totalPages");
	String releaseDate = request.getParameter("releaseDate");
	String condition = request.getParameter("condition");
	String filename = request.getParameter("filename");
	String quantity = request.getParameter("quantity");
	
	Integer price;
	if(unitPrice.isEmpty()) price=0;
	else    price=Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty())
        stock=0;
	else    stock=Long.valueOf(unitsInStock);
	
	long pages;
	if(totalPages.isEmpty())
        pages=0;
	else    pages=Long.valueOf(totalPages);
	
	BookRepository dao = BookRepository.getInstance();
	
	Book newProduct=new Book();
    
    newProduct.setBookId(bookId);
    newProduct.setName(name);
    newProduct.setUnitPrice(price);
    newProduct.setAuthor(author);
    newProduct.setDescription(description);
    newProduct.setPublisher(publisher);
    newProduct.setCategory(category);
    newProduct.setUnitsInStock(stock);
    newProduct.setTotalPages(pages);
    newProduct.setReleaseDate(releaseDate);
    newProduct.setCondition(condition);
	
    dao.addBook(newProduct);
    response.sendRedirect("books.jsp");
%>