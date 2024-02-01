<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
	<title>쉽게 배우는 JSP 웹 프로그래밍</title>
	<meta name="description" content="" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/exercisePageModule/header.jsp" %>
	<%! 
		String title = "도서 웹 쇼핑몰";
		String tagline = "Welcome to Web Market!";
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<!-- 변수 greeting의 값을 출력하도록 표현문 태그를 작성한다. -->
				<%=title %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline %>
			</h3>
		</div>
		<hr/>
	</div>
	
	<%@ include file="/exercisePageModule/footer.jsp" %>
	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>