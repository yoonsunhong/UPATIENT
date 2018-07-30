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

<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="사이트에 대한 설명">
<meta name="keywords" content="키워드, 태그">
<title>리테일 JAVA 프레임워크</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<!--[if lt IE 9]>
<script src="/resources/js/html5shiv.js"></script>
<script src="/resources/js/IE9.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/ie8.css">
<![endif]-->


<script type="text/javascript" src="/resources/js/jquery-1.7.1.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/resources/js/jquery.cookie.js" charset="utf-8"></script>    
<script type="text/javascript">
		//다국어 디폴트 언어 전역변수
		var languge = 'ko';
		$(document).ready(function () { 
			
			
		});
		 
		
		
		//로그아웃 처리
		function logOut()
		{ 
			window.location = "/logout.do";
			//window.location = '/';
		}
		
		
		/**
		*다국어 설정 변경을 위한 Script 시작
		**/
		//다국어 설정
		function changeLocation(location){
				Language = location.value;
				if(location.value !=""){
					window.location ="/location/changLang.do?lang="+location.value;	
				}
		} 
		
		//다국어 셀렉트 박스 셀렉트
		/* $(document).ready(function () {
			//alert(getQuerystring('lang'));
			if(typeof getQuerystring('lang') == 'undefined'){
				//최초 로그인시 디폴트 랭귀지 설정
				$("#selectLanguage").val(languge);	
			}else{
				//사용자가 선택 했을때 변경
				$("#selectLanguage").val(getQuerystring('lang'));
			}
		});
		
		//url의 파라미터 값 가지고 오기
		function getQuerystring(paramName){

			var _tempUrl = window.location.search.substring(1); //url에서 처음부터 '?'까지 삭제
			var _tempArray = _tempUrl.split('&'); // '&'을 기준으로 분리하기
			
			for(var i = 0; _tempArray.length; i++) {
				if(typeof _tempArray[i] != 'undefined'){
					var _keyValuePair = _tempArray[i].split('='); // '=' 을 기준으로 분리하기
					
					if(_keyValuePair[0] == paramName){ // _keyValuePair[0] : 파라미터 명
						// _keyValuePair[1] : 파라미터 값
						
						return _keyValuePair[1];
					}	
				}else{
					return _keyValuePair[1];
				}
			}
		} */
		//alert(getQuerystring('lang'));
		/**
		*다국어 설정 변경을 위한 Script 끝
		**/
</script>
<%!

HttpServletRequest req;
HttpServletResponse res;


/** session 에 저장된 환경정보 반환 */
SessionModel getEnv() {
	return CommonUtil.getEnv(req.getSession());
}
%>
<%
this.req = request;
this.res = response;
%>

<%
	 String redirectURL = "/login.do";
	 if(getEnv().getUSER_NM() == null){
	 	response.sendRedirect(redirectURL);	
	 }
%>
 
</head>
<body>
<div id="wrap">
    <!-- header -->
    <header id="header">
		<h1 class="logo">
			<a href="#">
				리테일테크 JAVA 프레임 워크
			</a>
		</h1>
		<div class="top_log">
			<span><%=getEnv().getUSER_NM() %>님 환영합니다.  </span> 
			<a href="javascript:logOut();" class="btn_head">로그아웃</a>	 
			<!-- <span>다국어</span>
			<select id="selectLanguage" onchange="changeLocation(this)">
				<option value="">선택</option>Tabs_Onload('mainContents','mainContents.do');
				<option value="ko">한국어</option>
				<option value="en">English</option>
			</select> -->
		</div>
		<nav id="gnb"> 
			<ul>
				<!-- 대 메뉴 출력 -->
			</ul>
		</nav>
    </header> 
	<hr>
    <!-- //header -->
    <!-- container -->
    <div id="container">
		<!-- snb -->
		<nav id="snb">
				<div id="menuLeft">
				<div id="getMiddleMenuDiv"></div>
				<button type="button" class="btn_fold" onclick="javascript:togle();">메뉴 접기/펼치기</button> 
		</nav>
		
		<div id="content" style="width:100%">	
			<div id="tabs" class="tab_st1" style="width:100%">
				<!-- 상단 탭 -->
				<ul id="main_tab" style="width:100%"></ul>
				<!-- //상단 탭 -->
				<!-- 탭 내용 -->
				<div id="frame_box" class="frame_box">
					<iframe id="frame0"  class="DivHide" style="height:700px" src="" title="frame0"></iframe>
					<iframe id="frame1"  class="DivHide" style="height:700px" src="" title="frame1"></iframe>
					<iframe id="frame2"  class="DivHide" style="height:700px" src="" title="frame2"></iframe>
					<iframe id="frame3"  class="DivHide" style="height:700px" src="" title="frame3"></iframe>
					<iframe id="frame4"  class="DivHide" style="height:700px" src="" title="frame4"></iframe>
					<iframe id="frame5"  class="DivHide" style="height:700px" src="" title="frame5"></iframe>
					<iframe id="frame6"  class="DivHide" style="height:700px" src="" title="frame6"></iframe>
					<iframe id="frame7"  class="DivHide" style="height:700px" src="" title="frame7"></iframe>
					<iframe id="frame8"  class="DivHide" style="height:700px" src="" title="frame8"></iframe>
				</div>
			</div>
			<!-- //탭 내용 -->
		</div>
		<!-- //Content : 본문 영역 -->
    </div>
    <!-- //container -->
    
    <!-- 탭기능을 위한 셋팅 시작-->
    <input type="hidden" id="hdnFrameCount" value="0" title="" />
    <input type="hidden" id="hdnMenuCode" value="0" title=""/>   <!-- 첫로딩시 왼쪽트리에 뿌려줄 대메뉴의 라지코드  -->
    <input type="hidden" id="hdnActiveId" title="" />
    <!-- 탭기능을 위한 셋팅 끝-->
    
    <!-- footer -->
	<hr>
    <footer id="footer">
        <nav class="f_menu">
            <ul>
                <li><a href="#" class="f1">fmenu</a></li>
                <li><a href="#" class="f2">fmenu</a></li>
                <li><a href="#" class="f3">fmenu</a></li>
                <li><a href="#" class="f4">fmenu</a></li>
                <li><a href="#" class="f5">fmenu</a></li>
             </ul>
        </nav>
        <address>주소</address>
        <p class="copy">Copyright(C) RETILTECH. All rights reserved.</p>
		<a href="#header" class="btn_top">위로 이동</a>
    </footer>
</div>
</body>

</html>

<%-- <% 
	HttpSession Session = request.getSession(true);  
	Session.setAttribute("ID", getEnv().getUserId());  
	
	//버튼권한 세션에 설정
	Session.setAttribute("AUTH_SEARCH", getEnv().getAUTH_SEARCH());
	Session.setAttribute("AUTH_NEW", getEnv().getAUTH_NEW());
	Session.setAttribute("AUTH_SAVE", getEnv().getAUTH_SAVE());
	Session.setAttribute("AUTH_DELETE", getEnv().getAUTH_DELETE());
	Session.setAttribute("AUTH_EXCEL_DOWN", getEnv().getAUTH_EXCEL_DOWN());
	Session.setAttribute("AUTH_EXCEL_UPLOAD", getEnv().getAUTH_EXCEL_UPLOAD());
	Session.setAttribute("AUTH_PRINT", getEnv().getAUTH_PRINT());
	Session.setAttribute("AUTH_SUBMIT", getEnv().getAUTH_SUBMIT());
	Session.setAttribute("AUTH_CREATE", getEnv().getAUTH_CREATE());
	Session.setAttribute("CORP_CODE", getEnv().getCORP_CODE());
	Session.setAttribute("ROLE_ID", getEnv().getROLE_ID());
	Session.setAttribute("STR_CODE", getEnv().getSTR_CODE());
	Session.setAttribute("STR_NAME", getEnv().getSTR_NAME()); 
	
	/* Session.setAttribute("GROUP_CODE", getEnv().getGROUP_CODE));
	Session.setAttribute("DEPT_CODE", getEnv().getDEPT_CODE());
	Session.setAttribute("POSITION", getEnv().getPOSITION());
	Session.setAttribute("EMP_DUTY", getEnv().getEMP_DUTY());
	Session.setAttribute("SYS_CODE", getEnv().getSYS_CODE());
	Session.setAttribute("LIMIT_LEVEL", getEnv().getLIMIT_LEVEL()); */
	
%>

<script> var SSAD = "${sessionScope.AUTH_DELETE}";</script>
<script> var SSSC = "${sessionScope.STR_CODE}";</script> --%>