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
  <title> 혈압 | 수동입력 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript">
  	var p_MEASURE_SEQ = '${map.MEASURE_SEQ}';
	var p_MEASURE_DT = '${map.MEASURE_DT}';
	var p_MEASURE_TIME = '${map.MEASURE_TIME}';
	var p_SYSTOLE_MEASURE_VALUE = '${map.SYSTOLE_MEASURE_VALUE}';
	var p_DIASTOLE_MEASURE_VALUE = '${map.DIASTOLE_MEASURE_VALUE}';
	var p_HEART_RATE_MEASURE_VALUE = '${map.HEART_RATE_MEASURE_VALUE}';
	var p_SYSTOLE_BP_STATE = '${map.SYSTOLE_BP_STATE}';
	var p_DIASTOLE_BP_STATE = '${map.DIASTOLE_BP_STATE}';
		
  	$(document).ready(function (){
  		
  		$( "#SYSTOLE_MEASURE_VALUE" ).focus(function() {
  		  	if($("#SYSTOLE_MEASURE_VALUE").val()==0){
  		  		$("#SYSTOLE_MEASURE_VALUE").val('');
  		  	}
  		});
  		
  		$( "#DIASTOLE_MEASURE_VALUE" ).focus(function() {
  		  	if($("#DIASTOLE_MEASURE_VALUE").val()==0){
  		  		$("#DIASTOLE_MEASURE_VALUE").val('');
  		  	}
  		});
  		
  		$( "#HEART_RATE_MEASURE_VALUE" ).focus(function() {
  		  	if($("#HEART_RATE_MEASURE_VALUE").val()==0){
  		  		$("#HEART_RATE_MEASURE_VALUE").val('');
  		  	}
  		});
  		
  		var lsToDate = "";
		var IsToTime = "" 
		
		if(p_MEASURE_SEQ=="") {
				
			//오늘날짜 셋팅
		   	lsToDate = new CommDateManager().getDate("yyyy-mm-dd");
		   	var beforeMonthDate = new CommDateManager().before(0, 0, 7).getDate("yyyy-mm-dd");
		   	//현재시간 셋팅
		   	var now = new Date();
		   	var IsToTimeHH = now.getHours();
		   	var IsToTimeMM = now.getMinutes();
		   	
		    if(IsToTimeHH.toString().length==1){
	            IsToTimeHH = "0" + IsToTimeHH;
	         }
		   	
		   	if(IsToTimeMM.toString().length==1){
		   		IsToTimeMM = "0" + IsToTimeMM;
		   	}
		   	
		   	IsToTime = IsToTimeHH +":"+IsToTimeMM;
			   	
			$('#MEASURE_DT').val(lsToDate);
			$('#MEASURE_TIME').val(IsToTime);
			
		}else{
			
			lsToDate = p_MEASURE_DT.substring(0, 4) + "-" + p_MEASURE_DT.substring(4, 6) + "-" + p_MEASURE_DT.substring(6, 8)
			
			if(p_MEASURE_TIME!=""){
				IsToTime = p_MEASURE_TIME.substring(0, 2) + ":" + p_MEASURE_TIME.substring(2, 4)
			}else{
				IsToTime = "";
			}
			//alert(lsToDate); 
			
			$('#MEASURE_SEQ').val(p_MEASURE_SEQ);
			$('#SYSTOLE_MEASURE_VALUE').val(p_SYSTOLE_MEASURE_VALUE);
			$('#DIASTOLE_MEASURE_VALUE').val(p_DIASTOLE_MEASURE_VALUE);
			$('#HEART_RATE_MEASURE_VALUE').val(p_HEART_RATE_MEASURE_VALUE);
			$('#MEASURE_DT').val(lsToDate);
			$('#MEASURE_TIME').val(IsToTime);
			
			 //달력모듈 불러온 데이터로 셋팅
			  var requestDate = $("#MEASURE_DT").val();

		      if(requestDate != ""){
		          requestDate = new Date(requestDate);
		          $("#MEASURE_DT").scroller('setDate', requestDate, true);
		      } 			
		}
  	});
  	
  //저장
	function fnSave(){
		
	  var insertCheck = 0;
		
		if($("#SYSTOLE_MEASURE_VALUE").val() == "" || $("#SYSTOLE_MEASURE_VALUE").val() == 0){
			alert(bpInputAlert1);
			$("#SYSTOLE_MEASURE_VALUE").focus();
			return;
		}
		
		if($("#DIASTOLE_MEASURE_VALUE").val() == "" || $("#DIASTOLE_MEASURE_VALUE").val() == 0){
			alert(bpInputAlert2);
			$("#DIASTOLE_MEASURE_VALUE").focus();
			return;
		}
		
		if($("#HEART_RATE_MEASURE_VALUE").val() == "" || $("#HEART_RATE_MEASURE_VALUE").val() == 0){
			alert(bpInputAlert3);
			$("#HEART_RATE_MEASURE_VALUE").focus();
			return;
		}
		
		if($("#MEASURE_DT").val() == ""){
			alert(bsInputAlert2);
			$("#MEASURE_DT").focus();
			return;
		}
		
		if($("#MEASURE_TIME").val() == ""){
			alert(bsInputAlert3);
			$("#MEASURE_TIME").focus();
			return;
		}
		
		var loadData = $("#inputForm").serializeAllObject();
		
		if(p_MEASURE_SEQ=="0" || p_MEASURE_SEQ==""){
			//혈압수동입력(select, insert)
			jQuery.ajax({
			    type:"POST",
			    async: false, //아직스 동기로 변경 
			    data:loadData,
			    url:"/insertBpMeasureInfo.do",
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
		   		alert(bsInputAlert4);
		   		location.href='/bloodPressureTimeView.do?lang='+lang;	
		   	}else{
		   		alert(bsInputAlert5);
		   		return;
		   	}	
		}else{
			//혈압업데이트(select, insert)
			jQuery.ajax({
			    type:"POST",
			    async: false, //아직스 동기로 변경 
			    data:loadData,
			    url:"/updateBpMeasureInfo.do",
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
		   		alert(bsInputAlert6);
		   		location.href='/bloodPressureTimeView.do?lang='+lang;	
		   	}else{
		   		alert(bsInputAlert7);
		   		return;
		   	}	
		}
  }
  
	//메인 이동
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
	<div id="wrap" class="pre_mst">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="manuallyMeasurement"/><!-- 수동입력 --></h1>
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
			<div class="area">
				<form action="" id="inputForm">
				<input type="hidden" id="MEASURE_SEQ" name="MEASURE_SEQ" value=""/>
					<div class="figure_input">
						<div class="bg">
							<div class="">
								<div>
									<p><spring:message code="systole"/><!-- 수축기 --></p>
									<p><input type="number" placeholder="0" id="SYSTOLE_MEASURE_VALUE" name="SYSTOLE_MEASURE_VALUE" maxlength="3" oninput="maxLengthCheck(this)"/></p>
									<p>mmHg</p>
								</div>		
								<div>
									<p><spring:message code="diastole"/><!-- 이완기 --></p>
									<p><input type="number" placeholder="0" id="DIASTOLE_MEASURE_VALUE" name="DIASTOLE_MEASURE_VALUE" maxlength="3" oninput="maxLengthCheck(this)"/></p>
									<p>mmHg</p>
								</div>		
								<div>
									<p><spring:message code="heartRate"/><!-- 심박수 --></p>
									<p><input type="number" placeholder="0" id="HEART_RATE_MEASURE_VALUE" name="HEART_RATE_MEASURE_VALUE" maxlength="3" oninput="maxLengthCheck(this)"/></p>
									<p>Beats/Min</p>
								</div>													
							</div>
						</div>
					</div>
					<div class="wid">
						<p class="wid50"><label for="" class="label_date">달력</label><input type="text" id="MEASURE_DT" name="MEASURE_DT" class="calendar"/></p>
						<p class="wid50"><label for="" class="label_time">시간</label><input type="text" id="MEASURE_TIME" name="MEASURE_TIME" class="time"/></p>
					</div>		
				</form>
			</div>	
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
		<!--==================== 푸터 영역 시작 ====================-->
		<footer id="footer">
			<div class="area">
				<button type="button" class="btn_style1 btn_inquery" onclick="fnSave()"><spring:message code="btnSave"/><!-- 저장 --></button>
			</div>
		</footer>
		<!--==================== //푸터 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>