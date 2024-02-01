<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH02</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<!-- 
							[문제] 구구단 1-9단까지 출력해주세요.
							[옵션]
							- 짝수 단인 경우에는 빨간색으로 출력해주세요.
							- 출력 기준을 2가지(가로로 출력, 세로로 출력)를 가진
							  selectbox를 제공하고 제공된 출력에 따라 결과를 출력해주세요.
							  > 스크립트 태그를 활용해주세요
							  > 구구단 알고리즘은 자바스크립트가 아닌 스크립틀릿 안에서 진행해주세요.
							  > 가로로 출력, 세로로 출력을 선택할 때마다 각각의 출력형태로 출력해주세요.
						 -->
						 <select id="orderSelect">
						 	<option value="none">-- 출력선택 -- </option>
						 	<option value="garo"> 가로로 출력 </option>
						 	<option value="sero"> 세로로 출력 </option>
						 </select>
						 <br>
						
						<div id="garoPrint" style="display:none">
						<%
							for(int i=1; i<=9; i++){
								if(i % 2 == 0){
									out.println("<p style='color: red;'>");
								}
						
								for(int j=1; j<=9; j++){
									out.println(i +" X "+ j +" = "+ i*j+"&nbsp;");
								}
								out.println("</p>");
							}
						%>
						</div>

						<div id="seroPrint" style="display:none">
						<%						
							for(int k=1; k<=9; k++){
								for(int l=1; l<=9; l++){
									if(l % 2 == 0){
										out.print("<span style='color: red;'>"+ l+" X "+k+" = "+ k*l +"&nbsp;"+"</span>");
									}else {
										out.print(l + " X " +k+ " = "+ k*l +"&nbsp;");
									}
								}
						%>
						<br>
						<%
							}
						%>
						
						</div>						
						
						
						<script>
							$(document).ready(function(){
								$('#orderSelect').change(function(){
									var result = $('#orderSelect').val();
									if(result == 'none'){
										$('#garoPrint').hide();
										$('#seroPrint').hide();
									}else if(result == 'garo'){
										$('#garoPrint').show();
										$('#seroPrint').hide();
									}else{
										$('#garoPrint').hide();
										$('#seroPrint').show();
									}
								});
							});
							
							
							
							
							
							
							
						</script>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>