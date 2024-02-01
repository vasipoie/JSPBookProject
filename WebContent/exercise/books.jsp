<%@page import="kr.or.ddit.vo.Book"%>
<%@page import="kr.or.ddit.dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css" />
<title>도서 목록</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 목록</h1>
		</div>
	</div>
      <%
      	String id = request.getParameter("id");
      	BookRepository dao = BookRepository.getInstance();
      
      	Book book = dao.getBookById(id);
      	
      %>
	<div class="container">	
		<div class="row">
			<!--
			<div class="col-md-3" align="center">	
				<img src="${pageContext.request.contextPath }/resources/images/" width="60%">
			</div>
			-->
			<div class="col-md-10">	
				<h5 ><b>[<%=book.getCategory() %>] <%=book.getName() %></b></h5>
				<p style="padding-top: 10px"><%=book.getDescription() %>...</p> 
				<p><%=book.getAuthor() %> | <%=book.getPublisher() %>  | <%=book.getUnitPrice() %> 원</p>
			</div>	
			<div class="col-md-2"  style="padding-top: 60px">						    			 
				<a href="./book.jsp?id=" class="btn btn-secondary" role="button"> 상세정보 &raquo;></a>				
			</div>				
		</div>
		<hr>
	</div>	
	<%@ include file="../pageModule/footer.jsp" %>
</body>
</html>
