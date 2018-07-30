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
  <title> 설정 | 목표설정 | 혈당 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/loader.js"></script><!-- 차트 -->
<script type="text/javascript">
  
  	$(document).ready(function (){
  		
  		 jQuery.ajax({
 	 	    type:"POST",
 	 	    url:"/selectBsGoalInfo.do",
 	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
 	 	    async:false,
 	 	    success : function(data) {
 	 	    	
 	 			$("#BS_BEFORE_MEAL_FROM").val(data.BS_BEFORE_MEAL_FROM);
 	 			$("#BS_BEFORE_MEAL_TO").val(data.BS_BEFORE_MEAL_TO);
 	 			$("#BS_AFTER_MEAL_FROM").val(data.BS_AFTER_MEAL_FROM);
 	 			$("#BS_AFTER_MEAL_TO").val(data.BS_AFTER_MEAL_TO);
 	 			
 	 	    },
 	 	    complete : function(data) {
 	 	    	
 	 	    },
 	 	    error : function(xhr, status, error) {
 	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
 	 	    }
 	 	});
  	});
	
  //저장
	function fnSave(){
		var insertCheck = 0;
		
		if($("#BS_BEFORE_MEAL_FROM").val() == ""){
			alert(bsGoalAlert1);
			$("#BS_BEFORE_MEAL_FROM").focus();
			return;
		}
		
		if($("#BS_BEFORE_MEAL_TO").val() == ""){
			alert(bsGoalAlert1);
			$("#BS_BEFORE_MEAL_TO").focus();
			return;
		}
		
		if($("#BS_AFTER_MEAL_FROM").val() == ""){
			alert(bsGoalAlert2);
			$("#BS_AFTER_MEAL_FROM").focus();
			return;
		}
		
		if($("#BS_AFTER_MEAL_TO").val() == ""){
			alert(bsGoalAlert2);
			$("#BS_AFTER_MEAL_TO").focus();
			return;
		}
		var loadData = $("#inputForm").serializeAllObject();
		
		//건강정보입력
		jQuery.ajax({
		    type:"POST",
		    async: false, //아직스 동기로 변경 
		    data:loadData,
		    url:"/updateBsGoalInfo.do",
		    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨 
		    success : function(data) {
				//alert(data.CNT);
		    	insertCheck = data.RESULT; 
		    },
		    complete : function(data) {
		    },
		    error : function(xhr, status, error) {
		    }
		});
	   	
	   	if(insertCheck == 1){
	   		alert(msgSave);
	   		location.href='/goalSettingBloodGlucose.do?lang='+lang;
	   	}else{
	   		alert(msgSaveError);
	   		return;
	   	}	
	}
  	
  	//메인 페이지 이동
	function goMain(){
		location.href='/main.do?lang='+lang;	
  	}
  </script>    
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
</head>
<body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="goal_set_bg">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="goalSetting"/><!--목표설정--></h1>
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
							<li class="on"><a href="#" onclick="goalSettingBloodGlucose()"><spring:message code="bloodGlucose"/><!--혈당--></a></li>
							<li><a href="#" onClick="goalSettingBloodPressure()"><spring:message code="bloodPressure"/><!--혈압--></a></li>
							<li><a href="#" onClick="goalSettingBodyMassIndex()"><spring:message code="bmi"/><!--BMI--></a></li>
						</ul>
					</div>
				</div>
				<div class="tab_cnt area">
				<form action="" id="inputForm">
					<div class="goal_cnt">
						<div>
							<span><spring:message code="beforeMeal"/><!--식사전 (공복)--></span>
							<input type="text" id="BS_BEFORE_MEAL_FROM" name="BS_BEFORE_MEAL_FROM" placeholder="0" value="">~<input type="text" id="BS_BEFORE_MEAL_TO" name="BS_BEFORE_MEAL_TO" placeholder="0" value="">
							<span>mg/dl</span>
						</div>
						<div>
							<span><spring:message code="afterMeal"/><!--식사후 (취침전)--></span>
							<input type="text" id="BS_AFTER_MEAL_FROM" name="BS_AFTER_MEAL_FROM" placeholder="0" value="">~<input type="text" id="BS_AFTER_MEAL_TO" name="BS_AFTER_MEAL_TO" placeholder="0" value="">
							<span>mg/dl</span>
						</div>						
					</div>
					<button type="button" class="btn_style1 btn_inquery" onclick="fnSave()"><spring:message code="btnSave"/><!-- 저장 --></button>
					<div class="goal_img">
						<h2 class="tit">기준 정보</h2>
						<div>
							<img src="/resources/images/bg/goal_BG.png" alt="혈당 목표 설정 참고용 이미지">
						</div>
					</div>
				</form>
				</div>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>