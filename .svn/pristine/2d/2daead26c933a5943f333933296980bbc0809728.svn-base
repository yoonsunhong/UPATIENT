<%@ page language="java"   contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="retail.common.BaseEnv" %>
<%@page import="retail.common.CommonUtil" %>
<%@page import="retail.common.SessionModel" %>
<%@page import ="java.util.List" %>
<%@page import ="java.util.HashMap" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="java.util.List" %>
<%@page import ="retail.main.service.MainVO" %>
<%@include file="/WEB-INF/jsp/retail/main/common.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <!-- 화면보기 비율과 관련된 viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1,0, user-scalable=no, target-densityDpi=medium-dpi" />
  <!-- 상단바 색상 변경 -->
  <!-- <meta name="theme-color" content="#0ab4ed"> -->
  <title> U-patient > 혈당 > 혈당리포트 > 예후진단 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/loader.js"></script><!-- 차트 -->
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
  <script type="text/javascript">
 
	$(document).ready(function (){
		$(".bg_report .clear h4 + span").width($("#tab2 .tab_cnt div").width()-72);
	});
  
	// 차트
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart1);
	google.charts.setOnLoadCallback(drawChart2);

	/* chart1 */
	function drawChart1() {
		var data = google.visualization.arrayToDataTable([
    		['Year', '공복'],
  			['11-01',  100],
  			['11-02',  370],
  			['11-03',  130],
  			['11-04',  230],
  			['11-05',  130],
  			['11-06',  130],
  			['11-07',  130],
  			['11-08',  550]
		]);

		var options = {
			curveType: 'function',
			//height: 480,
			legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
					color: "#7b7b7b"
				},
			},
			colors: ['#f14555'], /* 라인 색상 */
			fontSize: '9',
			pointSize: 5, /* 포인트 크기 */
			pointShape: 'circle', /* 포인트 모양 */
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
			},
			chartArea: {
				top: "10%",
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/
			},
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart1'));
		chart.draw(data, options);

		/*
		var hideSal = document.getElementById("hideSales");
		hideSal.onclick = function() {
		view = new google.visualization.DataView(data);
		view.hideColumns([1]); 
		view.hideColumns([2]); 
		view.hideColumns([3]); 
		chart.draw(view, options);
		}
		var hideExp = document.getElementById("hideExpenses");
		hideExp.onclick = function(){
		view = new google.visualization.DataView(data);


		chart.draw(view, options);
		}	
		*/
		function resizeChart() {
			chart.draw(data, options);
		}
		if (document.addEventListener) {
		window.addEventListener('resize', resizeChart);
		}
		else if (document.attachEvent) {
		window.attachEvent('onresize', resizeChart);
		}
		else {
		window.resize = resizeChart;
		}
	}

	/* chart2 */
	function drawChart2() {
		var data = google.visualization.arrayToDataTable([
   			['Year', '공복'],
 			['11-01',  110],
 			['11-02',  115],
 			['11-03',  118],
 			['11-04',  110],
 			['11-05',  108],
 			['11-06',  100],
 			['11-07',  96],
 			['11-08',  93]
		]);

		var options = {
			curveType: 'function',
			//height: 480,
			legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
					color: "#7b7b7b"
				},
			},
			colors: ['#09b6ee'], /* 라인 색상 */
			fontSize: '9',
			pointSize: 5, /* 포인트 크기 */
			pointShape: 'circle', /* 포인트 모양 */
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
			},
			chartArea: {
				top: "10%",
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/
			},
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart2'));
		chart.draw(data, options);

		/*
		var hideSal = document.getElementById("hideSales");
		hideSal.onclick = function() {
		view = new google.visualization.DataView(data);
		view.hideColumns([1]); 
		view.hideColumns([2]); 
		view.hideColumns([3]); 
		chart.draw(view, options);
		}
		var hideExp = document.getElementById("hideExpenses");
		hideExp.onclick = function(){
		view = new google.visualization.DataView(data);


		chart.draw(view, options);
		}	
		*/
		function resizeChart() {
			chart.draw(data, options);
		}
		if (document.addEventListener) {
		window.addEventListener('resize', resizeChart);
		}
		else if (document.attachEvent) {
		window.attachEvent('onresize', resizeChart);
		}
		else {
		window.resize = resizeChart;
		}
	}
	
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do';	
	}
	
	//혈당리포트 > 타임라인 화면으로 이동
	function bloodGlucoseTimeView(){
		location.href='/bloodGlucoseTimeView.do';
	}	

	//혈당리포트 > 혈당트랜드 화면으로 이동
	function bloodGlucoseTrandView(){
		location.href='/bloodGlucoseTrandView.do';
	}	

	//혈당리포트 > 예후진단 화면으로 이동
	function bloodGlucoseReportView(){
		location.href='/bloodGlucoseReportView.do';
	}		
  </script>
 </head>

 <body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="bg_report">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit">혈당리포트</h1>
					<button type="button" class="btn_style2 btn_setup" onClick="setupBtn();">설정</button>
				</div>
			</div>		
		</header>
		<!--==================== //헤더 영역 끝 ====================-->
		<!--==================== 메뉴 영역 시작 ====================-->
		<!-- 왼쪽 메뉴 시작 -->
		<%@include file="/WEB-INF/jsp/retail/main/leftMenu.jsp" %>
		<!-- 왼쪽 메뉴 끝 -->
		<!-- 오른쪽 메뉴 시작 -->
		<%@include file="/WEB-INF/jsp/retail/main/rightMenu.jsp" %>
		<!-- 오른쪽 메뉴 끝 -->
		<!--==================== //메뉴 영역 끝 ====================-->
		<section id="content">
			<div class="tab clear" id="tab2">
				<div class="tab_btn_bg">
					<ul class="tab_btn area clear">
						<li><a href="#" onClick="bloodGlucoseTimeView()">타임라인</a></li>
						<li><a href="#" onClick="bloodGlucoseTrandView()">혈당트랜드</a></li>
						<li class="on"><a href="#" onClick="bloodGlucoseReportView()">예후진단</a></li>
					</ul>
				</div>
				<div class="tab_cnt">	
					<div class="area">
						<ul>
							<li><h4>질병<span> : 당뇨</span></h4></li>
							<li><h4>이름<span> : 홍길동</span></h4></li>
							<li><h4>진단<span> : 당뇨병 고위험군</span></h4></li>
							<li><h4>날짜<span> : 2017-09-25 </span></h4></li>
							<li class="clear"><h4 class="f_l">설명<span> :&nbsp;</span></h4><span class="f_l">현재 공복혈당이 118mg/dL로써 당뇨의 고위험군입니다.</span></li>
							<li class="clear"><h4 class="f_l">예후<span> :&nbsp;</span></h4><span class="f_l">방치 시는 아래 그림 1, 투약 치료 시 아래 그림 2와 같은 예후가 예상됩니다.</span></li>
						</ul>
					</div>
					<div>
						<h3 class="tit">방치시 (그림1) - 혈당 그래프</h3>
						<div id="chart1"></div>
					</div>
					<div>
						<h3 class="tit">투약치료시 (그림2) - 혈당 그래프</h3>
						<div id="chart2"></div>
					</div>
					<div>
						<h3 class="tit">진단결과</h3>
						<div class="area">
							<ul>
								<li><h4>내원권고<span> : 3개월에 한번씩(당뇨병 고위험군)</span></h4></li>
								<li><h4>내원목적<span> : 귀하의 혈당치(glucose)가 고위험군으로써 정밀진단이 필요합니다. 3개월후 내원하여 당화혈색소 검사가 필요합니다.<br>예) 혈액 검사시  eAG(mmol/L)검사 항목 값이 7.0보다 클 경우, 기타 및 상세불명의 눈 합병증을 동반한 인슐린 -비의존 당뇨병으로 진단되며 안과 검진을 필요로 합니다.</span></h4></li>
								<li><h4>투약권고<span> : 하루 3번 식후 30분에 투약합니다.</span></h4></li>
								<li><h4>디바이스측정요구<span> : 귀하는 고위험 군으로써 하루 1번 이상 측정을 권장합니다.</span></h4></li>
							</ul>
							<div>
								<img src="/resources/images/bg/report_view.jpg" alt="혈당측정기와 채혈부위">
							</div>
						</div>							
					</div>
				</div>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
		<!--==================== 푸터 영역 시작 ====================-->
		<footer id="footer"></footer>
		<!--==================== //푸터 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>

