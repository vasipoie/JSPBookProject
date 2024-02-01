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
                        <h1 class="page-title">유효성검사</h1>
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
						<!-- 
							문제 풀어보기
							아래 정규식을 풀어보고 통과 했다면 ch08_test_process.jsp로 전송하여 결과를 출력해주세요. 
							
							정규식 테스트 URL : https://regexr.com
						-->
						<form id="frm" name="frm" action="./ch08_test_process.jsp" method="post">
							<h4>숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.</h4>
							<input type="text" id="quest1" name="quest1" />
							<p id="err_quest1"></p>
							<br/>	
							
							<h4>시작은 영소문자 abc고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.</h4>
							<input type="text" id="quest2" name="quest2" />
							<p id="err_quest2"></p>
							<br/>	
							
							<h4>아이디는 영소문자로 시작하고 영소문자,숫자  8~16자로 설정해주세요.</h4>
							<input type="text" id="mem_id" name="mem_id" />
							<p id="err_id"></p>
							<br/>	
					
							<h4>비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자  8~16자로 설정해주세요.</h4>
							<input type="text" id="mem_pw" name="mem_pw" />
							<p id="err_pw"></p>
							<br/>
					
							<h4>이름은 한글 2-5글자로 설정해주세요.</h4>
							<input type="text" id="mem_name" name="mem_name" />
							<p id="err_name"></p>
							<br/>
							
							<h4>
							핸드폰 번호의 첫번째 자리는 011,016,017,019,070,010 으로 시작하고 <br/>
							두번째 자리는 숫자 3자리 또는 숫자 4자리로 시작하고<br/>
							세번째 자리는 숫자 4자리로 설정해주세요.<br/>
							예시) 010-1234-1234, 016-123-1234
							</h4>
							<input type="text" id="mem_phone" name="mem_phone"/>
							<p id="err_phone"></p>
							<br/>
							
							<p id="success"></p>
							
							<input type="button" id="sendBtn" value="전송" onclick="Check()"/>
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
function Check(){
	//숫자만 입력하되, 7-12자리까지만 입력 받을 수 있게 설정해주세요.
	var regOne = /^[0-9]{7,12}$/;
	
	//시작은 영소문자 abc고 영소대문자 8-12자리까지만 입력 받을 수 있게 설정해주세요.
	var regTwo = /^(abc)[a-zA-Z]{5,9}$/;
	
	//아이디는 영소문자로 시작하고 영소문자,숫자  8~16자로 설정해주세요.
	var regId = /^[a-z][a-z0-9]{7,15}$/;
	
	//비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자  8~16자로 설정해주세요.
	var regPw = /^[A-Z][^가-힣]{7,15}$/;
	
	//이름은 한글 2-5글자로 설정해주세요.
	var regName = /^[가-힣]{2,5}$/;
	
// 	핸드폰 번호의 첫번째 자리는 011,016,017,019,070,010 으로 시작하고 <br/>
// 	두번째 자리는 숫자 3자리 또는 숫자 4자리로 시작하고<br/>
// 	세번째 자리는 숫자 4자리로 설정해주세요.
	var regPhone = /^(010|011|016|017|019|070)-\d{3,4}-\d{4}$/;
	
	var form = document.frm;
	var quest1 = form.quest1.value;
	var quest2 = form.quest2.value;
	var mem_id = form.mem_id.value;
	var mem_pw = form.mem_pw.value;
	var mem_name = form.mem_name.value;
	var mem_phone = form.mem_phone.value;
	
	if(!regOne.test(quest1)){
		alert("1번은 숫자만 입력하되, 7-12자리까지만 입력해주세요");
		return false;
	}
	
	if(!regTwo.test(quest2)){
		alert("2번은 시작은 영소문자 abc고 영소대문자 8-12자리까지만 입력해주세요");
		return false;
	}
	
	if(!regId.test(mem_id)){
		alert("아이디는 영소문자로 시작하고 영소문자,숫자  8~16자로 입력해주세요");
		return false;
	}
	
	if(!regPw.test(mem_pw)){
		alert("비밀번호는 영대문자로 시작하고 영문 대 소문자, 숫자, 특수문자  8~16자로 입력해주세요");
		return false;
	}
	
	if(!regName.test(mem_name)){
		alert("이름은 한글 2-5글자만 입력해주세요");
		return false;
	}
	
	if(!regPhone.test(mem_phone)){
		alert("첫번째 자리는 011,016,017,019,070,010 으로 시작하고 / 두번째 자리는 3,4자리 / 세번째 자리는 4자리만 입력해주세요");
		return false;
	}
	
	form.submit();
	
}

</script>



</html>