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
  <title> 혈압 | 리포트 | 타임라인 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
<script type="text/javascript">
	$(document).ready(function (){
		loadingStart();
		
		//오늘날짜 셋팅
	   	var lsToDate = new CommDateManager().getDate("yyyy-mm-dd");
	   	//오늘-7 셋팅
	   	var beforeMonthDate = new CommDateManager().before(0, 0, 7).getDate("yyyy-mm-dd");
	   	
	   	$('#MEASURE_DT_TO').val(lsToDate);
	   	$('#MEASURE_DT_FROM').val(beforeMonthDate);
	   	$('#LANG').val(lang);
	   	
	   	var divHtml = "";
	   	var divHtmlDate = "";
	   	var divHtmlLi = "";
	   	var divHtmlUl = "";
	   	var tempMeasureDT = "";
	   	var sysState = "";
	   	var diasState = "";
	   	
	   	//혈압타임라인 목록 조회 
		var postValue ={};   
   		postValue = { 
           	"MEASURE_DT_FROM" : $("#MEASURE_DT_FROM").val() ,
           	"MEASURE_DT_TO" : $("#MEASURE_DT_TO").val(),
           	"SORT" : $("#SORT").val(),
           	"LANG" : $("#LANG").val()
      	};
	  	
	  	jQuery.ajax({
	    	type:"POST",
		    url:"/selectBpTimeLinelList.do",
		    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
		    data:postValue,
		    //async:false,
		    success : function(data) {
		    	
	    		$.each(data.rows, function(key, value) {   
		    	     
	    			if(this.cell[1]!=tempMeasureDT && tempMeasureDT!=""){
	   	     			divHtmlUl = "</ul>";	
    	     		}
	    			
	    			if(this.cell[1]!=tempMeasureDT){
	   	     			divHtmlDate = "<h3 class=\"tit\">" + this.cell[1] + "</h3><ul>";	
	    	     	}
			    	     	
					if(this.cell[6]=="01"){
						sysState = "low";
				 	}else if(this.cell[6]=="02"){
				 		sysState = "normal";
				 	}else if(this.cell[6]=="03"){
				 		sysState = "warning";
				 	}else if(this.cell[6]=="04"){
				 		sysState = "high";
				 	}else if(this.cell[6]=="05"){
				 		sysState = "danger";
				 	}
					
					if(this.cell[7]=="01"){
						diasState = "low";
				 	}else if(this.cell[7]=="02"){
				 		diasState = "normal";
				 	}else if(this.cell[7]=="03"){
				 		diasState = "warning";
				 	}else if(this.cell[7]=="04"){
				 		diasState = "high";
				 	}else if(this.cell[7]=="05"){
				 		diasState = "danger";
				 	}
		    	  
    	  		
		    	     	
	   	     		//divHtmlLi = "<ul class=\"area\"><li><a href=\"#\" onClick=\"bloodGlucoseMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "','" + this.cell[8] + "','" + this.cell[9] + "')\"><div class=\""+BsStatus+"\"><div><p>" + this.cell[5] + "</p><p>" + this.cell[6] + "</p></div></div><div class='state'><div><p class='point'>" + this.cell[4] + "</p></div><p class=\"time\">" + this.cell[2] + "</p></div></a></li></ul>";	
	   	     		//divHtmlLi = "<li><div class=\"area\"><a href=\"#\" onClick=\"bloodPressureMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "')\"><p class=\""+sysState+"\"><strong class=\"figure\">" + this.cell[3] + "</strong><strong><span>systole</span><span>mmHg</span></strong></p><p class=\""+diasState+"\"><strong class=\"figure\">" + this.cell[4] + "</strong><strong><span>diastole</span><span>mmHg</span></strong></p><p><strong>" + this.cell[5] + "</strong><strong><span>heart rate</span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>" + this.cell[2] + "</strong></p></a></div></li>";   
	   	     		divHtmlLi = "<li><div class=\"area\"><a href=\"#\" onClick=\"bloodPressureMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[4] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "')\"><p class=\""+sysState+"\"><strong class=\"figure\">" + this.cell[3] + "</strong><strong><span><spring:message code='systole'/></span><span>mmHg</span></strong></p><p class=\""+diasState+"\"><strong class=\"figure\">" + this.cell[4] + "</strong><strong><span><spring:message code='diastole'/></span><span>mmHg</span></strong></p><p><strong>" + this.cell[5] + "</strong><strong><span><spring:message code='heartRate'/></span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>" + this.cell[2] + "</strong></p></a></div></li>";
	   	     		//divHtmlLi = "<li><div class=\"area\"><p class=\"normal\"><strong class=\"figure\">180</strong><strong><span>systole</span><span>mmHg</span></strong></p><p class=\"low\"><strong class=\"figure\">90</strong><strong><span>diastole</span><span>mmHg</span></strong></p><p><strong>85</strong><strong><span>heart rate</span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>20:00</strong></p></div></li>   ";

	   	     		divHtml += divHtmlUl;
	   	     		divHtml += divHtmlDate;
					divHtml += divHtmlLi;
					
					divHtmlUl = "";
					divHtmlDate = "";
					divHtmlLi = "";
					sysState = "";
					diasState = "";
					tempMeasureDT = this.cell[1];
						
	    		});
		    	
	    		$('#TIMELINE').html(divHtml);
   	     		//$(".state").width(($(".date_cnt ul li").width()-$(".date_cnt .figure").width()-23));		// 상태 영역 너비
	    	     
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
		   	var divHtmlDate = "";
		   	var divHtmlLi = "";
		   	var divHtmlUl = "";
		   	var tempMeasureDT = "";
		   	var sysState = "";
		   	var diasState = "";
	    	
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
			    url:"/selectBpTimeLinelList.do",
			    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
			    data:postValue,
			    //async:false,
			    success : function(data) {
			    	
			    	//alert('조회가 완료되었습니다.');
			    	
			    	$.each(data.rows, function(key, value) {   
			    	     //$('#BS_MEASURE_POINT').append('<option value="'+ this.cell[0] +'">'+ this.cell[1] +'</option>');
			    	     
			    		if(this.cell[1]!=tempMeasureDT && tempMeasureDT!=""){
		   	     			divHtmlUl = "</ul>";	
	    	     		}
		    			
		    			if(this.cell[1]!=tempMeasureDT){
		   	     			divHtmlDate = "<h3 class=\"tit\">" + this.cell[1] + "</h3><ul>";	
		    	     	}
				    	     	
						if(this.cell[6]=="01"){
							sysState = "low";
					 	}else if(this.cell[6]=="02"){
					 		sysState = "normal";
					 	}else if(this.cell[6]=="03"){
					 		sysState = "warning";
					 	}else if(this.cell[6]=="04"){
					 		sysState = "high";
					 	}else if(this.cell[6]=="05"){
					 		sysState = "danger";
					 	}
						
						if(this.cell[7]=="01"){
							diasState = "low";
					 	}else if(this.cell[7]=="02"){
					 		diasState = "normal";
					 	}else if(this.cell[7]=="03"){
					 		diasState = "warning";
					 	}else if(this.cell[7]=="04"){
					 		diasState = "high";
					 	}else if(this.cell[7]=="05"){
					 		diasState = "danger";
					 	}
			    	  
	    	  		
			    	     	
		   	     		//divHtmlLi = "<ul class=\"area\"><li><a href=\"#\" onClick=\"bloodGlucoseMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "','" + this.cell[8] + "','" + this.cell[9] + "')\"><div class=\""+BsStatus+"\"><div><p>" + this.cell[5] + "</p><p>" + this.cell[6] + "</p></div></div><div class='state'><div><p class='point'>" + this.cell[4] + "</p></div><p class=\"time\">" + this.cell[2] + "</p></div></a></li></ul>";	
		   	     		//divHtmlLi = "<li><div class=\"area\"><a href=\"#\" onClick=\"bloodPressureMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "')\"><p class=\""+sysState+"\"><strong class=\"figure\">" + this.cell[3] + "</strong><strong><span>systole</span><span>mmHg</span></strong></p><p class=\""+diasState+"\"><strong class=\"figure\">" + this.cell[4] + "</strong><strong><span>diastole</span><span>mmHg</span></strong></p><p><strong>" + this.cell[5] + "</strong><strong><span>heart rate</span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>" + this.cell[2] + "</strong></p></a></div></li>";   
		   	     		divHtmlLi = "<li><div class=\"area\"><a href=\"#\" onClick=\"bloodPressureMstView('" + this.cell[0] + "','" + this.cell[1] + "','" + this.cell[2] + "','" + this.cell[3] + "','" + this.cell[4] + "','" + this.cell[5] + "','" + this.cell[6] + "','" + this.cell[7] + "')\"><p class=\""+sysState+"\"><strong class=\"figure\">" + this.cell[3] + "</strong><strong><span><spring:message code='systole'/></span><span>mmHg</span></strong></p><p class=\""+diasState+"\"><strong class=\"figure\">" + this.cell[4] + "</strong><strong><span><spring:message code='diastole'/></span><span>mmHg</span></strong></p><p><strong>" + this.cell[5] + "</strong><strong><span><spring:message code='heartRate'/></span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>" + this.cell[2] + "</strong></p></a></div></li>";
		   	     		//divHtmlLi = "<li><div class=\"area\"><p class=\"normal\"><strong class=\"figure\">180</strong><strong><span>systole</span><span>mmHg</span></strong></p><p class=\"low\"><strong class=\"figure\">90</strong><strong><span>diastole</span><span>mmHg</span></strong></p><p><strong>85</strong><strong><span>heart rate</span><span>Beats/Min</span></strong></p><p class=\"alarm\"><strong>20:00</strong></p></div></li>   ";

		   	     		divHtml += divHtmlUl;
		   	     		divHtml += divHtmlDate;
						divHtml += divHtmlLi;
						
						divHtmlUl = "";
						divHtmlDate = "";
						divHtmlLi = "";
						sysState = "";
						diasState = "";
						tempMeasureDT = this.cell[1];
						
			    	});
			    	
			    	$('#TIMELINE').html(divHtml);
		    	    //$(".state").width(($(".date_cnt ul li").width()-$(".date_cnt .figure").width()-23));		// 상태 영역 너비
			    	
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
	
	//혈압측정 수정페이지 이동
	function bloodPressureMstView(pMeasureSeq, pMeasureDt, pMeasureTime, pSystoleMeasureValue, pDiastoleMeasureValue, pHeartRateMeasureValue, pSystoleBpState, pDiastoleBpState){
		
		var measureSeq = pMeasureSeq;
		
		var measureDt = pMeasureDt.replace(/-/gi,"");
		measureDt = measureDt.trim();
		
		
		var measureTime = pMeasureTime.replace(":","");
		measureTime = measureTime.replace("-","");
		measureTime = measureTime.trim();
		
		var systoleMeasureValue = pSystoleMeasureValue;
		var diastoleMeasureValue = pDiastoleMeasureValue;
		var heartRateMeasureValue = pHeartRateMeasureValue;
		var systoleBpState = pSystoleBpState;
		var diastoleBpState = pDiastoleBpState;
		
		$('#MEASURE_SEQ').val(measureSeq);
		$('#MEASURE_DT').val(measureDt);
		$('#MEASURE_TIME').val(measureTime);
		$('#SYSTOLE_MEASURE_VALUE').val(systoleMeasureValue);
		$('#DIASTOLE_MEASURE_VALUE').val(diastoleMeasureValue);
		$('#HEART_RATE_MEASURE_VALUE').val(heartRateMeasureValue);
		$('#SYSTOLE_BP_STATE').val(systoleBpState);
		$('#DIASTOLE_BP_STATE').val(diastoleBpState);
		
		var frm = document.searchForm;
		frm.action = "/bloodPressureMstView.do?lang="+lang;
		frm.submit();
				
		//location.href='/bloodGlucoseMstView.do';
	}
	
	function loadingStart(){
		$("body").after("<div class='over_bg'></div><div class='square'><div class='spin'></div></div>");
	}

	function loadingEnd(){
		$(".over_bg, .square").hide();
	}
</script>
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
</head>
 <body>
  <!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="pre_time">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit"><spring:message code="bloodPressureReport"/><!-- 혈압리포트--></h1>
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
						<li class="on"><a href="#" onClick="bloodPressureTimeView()"><spring:message code="timeLine"/><!-- 타임라인 --></a></li>
						<li><a href="#" onClick="bloodPressureTrandView()"><spring:message code="trends"/><!-- 트랜드 --></a></li>
					</ul>
				</div>
				<div class="tab_cnt">
					<div>
						<form action="" id="searchForm" name="searchForm" method="post">
							<input type="hidden" id="MEASURE_SEQ" name="MEASURE_SEQ" VALUE="">
							<input type="hidden" id="MEASURE_DT" name="MEASURE_DT"  VALUE="">
							<input type="hidden" id="MEASURE_TIME" name="MEASURE_TIME" VALUE="">
							<input type="hidden" id="SYSTOLE_MEASURE_VALUE" name="SYSTOLE_MEASURE_VALUE" VALUE="">
							<input type="hidden" id="DIASTOLE_MEASURE_VALUE" name="DIASTOLE_MEASURE_VALUE" VALUE="">
							<input type="hidden" id="HEART_RATE_MEASURE_VALUE" name="HEART_RATE_MEASURE_VALUE" VALUE="">
							<input type="hidden" id="SYSTOLE_BP_STATE" name="SYSTOLE_BP_STATE" VALUE="">
							<input type="hidden" id="DIASTOLE_BP_STATE" name="DIASTOLE_BP_STATE" VALUE="">
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
						<div class="timeline"><!-- 각 클래스명 의미 - danger: 2기 고혈압(매우 높음), warning: 1기 고혈압(높음), high: 고혈압 전단계(다소 높음), normal: 정상, low: 저혈압(낮음) -->
							<div id="TIMELINE">
							 	<!--
							 	<h3 class="tit">2017년 08월 15일</h3>
								<ul>
									<li>
										<div class="area">
											<p class="p_r"><span class="danger"></span><strong class="figure warning">180</strong><strong><span>수축기</span><span>mmHg</span></strong></p>
											<p><strong class="figure high">135</strong><strong><span>이완기</span><span>mmHg</span></strong></p>
											<p><strong>100</strong><strong><span>심박수</span><span>Beats/Min</span></strong></p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>	
									<li>
										<div class="area">
											<p><strong class="figure normal">180</strong><strong><span>systole</span><span>mmHg</span></strong></p>
											<p><strong class="figure low">90</strong><strong><span>diastole</span><span>mmHg</span></strong></p>
											<p><strong>85</strong><strong><span>heart rate</span><span>Beats/Min</span></strong></p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>		
									<li>
										<div class="area">
											<p><strong class="figure high">180</strong><strong><span>수축기</span><span>mmHg</span></strong></p>
											<p><strong class="figure high">90</strong><strong><span>이완기</span><span>mmHg</span></strong></p>
											<p><strong>85</strong><strong><span>심박수</span><span>Beats/Min</span></strong></p>
											<p class="alarm"><strong>20:00</strong></p>										
										</div>
									</li>																		
								</ul>	
								-->	
														
							</div>
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