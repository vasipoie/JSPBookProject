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
                        <li>CH13</li>
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
							1. 초기 세션 만료시간을 30초로 설정해주세요
							2. 세션 만료시간이 15초일 때,
								"로그인 세션이 곧 만료됩니다. 연장하시겠습니까?"
								라는 알림창이 나타나고
								[확인]버튼을 클릭 시, 세션 만료시간을 60초로 연장 후 해당 페이지에서
								60초부터 세션 만료시간이 관리될 수 있도록 설정해주세요.
								[취소]버튼을 클릭 시, 세션 만료가 그대로 진행되게 하고 
								세션 만료 시간이 0일 때 "로그인 세션 시간이 만료되어 자동 로그아웃 됩니다."를 출력
								
								-모두 같은 페이지에서 출력해도 상관없습니다!
								-각기 다른 페이지에서 처리부, 출력부를 달리해서 만들어도 좋습니다!
						 -->
						 
						 <form action="ch13_process.jsp" method="post">
							아이디 : <input type="text" name="id" /><br />
							비밀번호 : <input type="text" name="pw" />
							<input type="submit" value="전송" />
						</form>
						 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>