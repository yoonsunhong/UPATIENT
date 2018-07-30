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
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <!-- 화면보기 비율과 관련된 viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1,0, user-scalable=no, target-densityDpi=medium-dpi" />
  <!-- 상단바 색상 변경 -->
  <!-- <meta name="theme-color" content="#0ab4ed"> --> 
  <title> U-patient > 설정 > 언어설정  </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
  <script type="text/javascript">
  $(document).ready(function () {
		
		//설정된 언어에 따른 라디오박스 선택
		$('input:radio[name=lang]:input[value='+lang+']').attr("checked", true);

	});
  
  //메인 페이지 이동
  function goMain(){
  	location.href='/main.do?lang='+lang;	
  }
  

  //언어설정 저장
  function fnSave(){
  	var charLang = "";
  	charLang = $(":input:radio[name=lang]:checked").val();
  	alert(msgSave);	//저장되었습니다.
  	alert("retailtech://language="+charLang);
  	location.href='/main.do?lang='+charLang;
  }
  </script>
 </head>

 <body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="language_mst">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="langSetting"/></h1>
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
			<div>
				<div class="clear">
					<div class="area">
						<h3 class="f_l"><spring:message code="korean"/></h3>
						<label class="f_r switch">
							<input type="radio" name="lang" value="ko" checked>
							<span class="slider round"></span>
						</label>
					</div>
				</div>
 				<div class="clear">
					<div class="area">
						<h3 class="f_l"><spring:message code="english"/></h3>
						<label class="f_r switch">
							<input type="radio" name="lang" value="en">
							<span class="slider round"></span>
						</label>
					</div>
				</div>
				<div class="clear">
					<div class="area">
						<h3 class="f_l"><spring:message code="czechia"/></h3>
						<label class="f_r switch">
							<input type="radio" name="lang" value="cz">
							<span class="slider round"></span>
						</label>
					</div>
				</div>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
		<!--==================== 푸터 영역 시작 ====================-->
		<footer id="footer">
			<div class="area">
				<button type="button" class="btn_style1 btn_inquery" onclick="fnSave()"><spring:message code="btnSave"/></button>
			</div>		
		</footer>
		<!--==================== //푸터 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>
