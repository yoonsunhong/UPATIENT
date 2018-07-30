<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>
<!-- 세션정보 제거 -->
<% session.invalidate(); %>
<script type="text/javascript" src="/resources/js/jquery-1.7.1.min.js"></script>                        
<script type="text/javascript" src="/resources/js/jquery.cookie.js" ></script>
  
<script>

$(document).ready(function () {
	//쿠키 제거
	$.removeCookie("PATIENT_CD");
	$.removeCookie("USER_PW");
	//get 파라메터 lang값 추출
	var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);

	//언어 전역변수 설정
	setLang(param);
	
	alert("로그아웃 되었습니다.");
	location.href="goLogin.do?lang="+lang;                                    // 로그아웃 페이지로 이동
});

//언어 셋팅
function setLang(val){
	lang = val;
}



</script>
          