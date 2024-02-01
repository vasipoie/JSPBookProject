<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.dao.MemberDAO"%>
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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
                    	1. 회원 목록 페이지를 작성해주세요.
                    	
                    	[ 등록 ]
                    	______________________________
                    	이미지	     회원정보			버튼
                    	______________________________
                    	[ 이	]     아이디 : a001      [상세]
                    	[ 미 ]     비번 : 1234
                    	[ 지 ]     이름 : 홍길동
                    	[ 란 ]     성별 : 남자
                    	______________________________
                    	[ 이	]     아이디 : a002      [상세]
                    	[ 미 ]     비번 : 1234
                    	[ 지 ]     이름 : 홍길순
                    	[ 란 ]     성별 : 여자
                    	______________________________
                    	... 
                     -->
                     	<input type="button" value="등록" onclick="location.href='ch07_test_signup.jsp'"/>
							<table border=1>
								<tr>
									<th>이미지</th>
									<th>회원정보</th>
									<th>버튼</th>
								</tr>
                     <%
                     	MemberDAO dao = MemberDAO.getInstance();
                     	ArrayList<MemberVO> memberList = dao.getMemberList();
                     	for(MemberVO mv : memberList){
                     %>
								<tr>
									<td style="width:30%;">
										<img alt="프로필" 
										src="${pageContext.request.contextPath }/resources/images/<%=mv.getFilename() %>"
										style="width: 50%"/>
									</td>
									<td>
										아이디 : <%=mv.getMem_id() %><br/>
										비밀번호 : <%=mv.getMem_pw() %><br/>
										이름 : <%=mv.getMem_name() %><br/>
										성별 : <%=mv.getMem_sex() %><br/>
									</td>
									<td>
										<a href="#">상세정보</a>
									</td>
                     <%
                     	}
                     %>
								</tr>
							</table>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>