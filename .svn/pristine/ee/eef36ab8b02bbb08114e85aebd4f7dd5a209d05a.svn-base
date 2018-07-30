<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="retail.common.BaseEnv"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
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
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>     
<script type="text/javascript">

$(function(){
	setStartApp("en");
})

//언어 셋팅
function setStartApp(val){
	lang = val;
	
	//최초 쿠키에 login_id라는 쿠키값이 존재하면
    var PATIENT_CD = $.cookie('PATIENT_CD');
    var USER_PW = $.cookie('USER_PW');
    var setUrl = "";
    if(PATIENT_CD != undefined && USER_PW != undefined ) {
        //아이디에 쿠키값을 담는다
        $("#PATIENT_CD").val(PATIENT_CD);
        $("#USER_PW").val(USER_PW);
        //아이디저장 체크박스 체크를 해놓는다
        //location.href='/main.do?PATIENT_CD='+PATIENT_CD+'&USER_PW='+USER_PW;
        setUrl = "/goMain.do?lang=" + lang;
        $("#form1").attr("action", setUrl);
        $( "#form1" ).submit();
    }else{
    	location.href='/goLogin.do?lang='+lang;
    }
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


</script>
 <body>
 <form name="form1" id="form1" action="/goMain.do" method="post"> 
 <input type="hidden" id="PATIENT_CD" name="PATIENT_CD"/>
 <input type="hidden" id="USER_PW" name="USER_PW"/>
 </form>
 </body>
</html>
