<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.dao.BoardRepository"%>
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
					<!--
						1. 게시글 상세보기를 출력해주세요.
							> JSTL을 활용해주세요. 
						
						[출력 예]
						
						게시판 상세보기
						──────────────────────────────────────────────
						제목 : 
						작성자 작성일 조회수
						──────────────────────────────────────────────
						내용
						──────────────────────────────────────────────
						
						[ 수정  ] [ 삭제  ] [ 목록  ]
						
						2. 수정 버튼 클릭 시, 수정 페이지(boardUpdateForm.jsp)로 이동합니다.
						3. 삭제 버튼 클릭 시, 해당 게시글이 삭제 처리 될 수 있도록 합니다.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [확인]버튼을 클릭 시 삭제가 처리(boardRemove.jsp) 될 수 있도록 해주세요.
							> "정말로 삭제하시겠습니까?" 알림창이 나타나고, [취소]버튼을 클릭 시 알림창이 꺼질 수 있게 해주세요.
						4. 목록 버튼 클릭 시, 목록 페이지(boardList.jsp)로 이동합니다.
					 -->
					 
					 	<%
					 		int no = Integer.parseInt(request.getParameter("no"));
					 		BoardRepository dao = BoardRepository.getInstance();
					 		BoardVO bv = dao.getBoardById(no);
					 	%>
					 	<h5>게시판 상세보기</h5>
					 	<hr />
					 	
					 	<table border="1">
					 		<tr>
					 			<th>제목</th>
					 			<th><c:out value="<%=bv.getTitle() %>"></c:out></th>
					 		</tr>
					 		<tr>
					 			<th colspan="2">
					 				<c:out value="<%=bv.getWriter() %>"/>
					 				<c:out value="<%=bv.getRegDate() %>"/>
					 				<c:out value="<%=bv.getHit() %>"/>
					 			</th>
					 		</tr>
					 		<tr>
					 			<th colspan="2"><c:out value="<%=bv.getContent() %>"/></th>
					 		</tr>
					 		<tr>
					 			<th>첨부파일</th>
					 			<th>
					 				<a href="${pageContext.request.contextPath }/resources/images/<%=bv.getFileVO().getFileName() %>"/>
					 				<c:out value="<%=bv.getFileVO().getFileName() %>"/>
					 			</th>
					 		</tr>
					 		<tr>
					 			<th colspan="2">
						 			<a href="boardUpdateForm.jsp?no=<%=bv.getNo()%>"><button>수정</button></a>
						 			<input type="button" onclick="delete_board()" value="삭제"></input>
						 			<a href="boardList.jsp"><button>목록</button></a>
					 			</th>
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
<script type="text/javascript">
function delete_board(){
	Swal.fire({
		   title: '정말로 삭제하시겠습니까?',
		   icon: 'warning',
		   
		   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
		   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		   confirmButtonText: '승인', // confirm 버튼 텍스트 지정
		   cancelButtonText: '취소', // cancel 버튼 텍스트 지정
		   
		   reverseButtons: true, // 버튼 순서 거꾸로
		   
		}).then(result => {
		   // 만약 Promise리턴을 받으면,
		   if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
			   location.href="boardRemove.jsp?no=<%=bv.getNo() %>";
		   }
		});
}
</script>
</html>