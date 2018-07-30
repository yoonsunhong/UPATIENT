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
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densityDpi=medium-dpi" />
  <!-- 상단바 색상 변경 -->
  <meta name="theme-color" content="#0ab4ed">
  <title> 활동 | 리포트 | 타임라인 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
</head>
 <body>
  <!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="act_time">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit">활동리포트</h1>
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
		<!--==================== 섹션 영역 시작 ====================-->
		<section id="content">
			<div class="tab clear" id="tab2">
				<div class="tab_btn_bg">
					<ul class="tab_btn area clear">
						<li class="on"><a href="#" onClick="activityTimeView()"><spring:message code="timeLine"/><!-- 타임라인 --></a></li>
						<li><a href="#" onClick="activityTrandView()"><spring:message code="trends"/><!-- 트랜드 --></a></li>
					</ul>
				</div>
				<div class="tab_cnt">
					<div>
						<form action="" id="" name="" method="post">
							<div class="date_search area clear">
								<div>
									<p class=""><label for="" class="label_date">달력</label><input type="text" id="MEASURE_DT_FROM" name="MEASURE_DT_FROM" class="calendar"/></p>
									<p>~</p>
									<p class=""><label for="" class="label_date">달력</label><input type="text" id="MEASURE_DT_TO" name="MEASURE_DT_TO" class="calendar"/></p>
								</div>
								<div><button type="button" class="btn_style2 btn_search" onclick="fnSearch('DESC')">검색영역</button></div>
							</div>
							<div class="date_select area">
								<button type="button" id="SORT_UP" NAME="SORT_UP" class="up on" onclick="fnSearch('DESC')"><spring:message code="dateReverseSort"/><!-- 일자역순 --></button>	
								<button type="button" id="SORT_DOWN" NAME="SORT_DOWN" class="down" onclick="fnSearch('ASC')"><spring:message code="dateforwardsort"/><!-- 일자정순 --></button>
							</div>						
						</form>		
						<div class="act_timeline">
							<div>
							 	<h3 class="tit">2017년 08월 15일</h3>
								<ul>
									<li>
										<div class="area">
											<p>
												<span>distance</span>
												<strong><strong>32.5</strong><span>km</span></strong>
											</p>
											<p>
												<span>step count</span>
												<strong><strong>1,890</strong><span>step</span></strong>
											</p>
											<p><span>calorie</span><strong><strong>1,890</strong><span>kcal</span></strong></p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>	
									<li>
										<div class="area">
											<p>
												<span>거리</span>
												<strong><strong>32.5</strong><span>km</span></strong>
											</p>
											<p>
												<span>걸음수</span>
												<strong><strong>1,890</strong><span>step</span></strong>
											</p>
											<p><span>칼로리</span><strong><strong>1,890</strong><span>kcal</span></strong></p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>																			
								</ul>								
							</div>
							<div id="">
							 	<h3 class="tit">2017년 08월 14일</h3>
								<ul>
									<li>
										<div class="area">
											<p>
												<span>거리</span>
												<strong><strong>32.5</strong><span>km</span></strong>
											</p>
											<p>
												<span>걸음수</span>
												<strong><strong>1,890</strong><span>step</span></strong>
											</p>
											<p>
												<span>칼로리</span>
												<strong><strong>890</strong><span>kcal</span></strong>
											</p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>																			
								</ul>								
							</div>
							<div id="">
							 	<h3 class="tit">2017년 08월 14일</h3>
								<ul>
									<li>
										<div class="area">
											<p>
												<span>거리</span>
												<strong><strong>32.5</strong><span>km</span></strong>
											</p>
											<p>
												<span>걸음수</span>
												<strong><strong>1,890</strong><span>step</span></strong>
											</p>
											<p>
												<span>칼로리</span>
												<strong><strong>1,890</strong><span>kcal</span></strong>
											</p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>																			
								</ul>								
							</div>																						
						</div>
					</div>		
				</div>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>