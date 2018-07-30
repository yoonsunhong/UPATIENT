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
  <title> U-patient > 설정 > 관리항목설정 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
  <script type="text/javascript">
	$(document).ready(function (){
		
		$(".health_management #content .input3 .f_r").width(($(".health_management #content .input3").width()-88));
		$(".health_management #content .input3 input").width(($(".health_management #content .input3 .f_r").width()-96)/3);

		$(".health_management #content .input2 .f_r").width(($(".health_management #content .input2").width()-72));
		$(".health_management #content .input2 input").width(($(".health_management #content .input2 .f_r").width()-75)/2);
		
		var veryhighRight = parseInt($(".blood_state li.veryhigh").css('right'))+($(".health_management #content .input3").width()-130)/3;
		$(".blood_state li.high").css({right:veryhighRight+'px'});
		
		var postValue ={};   
		
		jQuery.ajax({
		    type:"POST",
		    url:"/selectHealthMgtInfo.do",
		    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		    data:postValue,
		    async:false,
		    success : function(data) {
		    	
		    	$.each(data.rows, function(key, value) {   
		    	     
		    		if(this.cell[0]=="Y"){
		    			$('#BS_CHECK').attr("checked", true);
		    		}else{
		    			$('#BS_CHECK').attr("checked", false);
		    		}
		    			
		    		if(this.cell[1]=="Y"){
		    			$('#BP_CHECK').attr("checked", true);
		    		}else{
		    			$('#BP_CHECK').attr("checked", false);
		    		}
		    		
		    		if(this.cell[2]=="Y"){
		    			$('#BMI_CHECK').attr("checked", true);
		    		}else{
		    			$('#BMI_CHECK').attr("checked", false);
		    		}
		    		
		    		$('#FASTING_VALUE_1').val(this.cell[3]);
		    		$('#FASTING_VALUE_2').val(this.cell[4]);
		    		$('#FASTING_VALUE_3').val(this.cell[5]);
		    		$('#AFTER_MEAL_VALUE_1').val(this.cell[6]);
		    		$('#AFTER_MEAL_VALUE_2').val(this.cell[7]);
		    		$('#AFTER_MEAL_VALUE_3').val(this.cell[8]);
		    		$('#SYSTOLE_FROM').val(this.cell[9]);
		    		$('#SYSTOLE_TO').val(this.cell[10]);
		    		$('#DIASTOLE_FROM').val(this.cell[11]);
		    		$('#DIASTOLE_TO').val(this.cell[12]);
		    		$('#HEART_RATE_FROM').val(this.cell[13]);
		    		$('#HEART_RATE_TO').val(this.cell[14]);
		    		$('#WEIGHT_FROM').val(this.cell[15]);
		    		$('#WEIGHT_TO').val(this.cell[16]);
		    		$('#MUSCLE_QY_FROM').val(this.cell[17]);
		    		$('#MUSCLE_QY_TO').val(this.cell[18]);
		    		$('#FAT_QY_FROM').val(this.cell[19]);
		    		$('#FAT_QY_TO').val(this.cell[20]);
		    		
					
		    	});
		    },
		    complete : function(data) {
		          // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
		          // TODO
		    },
		    error : function(xhr, status, error) {
//		          alert("에러발생111");
		    }
		});
	});
	
	
	function fnChk(pNumber){
		
		var bs_chk_obj = document.getElementsByName("BS_CHECK");
		var bp_chk_obj = document.getElementsByName("BP_CHECK");
		var bmi_chk_obj = document.getElementsByName("BMI_CHECK");
		
		if(bs_chk_obj[0].checked==false & bp_chk_obj[0].checked==false & bmi_chk_obj[0].checked==false){
			alert("관리항목은 최소한 1개를 선택하셔야 합니다.");

			if(pNumber=='0'){
				bs_chk_obj[0].checked=true;
			}else if(pNumber=='1'){
				bp_chk_obj[0].checked=true;
			}else if(pNumber=='2'){
				bmi_chk_obj[0].checked=true;
			}
			return;
		}
		
	}
	
	function fnSave(){
		var insertCheck = 0;
		
		if($("#BS_CHECK").is(":checked")){
			if($('#FASTING_VALUE_1').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
			if($('#FASTING_VALUE_2').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
			if($('#FASTING_VALUE_3').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
			if($('#AFTER_MEAL_VALUE_1').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
			if($('#AFTER_MEAL_VALUE_2').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
			if($('#AFTER_MEAL_VALUE_3').val()==""){
				alert("혈당 관리 수치를 입력하세요.");
				$("#FASTING_VALUE_1").focus();
				return;	
			}
		}
		
		if($("#BP_CHECK").is(":checked")){
			if($('#SYSTOLE_FROM').val()==""){
				alert("혈압(수축기) 관리 수치를 입력하세요.");
				$("#SYSTOLE_FROM").focus();
				return;	
			}
			if($('#SYSTOLE_TO').val()==""){
				alert("혈압(수축기) 관리 수치를 입력하세요.");
				$("#SYSTOLE_TO").focus();
				return;	
			}
			if($('#DIASTOLE_FROM').val()==""){
				alert("혈압(이완기) 관리 수치를 입력하세요.");
				$("#DIASTOLE_FROM").focus();
				return;	
			}
			if($('#DIASTOLE_TO').val()==""){
				alert("혈압(이완기) 관리 수치를 입력하세요.");
				$("#DIASTOLE_TO").focus();
				return;	
			}
			if($('#HEART_RATE_FROM').val()==""){
				alert("혈압(심박수) 관리 수치를 입력하세요.");
				$("#HEART_RATE_FROM").focus();
				return;	
			}
			if($('#HEART_RATE_TO').val()==""){
				alert("혈압(심박수) 관리 수치를 입력하세요.");
				$("#HEART_RATE_TO").focus();
				return;	
			}
		}
		
		if($("#BMI_CHECK").is(":checked")){
			if($('#WEIGHT_FROM').val()==""){
				alert("BMI(체중) 관리 수치를 입력하세요.");
				$("#WEIGHT_FROM").focus();
				return;	
			}
			if($('#WEIGHT_TO').val()==""){
				alert("BMI(체중) 관리 수치를 입력하세요.");
				$("#WEIGHT_TO").focus();
				return;	
			}
			if($('#MUSCLE_QY_FROM').val()==""){
				alert("BMI(근육량) 관리 수치를 입력하세요.");
				$("#MUSCLE_QY_FROM").focus();
				return;	
			}
			if($('#MUSCLE_QY_TO').val()==""){
				alert("BMI(근육량) 관리 수치를 입력하세요.");
				$("#MUSCLE_QY_TO").focus();
				return;	
			}
			if($('#FAT_QY_FROM').val()==""){
				alert("BMI(체지방량) 관리 수치를 입력하세요.");
				$("#FAT_QY_FROM").focus();
				return;	
			}
			if($('#FAT_QY_TO').val()==""){
				alert("BMI(체지방량) 관리 수치를 입력하세요.");
				$("#FAT_QY_TO").focus();
				return;	
			}
		}
		
		
		
		var loadData = $("#inputForm").serializeAllObject();
		
		jQuery.ajax({
		    type:"POST",
		    async: false, //아직스 동기로 변경 
		    data:loadData,
		    url:"/updateHealthMgtInfo.do",
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
	   	
	   	if(insertCheck == -1){
	   		alert("관리항목설정이 등록되었습니다.");
	   		location.href='/healthManagement.do';	
	   	}else{
	   		alert("관리항목설정 등록중 오류가 발생했습니다. 관리자에게 문의하세요.");
	   		return;
	   	}	
	}


	
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do?lang='+lang;	
	}	
  </script>
 </head>

 <body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="health_management">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit">관리항목설정</h1>
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
			<form action="" id="inputForm">
				<div>
					<div class="tit">
						<div class="area clear">
							<h3 class="f_l">혈당</h3>
							<label class="f_r switch">
								<input type="checkbox" id="BS_CHECK" name="BS_CHECK" value="Y" checked onclick="fnChk('0')">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<div class="area">
						<div class="input3 clear">
							<label for="" class="f_l">식사전/취침전</label>
							<div class="f_r">
								<input type="number" id="FASTING_VALUE_1" name="FASTING_VALUE_1"/><span>~</span><input type="number" id="FASTING_VALUE_2" name="FASTING_VALUE_2" /><span>~</span><input type="number" id="FASTING_VALUE_3" name="FASTING_VALUE_3" /><span>mg/dL</span>
							</div>
						</div>
						<div class="input3 clear">
							<label for="">식사후</label>
							<div class="f_r">
								<input type="number" id="AFTER_MEAL_VALUE_1" name="AFTER_MEAL_VALUE_1"/><span>~</span><input type="number" id="AFTER_MEAL_VALUE_2" name="AFTER_MEAL_VALUE_2"/><span>~</span><input type="number" id="AFTER_MEAL_VALUE_3" name="AFTER_MEAL_VALUE_3"/><span>mg/dL</span>
							</div>
						</div>		
						<div class="blood_state">
							<ul>
								<li class="low"><p>낮음</p></li>
								<li class="high"><p>높음</p></li>
								<li class="veryhigh"><p>매우높음</p></li>
							</ul>
						</div>
					</div>
				</div>
				<div>
					<div class="tit">
						<div class="area clear">
							<h3 class="f_l">혈압</h3>
							<label class="f_r switch">
								<input type="checkbox" id="BP_CHECK" name="BP_CHECK" value="Y" onclick="fnChk('1')">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<div class="area">
						<div class="input2 clear">
							<label for="">수축기</label>
							<div class="f_r">
								<input type="number" id="SYSTOLE_FROM" name="SYSTOLE_FROM"/><span>~</span><input type="number" id="SYSTOLE_TO" name="SYSTOLE_TO"/><span>mmHg</span>
							</div>
						</div>
						<div class="input2 clear">
							<label for="">이완기</label>
							<div class="f_r">
								<input type="number" id="DIASTOLE_FROM" name="DIASTOLE_FROM"/><span>~</span><input type="number" id="DIASTOLE_TO" name="DIASTOLE_TO"/><span>mmHg</span>
							</div>
						</div>		
						<div class="input2 clear">
							<label for="">심박수</label>
							<div class="f_r">
								<input type="number" id="HEART_RATE_FROM" name="HEART_RATE_FROM"/><span>~</span><input type="number" id="HEART_RATE_TO" name="HEART_RATE_TO"/><span>bpm</span>
							</div>
						</div>								
					</div>
				</div>
				<div>
					<div class="tit">
						<div class="area clear">
							<h3 class="f_l">BMI</h3>
							<label class="f_r switch">
								<input type="checkbox" id="BMI_CHECK" name="BMI_CHECK" value="Y" onclick="fnChk('2')">
								<span class="slider round"></span>
							</label>
						</div>
					</div>
					<div class="area">
						<div class="input2 clear">
							<label for="">체중</label>
							<div class="f_r">
								<input type="number" id="WEIGHT_FROM" name="WEIGHT_FROM"/><span>~</span><input type="number" id="WEIGHT_TO" name="WEIGHT_TO"/><span>kg</span>
							</div>
						</div>		
						<div class="input2 clear">
							<label for="">근육량</label>
							<div class="f_r">
								<input type="number" id="MUSCLE_QY_FROM" name="MUSCLE_QY_FROM"/><span>~</span><input type="number" id="MUSCLE_QY_TO" name="MUSCLE_QY_TO"/><span>kg</span>
							</div>
						</div>								
						<div class="input2 clear">
							<label for="">체지방량</label>
							<div class="f_r">
								<input type="number" id="FAT_QY_FROM" name="FAT_QY_FROM"/><span>~</span><input type="number" id="FAT_QY_TO" name="FAT_QY_TO"/><span>kg</span>
							</div>
						</div>		
					</div>
				</div>
			</form>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
		<!--==================== 푸터 영역 시작 ====================-->
		<footer id="footer">
			<div class="area">
				<button type="button" class="btn_style1 btn_inquery" onclick="fnSave()">저장</button>
			</div>		
		</footer>
		<!--==================== //푸터 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>
