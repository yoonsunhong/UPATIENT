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
  <title> U-patient > 사용자정보 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
<script type="text/javascript">
  $(document).ready(function(){
	  
	  jQuery.ajax({
	 	    type:"POST",
	 	    url:"/selectMyInfo.do",
	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	 	    async:false,
	 	    success : function(data) {
	 	    	
	 			$("#USER_NM").val(data.USER_NM);
	 			$("#HSPTL_NM").val(data.HSPTL_NM);
	 			$("#PATIENT_CD").val(data.PATIENT_CD);
	 			$("#BRTHDY").val(data.BRTHDY);
	 			$("#EMAIL").val(data.EMAIL);
	 			$("#TEL_NO").val(data.TEL_NO);
	 			
	 	    },
	 	    complete : function(data) {
	 	    	
	 	    },
	 	    error : function(xhr, status, error) {
	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
	 	    }
	 	});
	  
	  
	  //달력모듈 불러온 데이터로 셋팅
	  var requestDate = $("#BRTHDY").val();

      if(requestDate != ""){
          requestDate = new Date(requestDate);
          $("#BRTHDY").scroller('setDate', requestDate, true);
      } 

	  
  });
  
  
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do?lang='+lang;	
	}	
	
	//저장
	function fnSave(){
		var memberCheck = 0;

		if($("#USER_NM").val() == ""){
			alert(userInfoAlert1);
			$("#USER_NM").focus();
			return;
		}
		
		if($("#BRTHDY").val() == ""){
			alert(userInfoAlert8);
			$("#BRTHDY").focus();
			return;
		}
		
		if($("#EMAIL").val() == ""){
			alert(userInfoAlert9);
			$("#EMAIL").focus();
			return;
		}
		
		var email = $("#EMAIL").val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if(exptext.test(email)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert(userInfoAlert10);
			document.addjoin.email.focus();
			return false;
		}
		
		if($("#TEL_NO").val() == ""){
			alert(userInfoAlert11);
			$("#TEL_NO").focus();
			return;
		}
		
		var number = /[^0-9]/; //숫자만 허용
		var form = document.form;
		   
	   	if ( $("#TEL_NO").val().search(number)!=-1 || $("#TEL_NO").val().length == 0 ){
	        alert(userInfoAlert12);
	        $("#TEL_NO").val('');
	        form.numberText.focus();
	        return;
	   	}
	   	
		var loadData = $("#inputForm").serializeAllObject(); 
	   	
	   	jQuery.ajax({
	 	    type:"POST",
	 	    url:"/updateMyInfo.do",
	 	    data:loadData ,
	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	 	    async:false,
	 	    success : function(data) {
	 	    	//alert(data.RESULT);
	 	    	if(data.RESULT == 1){
	 	    		alert(userInfoAlert16);
	 	    		location.href='/userInfoMst.do?lang='+lang;
	 	    		return;
	 	    	}else{
	 	    		alert(userInfoAlert17);
	 	    		return;
	 	    	}
	 	    },
	 	    complete : function(data) {
	 	    	
	 	    },
	 	    error : function(xhr, status, error) {
	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
	 	    }
	 	});
	}
	

	//숫자만 입력 체크
	function numberCheck()
	{
	   var number = /[^0-9]/; //숫자만 허용
	   var form = document.form;
	   
	   if ( form.numberText.value.search(number)!=-1 || form.numberText.value.length == 0 ){
	        alert(userInfoAlert18);
	        form.numberText.focus();
	        return;
	   }
	}
</script>
  
  
 </head>

 <body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="user_info_mst">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="userProfile"/><!-- 사용자정보 --></h1>
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
					<p><label for=""><spring:message code="name"/><!-- 이름 --></label><input type="text" value="" id="USER_NM" name="USER_NM" maxlength="25"/></p>
					<p><label for=""><spring:message code="hospital"/><!-- 병원 --></label><input type="text" id="HSPTL_NM" name="HSPTL_NM" readonly="readonly" style="background-color: #eee"/></p>
					<p><label for=""><spring:message code="customerCode"/><!-- 고객코드(ID) --></label><input type="text" readonly="readonly" id="PATIENT_CD" name="PATIENT_CD" style="background-color: #eee"/></p>
					<p class="t_p"><spring:message code="userInfoMsg3"/><!-- 병원과 고객코드(ID)는 수정 할 수 없습니다. --></p>
					<p><label for=""><spring:message code="birthday"/><!-- 생년월일 --></label><input type="text" class="calendar" id="BRTHDY" name="BRTHDY" /></p>
					<p><label for=""><spring:message code="email"/><!-- 이메일 --></label><input type="email" id="EMAIL" name="EMAIL" maxlength="50"/></p>
					<p><label for=""><spring:message code="mobileNumber"/><!-- 연락처 --></label><input type="number" placeholder="<spring:message code='numberOnly'/>" id="TEL_NO" name="TEL_NO" maxlength="15" oninput="maxLengthCheck(this)"/></p>
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
