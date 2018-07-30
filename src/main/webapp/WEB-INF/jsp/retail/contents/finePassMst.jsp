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
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>
<%-- <%@include file="/WEB-INF/jsp/retail/main/common.jsp" %>  --%>
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <!-- 화면보기 비율과 관련된 viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1,0, user-scalable=no, target-densityDpi=medium-dpi" />
  <!-- 상단바 색상 변경 -->
  <!-- <meta name="theme-color" content="#0ab4ed"> -->    
  <title> U-patient > 사용자등록 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/jquery-1.7.1.min.js"></script>  
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/datetime.js"></script>
  <link rel="stylesheet" href="/resources/css/mobiscroll-1.6.min.css" /> 
  <script type="text/javascript" src="/resources/js/mobiscroll-1.6.js" ></script> 
  <script type="text/javascript">
      $(document).ready(function () {
          $('.calendar').scroller('destroy').scroller({ 
          	width: 60.66666666666667,
       		theme: 'default'
       	 });
      });	
  </script>  
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
  <script type="text/javascript">
	// date
    $(function () {
    	$(document).ready(function () {
            $('.calendar').scroller('destroy').scroller({ 
            	width: 60.66666666666667,
         		theme: 'default'
         	 });
        });	
    	
      	//get 파라메터 lang값 추출
   		var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);
   	
	   	//언어 전역변수 설정
	   	setLang(param);
    });

	//로그인 페이지 이동
	function goLogin(){
		location.href='/goLogin.do?lang='+lang;	
	}	
	
	//언어 셋팅
	function setLang(val){
		lang = val;
	}
	
  </script>
 </head>

 <body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="find_pass_mst">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_back" onclick="goLogin()">뒤로가기</button>
					<h1 class="tit">비밀번호 찾기</h1>
				</div>
			</div>
		</header>
		<!--==================== //헤더 영역 끝 ====================-->
		<!--==================== 섹션 영역 시작 ====================-->
		<section id="content">
			<div class="area">
				<form action="">
					<p><label for="">고객코드(ID)</label><input type="text" /></p>
					<p><label for="">생년월일</label><input type="text" id="calendar" class="calendar" /></p>
					<p><label for="">이메일</label><input type="email" /></p>
				</form>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
		<!--==================== 푸터 영역 시작 ====================-->
		<footer id="footer">
			<div class="area">
				<p>사용자 등록 시 입력한 이메일로 <br>임시 비밀번호를 발송합니다.</p>
				<button type="button" class="btn_style1 btn_inquery">확인</button>
			</div>
		</footer>
		<!--==================== //푸터 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>
