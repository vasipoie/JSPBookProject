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
<style>
/* form { */
/*     max-width: 400px; */
/* 	font-family: Arial, sans-serif; */
/* } */
table {
    width: 500px; /* 테이블 전체 너비 */
    margin: 50px auto;
    border-collapse: collapse;
}
table td {
    padding: 10px;
    border: 1px solid #ccc;
    border: none;
}
table td label {
    font-weight: bold;
}
input[type="text"] {
	width: calc(100% - 100px);
    margin-bottom: 10px;
}
input[type="submit"] {
    background-color: blue;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
}
</style>
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
                        <li>CH05</li>
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
							[문제]
							아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받을 폼을 구성하고
							입력된 값을 process 페이지로 넘겨주세요.
							> 성별의 데이터는 남자일 때 M, 여자일 때 G로 설정해주세요.
							- ch05_test_process.jsp 경로로 입력받은 데이터를 전송해주세요.
						 -->
						 
						 <form action="ch05_test_process.jsp" method="post">
						 	아이디 : <input type="text" name="id"/><br/>
						 	비밀번호 : <input type="text" name="pw"/><br/>
						 	이름 : <input type="text" name="name"/><br/>
						 	성별 : <input type="radio" name="gender" value="M"/>남자
						 		  <input type="radio" name="gender" value="G"/>여자<br/>
						 	핸드폰번호 : <input type="text" name="phone"/><br/>
						 	주소 : <input type="text" name="addr"/><br/>
						 	<input type="submit" value="전송"/>

							<table>
								<tr>
									<td><label for="id">아이디 </label></td>
									<td><input type="text" name="id" id="id"></td>
								</tr>
								<tr>
									<td><label for="pw">비밀번호 </label></td>
									<td><input type="text" name="pw" id="pw"></td>
								</tr>
								<tr>
									<td><label for="name">이름 </label></td>
									<td><input type="text" name="name" id="name"></td>
								</tr>
								<tr>
									<td><label>성별 </label></td>
									<td><input type="radio" name="gender" value="M"
										id="gender-m"> <label for="gender-m">남자</label> <input
										type="radio" name="gender" value="G" id="gender-g"> <label
										for="gender-g">여자</label></td>
								</tr>
								<tr>
									<td><label for="phone">핸드폰번호 </label></td>
									<td><input type="text" name="phone" id="phone"></td>
								</tr>
								<tr>
									<td><label for="addr">주소 </label></td>
									<td><input type="text" name="addr" id="addr"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="전송"></td>
								</tr>
							</table>

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