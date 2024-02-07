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
                        <li>CH14</li>
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
							아이디, 비밀번호 process 페이지로 넘겨 인증처리를 진행해주세요.
							이때, 아이디 저장 체크를 하고 로그인 성공 시 쿠키를 저장해 저장된 쿠키로
							인해 다시 로그인 페이지를 reload했을 때 아이디 저장이 체크가 되어있고
							아이디 입력란에 아이디가 입력된 상태에 로그인 페이지가 나타나게 해주세요.
							
							아이디 저장 체크를 하지 않고 로그인 성공 시 쿠키를 저장하지 않고
							다시 로그인 페이지를 reload했을 때 아이디 저장이 체크가 되어있지 않은
							상태이면서 아이디 입력란에 아이디가 입력되어 있지 않은 상태로 페이지가
							나타나게 해주세요.
							
							----평상시----
							아이디 : ____________
							비밀번호 : ___________
							□ 아이디 저장
							[ 로그인 ]
							
							----체크했을 때----
							아이디 : admin____
							비밀번호 : _______
							■ 아이디 저장
							[ 로그인 ]
						 -->
						 
						 <%
						 	request.setCharacterEncoding("utf-8");
						 
						 	String id = request.getParameter("id");
						 	String pw = request.getParameter("pw");
						 	String idCheck = request.getParameter("idCheck");
						 	
						 	if(id.equals("admin") && pw.equals("1234")){
							 	if(idCheck != null){
							 		Cookie cookieId = new Cookie("cookieId", id);
							 		Cookie cookieIdCheck = new Cookie("cookieIdCheck", idCheck);
							 		response.addCookie(cookieId);
							 		response.addCookie(cookieIdCheck);
							 		
							 		response.sendRedirect("ch14_test.jsp");
							 	}else {
							 		out.println("로그인 되었습니다 <br/>");							 	}
							%>
									<button onclick="location.href='ch14_test.jsp'">로그인 페이지로 이동</button>
							<%
						 	}else {
						 		out.println("로그인 정보가 맞지 않습니다. 다시 입력해주세요 <br/>");
						 		Cookie[] cookies = request.getCookies();
						 		for(int i=0; i<cookies.length; i++){
						 			cookies[i].setMaxAge(0);
						 		}
						 	%>
						 	<button onclick="location.href='ch14_test.jsp'">로그인 페이지로 이동</button>
						 	
						 	<%
						 	}
						 	if(idCheck == null){
						 		Cookie[] cookies = request.getCookies();
						 		for(int i=0; i<cookies.length; i++){
						 			cookies[i].setMaxAge(0);
						 			response.addCookie(cookies[i]);
						 		}
						 	}
						 	%>
						 
						 
						 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>