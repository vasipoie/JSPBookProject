<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
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
							넘겨받은 아이디, 비밀번호를 통해 회원 정보가 일치해서 회원인경우, 회원 목록 페이지로 이동하고
							존재하지 않는 회원이면 다시 로그인 페이지로 전달하여 "존재하지 않는 회원입니다" 에러 메세지를 출력해주세요.
						-->
						<%
							request.setCharacterEncoding("utf-8");
						
							String id = request.getParameter("id");
							String pw = request.getParameter("pw");
							
							MemberDAO dao = MemberDAO.getInstance();
							
							MemberVO mv = new MemberVO();
							
							ArrayList<MemberVO> memberList = dao.getMemberList();
							
							String res = "존재하지 않는 회원입니다";
							request.getSession().setAttribute("res", res);
							
							for(MemberVO mvo : memberList){
								if(id.equals(mvo.getMem_id()) && pw.equals(mvo.getMem_pw())){
									request.getSession().removeAttribute("res");
									response.sendRedirect("ch07_test_memberList.jsp");
									return;
								}
							}
							response.sendRedirect("ch07_test_signin.jsp");
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