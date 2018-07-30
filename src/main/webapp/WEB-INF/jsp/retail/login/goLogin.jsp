<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="retail.common.BaseEnv"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>
<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <meta name="google-signin-client_id" content="407310271718-68c2bclm9ntl5gg7li8aksf0gboncvmd.apps.googleusercontent.com">
  <title> U-patient > 로그인 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/login.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/jquery-1.7.1.min.js"></script>
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/jquery.cookie.js" ></script>
  <!-- 화면보기 비율과 관련된 viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1,0, user-scalable=no, target-densityDpi=medium-dpi" />
  <!-- 상단바 색상 변경 -->
  <!-- <meta name="theme-color" content="#0ab4ed"> -->
  <!-- 바탕화면에 내가 디자인한 아이콘 생성 -->
  <!-- <link rel="apple-touch-icon-precomposed" href="" /> --><!-- 아이폰 안드로이드폰 모두 가능 -->
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
 </head>
<script type="text/javascript">

$(function(){
    //최초 쿠키에 login_id라는 쿠키값이 존재하면
    var PATIENT_CD = $.cookie('PATIENT_CD');
    var USER_PW = $.cookie('USER_PW');
    
    if(PATIENT_CD != undefined && USER_PW != undefined ) {
        //아이디에 쿠키값을 담는다
        $("#PATIENT_CD").val(PATIENT_CD);
        $("#USER_PW").val(USER_PW);
        //아이디저장 체크박스 체크를 해놓는다
        $("#AUTOLOGIN").prop("checked",true);
    }
    
    //get 파라메터 lang값 추출
	var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);
	
	//언어 전역변수 설정
	setLang(param);
})

//언어 셋팅
function setLang(val){
	lang = val;
}

//측정시기 조회 API JSON RETURN
function getRoleCodeApi(){
	jQuery.ajax({
	    type:"POST",
	    url:"/getRoleCodeApi.do", 
	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	    //data:loadData,
	    async:false,
	    success : function(data) {
			/* for(var i = 0; i < data.length; i++){
				alert(data);
		   	} */
	    	alert(data);
	    },
	    complete : function(data) {
	    },
	    error : function(xhr, status, error) {
	    	//CommonJs.alertErrorStatus(xhr.status, error);
	    }
	});
}



//사용자정보 가지고오기 API(사용자코드, 몸무게)
function getUserInfo(){
	alert("retailtech://getUserInfo?PATIENT_CD=&WEIGHT=&WEIGHT_UNIT=");
}



//버전 넣기
function setVersion(val){
	//version = val;
	$.cookie('version', val);
}
	
//로그인 요청 시작
function login(){
	   
	if( $("#PATIENT_CD").val()  == "" )
	{
		alert(msgLogin3);	//아이디를 입력하세요.
		 $("#PATIENT_CD").focus();
		return;
	}
	if( $("#USER_PW").val()  == "" )
	{
		alert(msgLogin4);	//암호를 입력하세요.
		 $("#USER_PW").focus();
		return;
	}
	
	<!--로그인 정보 확인-->
	var form = document.getElementById("form1");
	var setUrl = "";
	$.ajax({
		url:"/login.do" ,
		type:"POST",
		datatype:"json",
		data:{ PATIENT_CD: $("#PATIENT_CD").val()   ,  USER_PW :$("#USER_PW").val() },
		beforeSend : function(xhr) {} ,
		success:function(data,textStatus){  
			if(data.records == "0" ) { 
				alert(msgLogin5);	//아이디 암호를 확인하세요.
				location.replace("/"); 
			} else {
				
				//자동로그인 체크되어있으면 쿠키저장
	            if($("#AUTOLOGIN").prop("checked")) {
	                $.cookie('PATIENT_CD', $("#PATIENT_CD").val());
	                $.cookie('USER_PW', $("#USER_PW").val());
	            //자동로그인 미체크면 쿠키에 정보가 있던간에 삭제
	            } else {
	                $.removeCookie("PATIENT_CD");
	                $.removeCookie("USER_PW");
	            }
	            //location.href='/main.do?PATIENT_CD='+$("#PATIENT_CD").val()+'&USER_PW='+$("#USER_PW").val();
	             setUrl = "/main.do?lang=" + lang;
        		$("#form1").attr("action", setUrl);
	            $( "#form1" ).submit();
			} 
		},
		error:function(x,e){
		}	 
	}); 
}

//엔터입력시 로그인 요청 
function search_check(){
	login();
}
	
//회원가입 이동
function signup(){
	location.href='/signup.do?lang='+lang;
}	

//비밀번호찾기 화면으로 이동
function finePassMst(){
	location.href='/finePassMst.do?lang='+lang;
}	

//언어설정 이동
function goLang(){
	location.href='/noLoginlanguageMst.do?lang='+lang;
}	

</script>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://apis.google.com/js/api:client.js"></script>
<script type="text/javascript" src="/resources/js/sns_login_google.js"></script>
<script type="text/javascript" src="/resources/js/sns_login_facebook.js"></script>
<script type="text/javascript">
function onSignIn(googleUser) {
	var profile = googleUser.getBasicProfile();
	console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	console.log('Name: ' + profile.getName());
	console.log('Image URL: ' + profile.getImageUrl());
	console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	alert(profile.getName());
}

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function () {
		console.log('User signed out.');
	});
}

</script>
 <body>
	<!--==================== 로그인 전체 영역 시작 ====================-->
	<div id="wrap" class="p_r">
		<!--==================== 로그인 섹션 영역 시작 ====================-->
		<div class="login_bg">
			<section id="content" class="p_a">
			<form name="form1" id="form1" action="/main.do" method="post"> 
				<!--
				<a id="google_join_btn" href="javascript:void(0);">구글로 로그인</a> 
				<div class="g-signin2" data-onsuccess="onSignIn"></div>
				<a href="#" onclick="signOut();">Sign out</a>
				 -->
				<div class="login_area">
					<div class="input_id">
						<label for="" class="">고객코드 입력</label><input type="text" name="PATIENT_CD" id = "PATIENT_CD" placeholder="<spring:message code="customerCode"/>" maxlength="15"  value=""/>
					</div>
					<div class="input_pwd">
						<label for="" class="">비밀번호 입력</label><input type="password" name="USER_PW" id="USER_PW"  placeholder="<spring:message code="passWord"/>" onKeyDown="javascript:if (event.keyCode == 13) search_check();" value=""/>
					</div>
					<div class="auto_login"><input type="checkbox" id=AUTOLOGIN><label for="AUTOLOGIN"><spring:message code="autoLogin"/></label></div>
					<button type="button" class="btn_style1" onClick="login();"><spring:message code="login"/></button>
					<div class="login_btm">
						<p><span><spring:message code="msgLogin1"/></span><span><a href="#" onclick="finePassMst()"><spring:message code="findPass"/></a></span></p>
						<p><span><spring:message code="msgLogin2"/></span><span><a href="#" onclick="signup()"><spring:message code="signUp"/></a></span><span><a href="#" onclick="goLang()"><spring:message code="settingLang"/></a></span></p>
					</div>
				</div>
			</form>
			</section>
		</div>
		<!--==================== //로그인 섹션 영역 끝 ====================-->
	</div>
	<!--==================== //로그인 전체 영역 끝 ====================-->
 </body>
</html>
