<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                        <h1 class="page-title">JSP 표준 태그 라이브러리</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH17</li>
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
                          문제) 306호 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
                          
                          [출력예시]
                          '김'씨 성을 가진 사람 : 00 명
                          '박'씨 성을 가진 사람 : 00 명
                          '이'씨 성을 가진 사람 : 00 명
                          ...
                          ...
                          
                          JSTL을 적극 활용하여 문제를 풀어주세요!
                        -->
                  <%
                     String[] nameArr = {"유재석","홍길동","홍길순","정형돈","하동훈","정준하","길성준","박명수","노홍철"};
                  %>
                  <!-- 스크립틀릿 태그를 통해 넣은 이름들을 names 변수로 설정(JSTL) -->
                  <c:set value="<%=nameArr %>" var="names"/>
                  
                  <!-- 각 성씨마다 증가할 카운트 변수 -->
                  <c:set value="0" var="hongCnt"/>
                  <c:set value="0" var="yuCnt"/>
                  <c:set value="0" var="jeongCnt"/>
                  <c:set value="0" var="haCnt"/>
                  <c:set value="0" var="parkCnt"/>
                  <c:set value="0" var="gilCnt"/>
                  <c:set value="0" var="noCnt"/>
                  
                  <c:forEach items="${names }" var="nm" varStatus="stat">
                     <c:choose>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '홍' }">
                           <c:set var="hongCnt" value="${hongCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '유' }">
                           <c:set var="yuCnt" value="${yuCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '정' }">
                           <c:set var="jeongCnt" value="${jeongCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '하' }">
                           <c:set var="haCnt" value="${haCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '박' }">
                           <c:set var="parkCnt" value="${parkCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '길' }">
                           <c:set var="gilCnt" value="${gilCnt + 1 }"/>
                        </c:when>
                        <c:when test="${fn:substring(names[stat.index], 0, 1) == '노' }">
                           <c:set var="noCnt" value="${noCnt + 1 }"/>
                        </c:when>
                     </c:choose>
                     <p>[${stat.count }] 당신의 이름은 ? ${nm }</p>
                     <font color="red">'${fn:substring(names[stat.index], 0, 1) }'씨 Count 증가!</font>
                     <table class="table table-bordered">
                        <tr>
                           <td>홍</td>
                           <td>유</td>
                           <td>정</td>
                           <td>하</td>
                           <td>박</td>
                           <td>길</td>
                           <td>노</td>
                        </tr>
                        <tr>
                           <td>${hongCnt }</td>
                           <td>${yuCnt }</td>
                           <td>${jeongCnt }</td>
                           <td>${haCnt }</td>
                           <td>${parkCnt }</td>
                           <td>${gilCnt }</td>
                           <td>${noCnt }</td>
                        </tr>
                     </table>
                  </c:forEach>
                  
                  <h5>최종 집계 결과!</h5>
                  <table class="table table-bordered">
                     <tr>
                        <td>홍</td>
                        <td>유</td>
                        <td>정</td>
                        <td>하</td>
                        <td>박</td>
                        <td>길</td>
                        <td>노</td>
                     </tr>
                     <tr>
                        <td>${hongCnt }</td>
                        <td>${yuCnt }</td>
                        <td>${jeongCnt }</td>
                        <td>${haCnt }</td>
                        <td>${parkCnt }</td>
                        <td>${gilCnt }</td>
                        <td>${noCnt }</td>
                     </tr>
                  </table>
                  
                  <h5>두번째 방법(Map과 JSTL을 이용하여)</h5>
                  <%
                     List<String> list = new ArrayList<String>();
                     String[] names = {"유재석","홍길동","홍길순","정형돈","하동훈","정준하","길성준","박명수","노홍철"};
                     for(int i = 0; i < names.length; i++){
                        list.add(names[i]);
                     }
                     
                     Map<String, Integer> map = new HashMap<>();
                  %>
                  <!-- 성을 key로 성에 따른 카운트 값을 value로 설정할 map 셋팅 -->
                  <c:set value="<%=map %>" var="map"/>
                  
                  <!-- list안에 들어있는 이름들 전부 출력 -->
                  <c:forEach items="<%=list %>" var="item">
                     <c:out value="${item }"/>&nbsp;
                  </c:forEach>
                  <br/><hr/>
                  
                  <!-- 
                     list의 이름을 하나씩 꺼내서 substring 함수를 이용하여 성을 만든 후,
                     map의 키로 넣어 값이 있는지 여부를 체크한다.
                     값이 없으면 map의성을 키로 값은 1로 초기 셋팅한다.
                     여부를 체크 후 값이 있으면 해당 성을 키로, 해당 성의 값의 +1한 값을 추가로 넣는다.
                   -->
                  <c:forEach items="<%=list %>" var="item">
                     <c:choose>
                        <c:when test="${map.get(fn:substring(item,0,1)) == null }">
                           <c:out value="${map.put(fn:substring(item,0,1), 1) }"/>
                        </c:when>
                        <c:otherwise>
                           <c:out value="${map.put(fn:substring(item,0,1), 
                           map.get(fn:substring(item,0,1)) + 1) }"/>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  <br/>
                  
                  <c:forEach items="<%=map.keySet() %>" var="item">
                     <c:out value="'${item}'씨 성을 가진 사람 수 : ${map.get(item) }명"/><br/>
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

