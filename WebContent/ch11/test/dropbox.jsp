<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.ddit.dao.BoardRepository"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.vo.BoardFileVO"%>
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
<style type="text/css">
.dropbox_div {
  border: 1px solid black;
  width: 220px;
  height: auto;
  display: inline-block;
}
.imgSize {
  width: 210px;
  height: 200px;
}
.downFileName {
  cursor: pointer;
}
</style>
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
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.
						- 자료실을 구성하는데 필요한 내용 모두는 board를 작성했던 방식을 참고하여 작성한다.
						
						1. 파일의 유형에 따라 유형에 맞는 default 이미지로 리스트를 구성하세요.
						
						[출력 예]
						
						자료실
						[pdf]	[excel]	[excel]	[ppt]
						[image] [txt]	[word]	[txt]
						[etc]	[etc]	[pdf]	[ppt]
						[...]
						
						목록 
					 -->
					 <%
					 	BoardRepository dao = BoardRepository.getInstance();
					 	ArrayList<BoardVO> boardList = dao.selectBoardList();
					 %>
					 
						<h5>메뉴 박스</h5>
						<hr />
						<a href="boardList.jsp"><button>게시판</button></a> <a href="dropbox.jsp"><button>자료실</button></a> <a href="logout.jsp"><button>로그아웃</button></a>                    </div>
						<hr />
						<h4>자료실</h4>
						<hr />
					 <%
					 	for(BoardVO bv : boardList){
					 %>
						<div class="dropbox_div">
							<%
								if(bv.getFileVO().getContentType().contains("image")){
							%>
								<img class="imgSize" alt="" src="${pageContext.request.contextPath }/resources/images/<%=bv.getFileVO().getFileName() %>">
							<%		
								}else if(bv.getFileVO().getContentType().contains("application/pdf")){
							%>
								<img class="imgSize" alt="" src="https://cdn-icons-png.flaticon.com/512/4208/4208479.png">
							<%
								}else if(bv.getFileVO().getContentType().contains("text")){
							%>
								<img class="imgSize" alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1n8UwDyrxqYLjlsn3UIMjo82t4yMioyUhzw&usqp=CAU">
							<%		
								}else if(bv.getFileVO().getContentType().contains("spreadsheetml")){
							%>
								<img class="imgSize" alt="" src="https://w7.pngwing.com/pngs/670/803/png-transparent-excel-logo-logos-logos-and-brands-icon-thumbnail.png">
							<%	
								}else if(bv.getFileVO().getContentType().contains("word")){
							%>
								<img class="imgSize" alt="" src="https://cdn-icons-png.flaticon.com/512/888/888883.png">
							<%	
								}else if(bv.getFileVO().getContentType().contains("powerpoint")){
							%>
								<img class="imgSize" alt="" src="https://www.freeiconspng.com/thumbs/ppt-icon/powerpoint-icon-microsoft-powerpoint-icon-network-powerpoint-icons-and-3.png">
							<%	
								}else {
							%>
								<img class="imgSize"  alt="" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ShHzazLTchJlpLckU9EETd9zoC3Hj9ijhw&usqp=CAU">
							<%
								}
							%>
							<p><a class="downFileName" style="color: blue" onclick="imgDown('<%=bv.getFileVO().getFileName() %>')" >
							파일명 : <%=bv.getFileVO().getFileName() %></a></p>
							<p>크기 : <%=bv.getFileVO().getFileSize() %></p>
						</div>
					 <%
					 	}
					 %>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
<script type="text/javascript">
function imgDown(fileName) {
    var downLink = document.createElement('a');
    downLink.href = "${pageContext.request.contextPath}/resources/images/" + fileName;
    downLink.download = fileName;

    document.body.appendChild(downLink);
    downLink.click();
    document.body.removeChild(downLink);
}	
</script>
</body>
</html>