<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
						<!-- 내용을 입력해주세요 -->
						<%
							String path = "C:\\upload";
						
							File tempFile = new File(path);
							if(!tempFile.exists()){
								tempFile.mkdirs();
							}
							
							DiskFileUpload upload = new DiskFileUpload();
							
							//업로드 할 파일의 최대 크기(byte)
							upload.setSizeMax(5 * 1024 * 1024); //5메가
							//메모리상에 저장할 최대 크기(byte)
							upload.setSizeThreshold(4 * 1024 * 1024); //4메가
							//업로드 된 파일을 임시로 저장할 경로
							upload.setRepositoryPath(path);
							
							List items = upload.parseRequest(request);
							Iterator params = items.iterator();
							
							//파일 업로드 시 최대 사이즈(4MB)
							int maxSize = 4 * 1024 * 1024;
							while(params.hasNext()){
								FileItem item = (FileItem) params.next();
								
								//폼 페이지에서 전송된 요청 파라미터가 일반 데이터라면
								if(item.isFormField()){
									//파라미터의 이름
									String name = item.getFieldName();
									//파라미터의 값
									String value = item.getString("UTF-8");
									out.println(name + "=" + value + "<br/>");
								}else {//파일 일 때
									//요청 파라미터의 이름
									String fileFieldName = item.getFieldName();
									//파일명
									String fileName = item.getName();
									//파일 MimeType
									String contentType = item.getContentType();
									//파일 크기
									long fileSize = item.getSize();
									
									//업로드한 이미지 파일을 write하기 위한 파일 객체 생성
									File file = new File(path+"/"+fileName);
									
									//Max사이즈보다 업로드 한 파일 크기가 클 때
									if(maxSize < fileSize){
										out.println("파일 크기를 초과!! <br/>");
									}else {
										item.write(file); //파일 복사
										out.println("--------------- <br/>");
										out.println("파라미터 이름 : "+fileFieldName + "<br/>");
										out.println("저장 파일명 : "+fileName + "<br/>");
										out.println("파일 콘텐츠타입 : "+contentType+ "<br/>");
										out.println("파일 크기 : "+fileSize + "<br/>");
									}
								}
							}
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