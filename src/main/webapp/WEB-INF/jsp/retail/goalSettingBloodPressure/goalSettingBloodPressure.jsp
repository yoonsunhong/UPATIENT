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
  <title> 설정 | 목표설정 | 혈압 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/loader.js"></script><!-- 차트 -->  
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
</head>
<body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="goal_set_bp">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit">목표설정</h1>
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
					<div class="tab_btn area clear">
						<ul>
							<li><a href="#" onclick="goalSettingBloodGlucose()">혈당</a></li>
							<li class="on"><a href="#" onClick="goalSettingBloodPressure()">혈압</a></li>
							<li><a href="#" onClick="goalSettingBodyMassIndex()">BMI</a></li>
						</ul>
					</div>
				</div>
				<div class="tab_cnt area">
					<div class="goal_cnt">
						<div>
							<span>수축기</span>
							<input type="text" id="" name="" placeholder="0">~<input type="text" id="" name="" placeholder="0">
							<span>mmHg</span>
						</div>
						<div>
							<span>이완기</span>
							<input type="text" id="" name="" placeholder="0">~<input type="text" id="" name="" placeholder="0">
							<span>mmHg</span>
						</div>						
					</div>
					<div class="goal_img">
						<h2 class="tit">참고용 그래프</h2>
						<div>
							<img src="/resources/images/bg/goal_BP.png" alt="혈압 목표 설정 참고용 이미지">
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