<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="kr.or.ddit.vo.BoardFileVO"%>
<%@page import="kr.or.ddit.vo.BoardVO"%>
<%@page import="kr.or.ddit.dao.BoardRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionBoard_error.jsp" %>
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
					<!-- 
						1. 게시글 수정을 처리해주세요.
							> 수정 성공 후, 상세보기 페이지(boardView.jsp)로 이동해주세요.
							> 수정 실패 후, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
					 -->
					 
				 	<%
				 		request.setCharacterEncoding("utf-8");
				 		
				 		BoardRepository dao = BoardRepository.getInstance();
				 		
						BoardVO bv = new BoardVO();
						
						BoardFileVO bfv = new BoardFileVO();
					 
					 	String realFolder = request.getServletContext().getRealPath("/resources/images");
						String encType = "utf-8";
						int maxSize = 5 * 1024 * 1024;
						
						File file = new File(realFolder);
						if(!file.exists()){
							file.mkdirs();
						}
						
						DiskFileUpload upload = new DiskFileUpload();
						upload.setSizeMax(1000000);
						upload.setSizeThreshold(maxSize);
						upload.setRepositoryPath(realFolder);
						List items = upload.parseRequest(request);
						Iterator params = items.iterator();
						
						String title="";
						String content="";
						String contentType="";
						long fileSize = 0;
						String fileName="";
						
						while(params.hasNext()){
							FileItem item = (FileItem)params.next();
							
							if(item.isFormField()){ //일반 데이터 일 때
								String fieldName = item.getFieldName(); //파라미터의 이름
								if(fieldName.equals("modiTitle")) 
									title = item.getString(encType);
								else if(fieldName.equals("modiContent"))
									content = item.getString(encType);
							}else { //파일 일 때
								String fileFieldName = item.getFieldName();
								fileName = item.getName();
								contentType = item.getContentType();
								fileSize = item.getSize();
								File saveFile = new File(realFolder + "/" + fileName);
								item.write(saveFile);
							}
						}
						
						int no = Integer.parseInt(request.getParameter("no"));
						
						bv.setTitle(title);
						bv.setContent(content);
						bv.setNo(no);				
						bfv.setContentType(contentType);
						bfv.setFileSize(fileSize);
						bfv.setFileName(fileName);
						
						bv.setFileVO(bfv);
						
						dao.updateBoard(bv);
				 		
						response.sendRedirect("boardView.jsp?no="+no);
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