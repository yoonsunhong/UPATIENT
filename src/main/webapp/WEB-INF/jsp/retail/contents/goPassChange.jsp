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
  <title> U-patient > 비밀번호 변경 </title>
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
	  
	  /* jQuery.ajax({
	 	    type:"POST",
	 	    url:"/selectMyInfo.do",
	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	 	    async:false,
	 	    success : function(data) {
	 	    	
	 	    	//최근 측정 정보
	 			//$("#BS_MEASURE_VALUE").text(data.BS_MEASURE_VALUE);
	 			
	 	    },
	 	    complete : function(data) {
	 	    	
	 	    },
	 	    error : function(xhr, status, error) {
	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
	 	    }
	 	}); */
	  
  });
  
  
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do';	
	}	
	
	//저장
	function fnSave(){
		var insertCheck = 0;
		
		if($("#USER_PW").val() == ""){
			alert("기존 비밀번호를 입력해 주세요.");
			$("#USER_PW").focus();
			return;
		}
		
		if($("#NEW_USER_PW1").val() == ""){
			alert("변경 비밀번호를 입력해 주세요.");
			$("#NEW_USER_PW1").focus();
			return;
		}
		
		if($("#NEW_USER_PW2").val() == ""){
			alert("변경 비밀번호 확인을 입력해 주세요.");
			$("#NEW_USER_PW2").focus();
			return;
		}
		
		if($("#NEW_USER_PW1").val() != $("#NEW_USER_PW2").val()){
			alert("변경 비밀번호와 변경 비밀번호 확인이 틀립니다.");
			$("#NEW_USER_PW1").focus();
			return;
		}
		
		//비밀번호 유효성 검사
		if(!chkPwd( $.trim($('#NEW_USER_PW1').val()))){ 
			 alert('변경 비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)');    
			 $('#NEW_USER_PW1').val('');
			 $('#NEW_USER_PW2').val('');
			 $('#NEW_USER_PW1').focus(); 
			 return;
		}
		
		var loadData = $("#inputForm").serializeAllObject();
		
		jQuery.ajax({
		    type:"POST",
		    async: false, //아직스 동기로 변경 
		    data:loadData,
		    url:"/changeMyPasswd.do",
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
	   		alert("비밀번호가 정상적으로 변경되었습니다.");
	   		location.href='/goPassChange.do';	
	   	}else{
	   		alert("비밀번호 변경중 오류가 발생했습니다. 관리자에게 문의하세요.");
	   		return;
	   	}	
		
	}
	
	
	//비밀번호 체크 : 숫자, 영문 포함 6~20자 이내
	function chkPwd(str){
		 var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		 if(!reg_pwd.test(str)){
		  return false;
		 }
		 return true;
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
					<h1 class="tit">비밀번호 변경</h1>
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
					<p><label for="">기존 비밀번호</label><input type="password" maxlength="20" id="USER_PW" name="USER_PW"></p>
					<p><label for="">변경 비밀번호</label><input type="password" maxlength="20" id="NEW_USER_PW1" name="NEW_USER_PW1"/></p>
					<p class="t_p">영어,숫자가 포함된 6~20자리로 입력해 주세요.</p>
					<p><label for="">변경 비밀번호 확인</label><input type="password" maxlength="20" id="NEW_USER_PW2" name="NEW_USER_PW2"/></p>
				</form>
			</div>
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
