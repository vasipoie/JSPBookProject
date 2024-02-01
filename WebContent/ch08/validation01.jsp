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
                        <li>CH08</li>
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
						<!-- 자바스크립트 버전 활용 -->
						<h3>Javascript 버전</h3>
						<form action="process.jsp" method="post" name="loginForm">
							아이디 : <input type="text" name="id"/><br/>
							비밀번호 : <input type="text" name="pw"/><br/>
							<input type="button" value="전송" onclick="CheckForm()"/>
						</form>
						
						<!-- jQuery 버전 활용 -->
						<h3>jQuery 버전</h3>
						<form action="process.jsp" method="post" id="loginForm2">
							아이디 : <input type="text" name="id" id="id2"/><br/>
							비밀번호 : <input type="text" name="pw" id="pw2"/><br/>
							<input type="button" value="전송" id="sendBtn"/>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
function CheckForm() {
	alert("아이디 : " + document.loginForm.id.value + "\n" + "비밀번호 : "
			+ document.loginForm.pw.value);
	document.loginForm.submit();
}
$(function() {
	var sendBtn = $("#sendBtn"); // 전송 버튼 Element
	var loginForm2 = $("#loginForm2"); // 전송 버튼 Element

	sendBtn.on("click", function() {
		alert("아이디 : " + $("#id2").val() + "\n" +
				"비밀번호 : "	+ $("#pw2").val());
		loginForm2.submit();
	});

	// 방법 2
// 	sendBtn.on("click", CheckFormJuery);

// 	function CheckFormJquery() {
// 		alert("아이디 : " + $("#id2").val() + "\n" +
// 				"비밀번호 : "	+ $("#pw2").val());
// 		loginForm2.submit();
// 	}
});
</script>

</html>