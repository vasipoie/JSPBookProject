<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                        <li>CH03</li>
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
							*** JSTL을 활용하여 아래 문제를 작성해주세요.
							1) 403호 반 학생 이름 모두를 Core태그 set에 저장한 후, 전체를 출력해주세요
							2) 학생의 이름을 4명씩 끊어서 출력해주세요
								이름 이름 이름 이름
								이름 이름 이름 이름
							3) 4명씩 끊어서 출력할 때, 본인의 이름은 '본인'으로 출력해주세요
								본인 글자를 출력 시, 굵은 글씨와 색깔은 녹색으로 출력해주세요
						-->
						
						<%
							List<String> list = new ArrayList<String>();
							list.add("권예은");
							list.add("김나혜");
							list.add("김영상");
							list.add("김태원");
							list.add("김현태");
							list.add("민경선");
							list.add("백지은");
							list.add("서어진");
							list.add("선민수");
							list.add("성이수");
							list.add("송현지");
							list.add("신하림");
							list.add("안희재");
							list.add("이명문");
							list.add("이수진");
							list.add("이영주");
							list.add("임민혁");
							list.add("조재훈");
							list.add("최소희");
							list.add("최현명");
							list.add("최현흠");
							list.add("최윤서");
							list.add("홍진영");
							list.add("김다애");
						%>
						
						<p>403호 전체 인원</p>
						<c:set var="name" value="<%=list %>"/>
						<c:out value="${name }"></c:out>
							
						<br/><br/>
						
						<p>4명씩 끊어서 출력</p>
						<c:forEach var="itemfour" items="${name }" varStatus="stat">
							
							<c:choose>
								<c:when test="${itemfour eq '김나혜'}">
									<span style="color:green; font-weight:bold">본인</span>
								</c:when>
								<c:otherwise>
									<c:out value="${itemfour }"></c:out>
								</c:otherwise>
							</c:choose>
							
							<c:if test="${stat.count % 4 == 0}">
								<br/>
							</c:if>
							
						</c:forEach>
						
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>