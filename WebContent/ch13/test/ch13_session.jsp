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
                        <li>CH01</li>
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
						<%
							String sessionId = (String)session.getAttribute("id");
							String sessionPw = (String)session.getAttribute("pw");
						
							int sec = 20;
							session.setMaxInactiveInterval(sec);
							int time = session.getMaxInactiveInterval();
						%>
							<h5>세션 정보입니다</h5>
							<hr />
							아이디 : <%=sessionId %>
							<br />
							<input type="hidden" id="sessionTimeOut" 
							name="sessionTimeOut" value=<%=time %>>
							<span id="logTime">로그인 남은 시간 : <span id='res'></span></span>
							
							<script type="text/javascript">
								var logTime = document.getElementById('sessionTimeOut').value;
								var res = document.getElementById('res');
								
								var seconds = 1;
								var timer = document.getElementById('sessionTimeOut').value;
								
								timer = setInterval(() => {
									console.log(seconds++)
									res.innerText = logTime--;
									if(seconds == 5){
										if(confirm("로그인 세션이 곧 만료됩니다. 연장하시겠습니까?")){
											
											res.innerText = <%=session.setMaxInactiveInterval(20)%>;
											
// 											res.innerText = logTime--;
										}else {
											res.innerText = logTime--;
										}
									}
									if(seconds == 20){
										alert("로그인 세션 시간이 만료되어 자동 로그아웃 됩니다.");
										clearInterval(timer);
									}
								}, 1000);
								
								function showRemaining(){
									
								}
								
							</script>
							
							<%
								session.removeAttribute("id");
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