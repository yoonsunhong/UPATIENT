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
  <meta name="theme-color" content="#0ab4ed">
  <title> U-patient > 혈당 > 혈당리포트 > 타임라인 </title>
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

	$(document).ready(function (){
		loadingStart();
		
		$(".state").width(($(".date_cnt ul li").width()-$(".date_cnt .figure").width()-23));		// 상태 영역 너비
		$(".date_cnt").css({'background-position-x':$('.date_cnt').width()*0.05 + 27+'px' , 'background-position-y': '0px'});		// 혈당수치 배경 위치
		$(".date_search > div:last-child").width($(".date_search").width()-$(".date_search > div:first-child").width()-10)
		
		//오늘날짜 셋팅
	   	var lsToDate = new CommDateManager().getDate("yyyy-mm-dd");
	   	//오늘-7 셋팅
	   	var beforeMonthDate = new CommDateManager().before(0, 0, 7).getDate("yyyy-mm-dd");
	   	
	   	$('#MEASURE_DT_TO').val(lsToDate);
	   	$('#MEASURE_DT_FROM').val(beforeMonthDate);
	   	$('#LANG').val(lang);
	   	
	   	var divHtml = "";
	   	var divHtmlH3 = "";
	   	var divHtmlUi = "";
	   	var tempMeasureDT = "";
	   	var BsStatus = "";
    	
	  	//타입라이 목록 조회 
		var postValue ={};   
   		postValue = { 
           	"MEASURE_DT_FROM" : $("#MEASURE_DT_FROM").val() ,
           	"MEASURE_DT_TO" : $("#MEASURE_DT_TO").val(),
           	"SORT" : $("#SORT").val(),
           	"LANG" : $("#LANG").val()
      	};
	  	
	  	jQuery.ajax({
		    type:"POST",
		    url:"/selectBsTimeLinelList.do",
		    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		    data:postValue,
		    //async:false,
		    success : function(data) {
		    	
		    	$.each(data.rows, function(key, value) {   
		    	     
		    	  if(this.cell[1]!=tempMeasureDT){
		    	     		divHtmlH3 = "<h3 class=\"tit\">" + this.cell[1] + "</h3>";	
		    	     	}
		    	     	
		    	     	if(this.cell[7]=="01"){
		    	     		BsStatus = "figure low";
		    	     	}else if(this.cell[7]=="02"){
		    	     		BsStatus = "figure normal";
		    	     	}else if(this.cell[7]=="03"){
		    	     		BsStatus = "figure warning";
		    	     	}else if(this.cell[7]=="04"){
		    	     		BsStatus = "figure danger";
		    	     	}else{
		    	     		BsStatus = "figure none";
		    	     	}
		    	     	
	    	     		divHtmlUi = "<ul class=\"area\"><li><a href=\"#\" onClick=\"bloodGlucoseMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "','" + this.cell[8] + "','" + this.cell[9] + "')\"><div class=\""+BsStatus+"\"><div><p>" + this.cell[5] + "</p><p>" + this.cell[6] + "</p></div></div><div class='state'><div><p class='point'>" + this.cell[4] + "</p></div><p class=\"time\">" + this.cell[2] + "</p></div></a></li></ul>";	
		    	     	
						divHtml += divHtmlH3;
						divHtml += divHtmlUi;
						
						divHtmlH3 = "";
						divHtmlUi = "";
						BsStatus = "";
						tempMeasureDT = this.cell[1];
						
		    	});
		    	
		    	$('#TIMELINE').html(divHtml);
	    	     $(".state").width(($(".date_cnt ul li").width()-$(".date_cnt .figure").width()-23));		// 상태 영역 너비
	    	     
	    	     loadingEnd();
		    	
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

	//조회
	function fnSearch(pSORT){
		loadingStart();
		
		var sort = pSORT;

		$('#SORT').val(sort);
		
		if(sort=="DESC"){
    		$('#SORT_UP').removeClass().addClass('up on');
			$('#SORT_DOWN').removeClass().addClass('down');;	
    	}else if(sort == "ASC"){
    		$('#SORT_UP').removeClass().addClass('up');
			$('#SORT_DOWN').removeClass().addClass('down on');;
    	}
		
		var dateFrom = new Date($('#MEASURE_DT_FROM').val().substr(0,4),$('#MEASURE_DT_FROM').val().substr(5,2),$('#MEASURE_DT_FROM').val().substr(8,4));
		var dateTo = new Date($('#MEASURE_DT_TO').val().substr(0,4),$('#MEASURE_DT_TO').val().substr(5,2),$('#MEASURE_DT_TO').val().substr(8,4));
		
		var interval = parseInt((dateTo - dateFrom)/(1000*60*60*24));
		
		if(interval>30){
			
			alert(bsTimeLineAlert1); 
			//최대 조회기간 범위는 30일 입니다.\n조회일자를 다시 선택하여 주시기 바랍니다.
			
			loadingEnd();
			return;
		}else{
			var divHtml = "";
		   	var divHtmlH3 = "";
		   	var divHtmlUi = "";
		   	var tempMeasureDT = "";
		   	var BsStatus = "";
	    	
		  	//타입라이 목록 조회 
			var postValue ={};   
	   		postValue = { 
	           	"MEASURE_DT_FROM" : $("#MEASURE_DT_FROM").val() ,
	           	"MEASURE_DT_TO" : $("#MEASURE_DT_TO").val() ,
	           	"SORT" : $("#SORT").val(),
	           	"LANG" : $("#LANG").val()
	      	};
		  	
		  	jQuery.ajax({
			    type:"POST",
			    url:"/selectBsTimeLinelList.do",
			    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			    data:postValue,
			    //async:false,
			    success : function(data) {
			    	
			    	//alert('조회가 완료되었습니다.');
			    	
			    	$.each(data.rows, function(key, value) {   
			    	     //$('#BS_MEASURE_POINT').append('<option value="'+ this.cell[0] +'">'+ this.cell[1] +'</option>');
			    	     
			    	     	if(this.cell[1]!=tempMeasureDT){
			    	     		divHtmlH3 = "<h3 class=\"tit\">" + this.cell[1] + "</h3>";	
			    	     	}
			    	     	
			    	     	if(this.cell[7]=="01"){
			    	     		BsStatus = "figure low";
			    	     	}else if(this.cell[7]=="02"){
			    	     		BsStatus = "figure normal";
			    	     	}else if(this.cell[7]=="03"){
			    	     		BsStatus = "figure warning";
			    	     	}else if(this.cell[7]=="04"){
			    	     		BsStatus = "figure danger";
			    	     	}else{
			    	     		BsStatus = "figure none";
			    	     	}
			    	     	
			    	     	divHtmlUi = "<ul class=\"area\"><li><a href=\"#\" onClick=\"bloodGlucoseMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "','" + this.cell[8] + "','" + this.cell[9] + "')\"><div class=\""+BsStatus+"\"><div><p>" + this.cell[5] + "</p><p>" + this.cell[6] + "</p></div></div><div class='state'><div><p class='point'>" + this.cell[4] + "</p></div><p class=\"time\">" + this.cell[2] + "</p></div></a></li></ul>";
							divHtml += divHtmlH3;
							divHtml += divHtmlUi;
							
							divHtmlH3 = "";
							divHtmlUi = "";
							BsStatus = "";
							tempMeasureDT = this.cell[1];
						
			    	});
			    	
			    	$('#TIMELINE').html(divHtml);
		    	    $(".state").width(($(".date_cnt ul li").width()-$(".date_cnt .figure").width()-23));		// 상태 영역 너비
			    	
		    	    loadingEnd();
			    },
			    complete : function(data) {
			          // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
			          // TODO
			    },
			    error : function(xhr, status, error) {
//			          alert("에러발생111");
			    }
			});
		}
	}
	
	//혈당측정 수정페이지 이동
	function bloodGlucoseMstView(pMeasureSeq,pMeasureDt, pMeasureTime, pBsMeasurePoint, pBsMeasureValue, pBsMeasureUnit, pBsState){
		
		var measureSeq = pMeasureSeq;
		
		var measureDt = pMeasureDt.replace(/-/gi,"");
		measureDt = measureDt.trim();
		
		var measureTime = pMeasureTime.replace(":","");
		measureTime = measureTime.replace("-","");
		measureTime = measureTime.trim();
		
		var bsMeasurePoint = pBsMeasurePoint;
		var bsMeasureValue = pBsMeasureValue;
		var bsMeasureUnit = pBsMeasureUnit;
		var bsState = pBsState;
		
		$('#MEASURE_SEQ').val(measureSeq);
		$('#MEASURE_DT').val(measureDt);
		$('#MEASURE_TIME').val(measureTime);
		$('#BS_MEASURE_POINT').val(bsMeasurePoint);
		$('#BS_MEASURE_VALUE').val(bsMeasureValue);
		$('#BS_MEASURE_UNIT').val(bsMeasureUnit);
		$('#BS_STATE').val(bsState);
		
		var frm = document.searchForm;
		frm.action = "/bloodGlucoseMstView.do?lang="+lang;
		frm.submit();
				
		//location.href='/bloodGlucoseMstView.do';
	}
	
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do?lang='+lang;
	}
	
	//혈당리포트 > 타임라인 화면으로 이동
	function bloodGlucoseTimeView(){
		location.href='/bloodGlucoseTimeView.do?lang='+lang;
	}	

	//혈당리포트 > 혈당트랜드 화면으로 이동
	function bloodGlucoseTrandView(){
		location.href='/bloodGlucoseTrandView.do?lang='+lang;
	}	

	//혈당리포트 > 예후진단 화면으로 이동
	function bloodGlucoseReportView(){
		location.href='/bloodGlucoseReportView.do?lang='+lang;
	}	
	
	function loadingStart(){
		$("body").after("<div class='over_bg'></div><div class='square'><div class='spin'></div></div>");
	}

	function loadingEnd(){
		$(".over_bg, .square").hide();
	}
  </script>
  
 </head>

 <body>
  <!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="bg_timeline">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="bloodGlucoseReport"/><!-- 혈당리포트 --></h1>
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
			<div class="tab clear" id="tab2">
				<div class="tab_btn_bg">
					<ul class="tab_btn area clear">
						<li class="on"><a href="#" onClick="bloodGlucoseTimeView()"><spring:message code="timeLine"/><!-- 타임라인 --></a></li>
						<li><a href="#" onClick="bloodGlucoseTrandView()"><spring:message code="trends"/><!-- 트랜드 --></a></li>
					</ul>
				</div>
				<div class="tab_cnt">
					<div>
						<form action="" id="searchForm" name="searchForm" method="post">
							<input type="hidden" id="MEASURE_SEQ" name="MEASURE_SEQ" VALUE="">
							<input type="hidden" id="MEASURE_DT" name="MEASURE_DT"  VALUE="">
							<input type="hidden" id="MEASURE_TIME" name="MEASURE_TIME" VALUE="">
							<input type="hidden" id="BS_MEASURE_POINT" name="BS_MEASURE_POINT" VALUE="">
							<input type="hidden" id="BS_MEASURE_VALUE" name="BS_MEASURE_VALUE" VALUE="">
							<input type="hidden" id="BS_MEASURE_UNIT" name="BS_MEASURE_UNIT" VALUE="">
							<input type="hidden" id="BS_STATE" name="BS_STATE" VALUE="">
							<input type="hidden" id="SORT" name="SORT" value="DESC">		
							<input type="hidden" id="LANG" name="LANG" value="">
							<div class="date_search area clear">
								<div>
									<p class=""><label for="" class="label_date">달력</label><input type="text" id="MEASURE_DT_FROM" name="MEASURE_DT_FROM" class="calendar"/></p>
									<p>~</p>
									<p class=""><label for="" class="label_date">달력</label><input type="text" id="MEASURE_DT_TO" name="MEASURE_DT_TO" class="calendar"/></p>
								</div>
								<div><button type="button" class="btn_style2 btn_search" onclick="fnSearch('DESC')">검색영역</button></div>
							</div>
							<div class="date_select area">
								<button type="button" id="SORT_UP" NAME="SORT_UP" class="up on" onclick="fnSearch('DESC')"><spring:message code="dateReverseSort"/><!-- 일자역순 --></button>	
								<button type="button" id="SORT_DOWN" NAME="SORT_DOWN" class="down" onclick="fnSearch('ASC')"><spring:message code="dateforwardsort"/><!-- 일자정순 --></button>
							</div>						
						</form>		
						<div class="date_cnt">
							<div id="TIMELINE">
							<!--
							 	<h3 class="tit">2017년 08월 15일</h3>
								<ul class="area">
									<li>
										<a href="bloodGlucoseReportView.do">
											<div class="figure danger">
												<div>
													<p>300</p><p>mg/dL</p>
												</div>
											</div>
											<div class="state">
												<div><p class="point">저녁식사 후</p></div>
												<p class="time">오후 08:02</p>
											</div>
										</a>
									</li>
									<li>
										<div class="figure normal">
											<div>
												<p>98</p><p>mg/dL</p>
											</div>
										</div>
										<div class="state">
											<div><p class="point">저녁식사 후</p></div>
											<p class="time">오후 08:02</p>
										</div>
									</li>
									<li>
										<div class="figure warning">
											<div>
												<p>140</p><p>mg/dL</p>
											</div>
										</div>
										<div class="state">
											<div><p class="point">저녁식사 후</p></div>
											<p class="time">오후 08:02</p>
										</div>
									</li>
									<li>
										<div class="figure danger">
											<div>
												<p>300</p><p>mg/dL</p>
											</div>
										</div>
										<div class="state">
											<div><p class="point">저녁식사 후</p></div>
											<p class="time">오후 08:02</p>
										</div>
									</li>									
									<li>
										<div class="figure danger">
											<div>
												<p>300</p><p>mg/dL</p>
											</div>
										</div>
										<div class="state">
											<div><p class="point">저녁식사 후</p></div>
											<p class="time">오후 08:02</p>
										</div>
									</li>									
									<li>
										<div class="figure low">
											<div>
												<p>65</p><p>mg/dL</p>
											</div>
										</div>
										<div class="state">
											<div><p class="point">저녁식사 후</p></div>
											<p class="time">오후 08:02</p>
										</div>
									</li>
								</ul>
								-->
							</div>
						</div>
					</div>		
				</div>
			</div>
		</section>
		<!--==================== //섹션 영역 끝 ====================-->
	</div>
	<!--==================== //전체 영역 끝 ====================-->
 </body>
</html>
