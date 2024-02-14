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
						<div class="table-responsive">
							<caption>앞(SEM PC 자리)</caption>
							<table width="100%" border="1" style="text-align:center; font-size:24px;">
								<tr width="100%" height="80px">
									<td width="10%">민경선</td>
									<td width="10%">성이수</td>
									<td width="10%">이명문</td>
									<td width="10%">조재훈</td>
									<td width="20%"></td>
									<td width="10%">최윤서</td>
									<td width="10%">안희재</td>
									<td width="10%">권예은</td>
									<td width="10%"></td>
								</tr>
								<tr height="80px">
									<td>신하림</td>
									<td>이영주</td>
									<td>김나혜</td>
									<td>김영상</td>
									<td></td>
									<td>최현명</td>
									<td>최소희</td>
									<td>홍진영</td>
									<td>임민혁</td>
								</tr>
								<tr height="80px">
									<td>김다애</td>
									<td>송현지</td>
									<td>김현태</td>
									<td>김태원</td>
									<td></td>
									<td>이수진</td>
									<td>선민수</td>
									<td>서어진</td>
									<td></td>
								</tr>
								<tr height="80px">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td>백지은</td>
									<td>최현흠</td>
									<td></td>
									<td></td>
								</tr>
							</table>
							<hr/>
							<div class="progress" style="height: 40px;">
								<div class="progress-bar progress-bar-striped" id="myBar" role="progressbar" aria-valuenow="60" aria-valuemin="0"
									aria-valuemax="100" style="width: 1px; height: 40px;">
									<span class="sr-only">60% Complete</span>
								</div>
							</div>
							<br/>
							<h4 id="txt"></h4>
							<button type="button" onclick="SeatMoveEvent()" style="padding:12px;border:none;cursor:pointer;">출력</button>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script>

let target = null;
let value = 0;

function updateProgressbar(){
	$('#myBar').attr('aria-valuenow', value).css('width', value + '%').text(value+'% Complete')
}

function targetUpdate() {
	updateProgressbar(value);
	value++;
	
	if(target != null){
		$(target).css('background-color', 'white');
	}
	//nodeList = 유사배열
	let tdArr = [...$('td')]; //유사배열을 배열로 바꿔주는 전개연산자
	let rnd = parseInt(Math.random() * tdArr.length); //배열의 길이만큼 곱해주고 랜덤으로 0~끝까지
	
	if(value == 101){ //프로그래스바랑 맞추려고 101로 설정. 100에서 끝나는데 1프로가 부족해서 101로
		while(true){ //빈 곳 안나오게
			rnd = parseInt(Math.random() * tdArr.length);
			if($(tdArr[rnd]).text()){ //이름이 있을 때
				break;
			}
		}
		
		$('#txt').text($(tdArr[rnd]).text()); //출력위에 출력
		
	}
		$(tdArr[rnd]).css('background-color', 'yellow');
		target = $(tdArr[rnd]);
	
// 	let tds = docutment.getElementByTagName('td');
// 	//유사배열을 배열로 변경해주는 메서드랑 방법 두가지 중 하나를 선택해서 할거에요
// 	console.log(tds);
// 	let tdArr = Array.from(tds)
// 	let rnd = parseInt(Math.random()*tdArr.length);
// 	$([...tds][rnd]).css('background-color', 'yellow')
	
// 	console.log(tdArr);
	
// 	tdArr[rnd].style.background = 'yellow';
}


function SeatMoveEvent(){
	init();
	//0.1초마다 반복적으로 실행
	//()를 붙이고 안붙이고? -> ()붙이면 에러. ()를 붙이고 싶으면 전체를 문자열
	let interval = setInterval(targetUpdate, 100); 
	
	//10초동안 함수 진행
	setTimeout(function(){
		clearInterval(interval);
	},10100);
	
}

//value때문에 프로그래스바가 진행됨
//value가 0이니까 progress bar진행도도 0으로
function init(){
	value = 0;
	$('#myBar').attr('aria-valuenow', value).css('width', value+'%').text(value+'% Complete');

}
</script>
</html>