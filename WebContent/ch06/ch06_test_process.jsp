<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<!-- 
							넘겨받은 모든 데이터를 아래와 같은 형식으로 출력해주세요.
							
							[결과]
							아이디 : a001
							비밀번호 : 1234
							이름 : 홍길동
							핸드폰번호 : 010-1234-1234
							성별 : 남자
							취미 : 운동 독서 음악
							가입인사 :
							대덕인재개발원 403호 000입니다!
							반갑습니다! 잘 부탁드립니다!
							
							아래 두가지 방법 모두로 출력해주세요.
							- 스크립트 태그를 이용한 방법으로 출력하세요
							- JSTL을 이용한 방법으로 출력하세요.
						 -->
						 
						<%
							request.setCharacterEncoding("utf-8");
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							String name = request.getParameter("name");
							String phone1 = request.getParameter("phone1");
							String phone2 = request.getParameter("phone2");
							String phone3 = request.getParameter("phone3");
							String gender = request.getParameter("gender");
							if(gender.equals("M")){
								gender = "남자";
							}else {
								gender = "여자";
							}							
							String hobby1 = request.getParameter("hobby1");
							String hobby2 = request.getParameter("hobby2");
							String hobby3 = request.getParameter("hobby3");
							String hobby4 = request.getParameter("hobby4");
							if(hobby1 != null) hobby1 = "운동";
							else hobby1="";
							
							if(hobby2 != null) hobby2 = "독서";
							else hobby2="";
							
							if(hobby3 != null) hobby3 = "영화";
							else hobby3="";
							
							if(hobby4 != null) hobby4 = "음악";
							else hobby4="";
							
							String comment = request.getParameter("comment");
							
							List<String> list = new ArrayList<String>();
							list.add(id);
							list.add(pw);
							list.add(name);
							list.add(phone1);
							list.add(phone2);
							list.add(phone3);
							list.add(gender);
							list.add(hobby1);
							list.add(hobby2);
							list.add(hobby3);
							list.add(hobby4);
							list.add(comment);
						%>	 
						
						<h5>스크립트 태그를 이용한 방법</h5>
						<p>아이디 : <%=id %></p>
						<p>비밀번호 : <%=pw %></p>
						<p>이름 : <%=name %></p>
						<p>핸드폰번호 : <%=phone1 %>-<%=phone2 %>-<%=phone3 %></p>
						<p>성별 : <%=gender %></p>
						<p>취미 : <%=hobby1 %> <%=hobby2 %> <%=hobby3 %> <%=hobby4 %></p>
						<p style="white-space:pre-wrap">가입인사 : <br/><%=comment %></p>
						 
						<hr/> 
						
						<h5>JSTL을 이용한 방법</h5>
						<c:set var="info" value="<%=list %>"></c:set>
						<p>아이디 : <c:out value="<%=list.get(0) %>"></c:out></p>
						<p>비밀번호 : <c:out value="<%=list.get(1) %>"></c:out></p>
						<p>이름 : <c:out value="<%=list.get(2) %>"></c:out></p>
						<p>
						    핸드폰번호 : <c:out value="<%=list.get(3) %>"/> -
									 <c:out value="<%=list.get(4) %>"/> -
									 <c:out value="<%=list.get(5) %>"/>
						</p>
						<p>성별 : <c:out value="<%=list.get(6) %>"></c:out></p>
						<p>취미 : <c:out value="<%=list.get(7) %>"/>
								<c:out value="<%=list.get(8) %>"/>
								<c:out value="<%=list.get(9) %>"/>
								<c:out value="<%=list.get(10) %>"/>
						</p>
						<p style="white-space:pre-wrap">가입인사 : <br/><c:out value="<%=list.get(11) %>"></c:out></p>
					
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>