<%@page import="kr.or.ddit.vo.Book"%>
<%@page import="kr.or.ddit.dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css" />
<title>도서 정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">도서 정보</h1>
		</div>
	</div>
	
	<%
	
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById("id");
		
	%>
	
	<div class="container">
		<div class="row">
			<!--
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath }/resources/images/" style="width: 100%" />
			</div>
			-->
			<div class="col-md-12">
				<h4><b>[<!-- 카테고리 -->] <!-- 책 이름 --></b></h4>
				<p><!-- 설명 --></p>
				<p><b>도서코드 : </b><span class="badge badge-danger"><!-- 도서코드 --></span></p>
				<p><b>출판사</b> : <!-- 출판사 --></p>			
				<p><b>저자</b> : <!-- 저자 --></p>			
				<p><b>재고수</b> : <!-- 재고수 --></p>
				<p><b>총 페이지수</b> : <!-- 총 페이지수 --></p>
				<p><b>출판일</b> : <!-- 출판일 --></p>
				<h4><!-- 가격 --></h4>
				<form name="addForm" action="./addCart.jsp" method="get">
					<input type="hidden" value="" name="id"/>
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문&raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니&raquo;</a> 
					<a href="./books.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="../pageModule/footer.jsp" %>
</body>
</html>
