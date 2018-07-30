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
  <title> 활동 | 리포트 | 트렌드 </title>
  <link rel="stylesheet" href="/resources/css/common.css" />
  <link rel="stylesheet" href="/resources/css/sub.css" />
  <link rel="stylesheet" href="/resources/css/mediaquery.css" />
  <script type="text/javascript" src="/resources/js/common.js"></script>
  <script type="text/javascript" src="/resources/js/comm.js"></script>
  <script type="text/javascript" src="/resources/js/loader.js"></script><!-- 차트 -->   
  <!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5shiv.js"></script>
  <![endif]-->
</head>
<script type="text/javascript">
	loadingStart();	

	//차트
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart1);
	

	/* chart1 */
	function drawChart1() {
		 var data1 = new google.visualization.DataTable();
		 var data2 = new google.visualization.DataTable();
		 var data3 = new google.visualization.DataTable();
		 var data4 = new google.visualization.DataTable();
		 
		 var chartDateformat     = 'MM-dd';

		 
	     //그래프에 표시할 컬럼 추가
	     data1.addColumn('datetime' , '날짜');
	     data1.addColumn('number'   ,fasting);
	     data1.addColumn('number'   ,normal);
	     data1.addColumn('number'   ,'');
	     
	     data2.addColumn('datetime' , '날짜');
	     data2.addColumn('number'   , beforeMeal);
	     data2.addColumn('number'   ,normal);
	     data2.addColumn('number'   ,'');
	     
	     data3.addColumn('datetime' , '날짜');
	     data3.addColumn('number'   , afterMeal);
	     data3.addColumn('number'   ,normal);
	     data3.addColumn('number'   ,'');
	     
	     data4.addColumn('datetime' , '날짜');
	     data4.addColumn('number'   , beforeSleeping);
	     data4.addColumn('number'   ,normal);
	     data4.addColumn('number'   ,'');

	     //그래프에 표시할 데이터
	     var dataRow1 = [];
	     var dataRow2 = [];
	     var dataRow3 = [];
	     var dataRow4 = [];
	     
	     jQuery.ajax({
	 	    type:"POST",
	 	    url:"/selectMyBsMeasureTrandView.do",
	 	    data: { LAST_DAY: '8'},
	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	 	    async:false,
	 	    success : function(chartData) {
	 			for(var i = 0; i < chartData.length; i++){
	 				
	 				var day = [];
	 				
	 				day = chartData[i].COMM_DT.split('-');
	 				
	 				var a = parseInt(chartData[i].AA);
	 				var a_min = parseInt('70');
	 				var a_max = parseInt('100');
	 				
	 				var b = parseInt(chartData[i].BB);
	 				var b_min = parseInt('70');
	 				var b_max = parseInt('100');
	 				
	 				var c = parseInt(chartData[i].CC);
	 				var c_min = parseInt('80');
	 				var c_max = parseInt('140');
	 				
	 				var d = parseInt(chartData[i].DD);
	 				var d_min = parseInt('80');
	 				var d_max = parseInt('140');
	 				
	 				//dataRow = [new Date(day[0], day[1] -1, day[2]), a, b, c, d];
	 				dataRow1 = [new Date(day[0], day[1] -1, day[2]), a, a_min, a_max];
	 				dataRow2 = [new Date(day[0], day[1] -1, day[2]), b, b_min, b_max];
	 				dataRow3 = [new Date(day[0], day[1] -1, day[2]), c, c_min, c_max];
	 				dataRow4 = [new Date(day[0], day[1] -1, day[2]), d, d_min, d_max];
	 		       	
	 				data1.addRow(dataRow1);
	 				data2.addRow(dataRow2);
	 				data3.addRow(dataRow3);
	 				data4.addRow(dataRow4);
	 		   	}
	 	    },
	 	    complete : function(chartData) {
	 	    },
	 	    error : function(xhr, status, error) {
	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
	 	    }
	 	}); 
	    
	    //튤팁 날짜포멧 셋팅
		var formatter = new google.visualization.DateFormat({pattern: 'MM d, y'});
		formatter.format(data1, 0);
		formatter.format(data2, 0);
		formatter.format(data3, 0);
		formatter.format(data4, 0);

		var 	options1 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#09b6ee', '#797979', '#797979'], /* 라인 색상 */
			//linewidth : [5,1,1],
			//fontSize: 9,
			//pointSize: [5,1,1], /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		              //,max:300
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options2 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#09b6ee', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options3 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#09b6ee', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options4 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#09b6ee', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};

		var chart1 = new google.visualization.LineChart(document.getElementById('chart1'));
		chart1.draw(data1, options1);
		var chart2 = new google.visualization.LineChart(document.getElementById('chart2'));
		chart2.draw(data2, options2);
		var chart3 = new google.visualization.LineChart(document.getElementById('chart3'));
		chart3.draw(data3, options3);
		var chart4 = new google.visualization.LineChart(document.getElementById('chart4'));
		chart4.draw(data4, options4);
		
		loadingEnd();
	}
	
	//메인 페이지 이동
	function goMain(){
		location.href='/main.do?lang='+lang;;	
	}
	
	//혈당리포트 > 타임라인 화면으로 이동
	function bloodGlucoseTimeView(){
		location.href='/bloodGlucoseTimeView.do?lang='+lang;;
	}	

	//혈당리포트 > 혈당트랜드 화면으로 이동
	function bloodGlucoseTrandView(){
		location.href='/bloodGlucoseTrandView.do?lang='+lang;;
	}	

	//혈당리포트 > 예후진단 화면으로 이동
	function bloodGlucoseReportView(){
		location.href='/bloodGlucoseReportView.do?lang='+lang;;
	}		
	
	//날짜 선택 7일, 14일, 1개월, 3개월 
	function changeInfo(val){
		loadingStart();	
		
		var data1 = new google.visualization.DataTable();
		var data2 = new google.visualization.DataTable();
		var data3 = new google.visualization.DataTable();
		var data4 = new google.visualization.DataTable();
		 
		var chartDateformat     = 'MM-dd';

		 //그래프에 표시할 컬럼 추가
	     data1.addColumn('datetime' , '날짜');
	     data1.addColumn('number'   ,fasting);
	     data1.addColumn('number'   ,normal);
	     data1.addColumn('number'   ,'');
	     
	     data2.addColumn('datetime' , '날짜');
	     data2.addColumn('number'   , beforeMeal);
	     data2.addColumn('number'   ,normal);
	     data2.addColumn('number'   ,'');
	     
	     data3.addColumn('datetime' , '날짜');
	     data3.addColumn('number'   , afterMeal);
	     data3.addColumn('number'   ,normal);
	     data3.addColumn('number'   ,'');
	     
	     data4.addColumn('datetime' , '날짜');
	     data4.addColumn('number'   , beforeSleeping);
	     data4.addColumn('number'   ,normal);
	     data4.addColumn('number'   ,'');

	   //그래프에 표시할 데이터
	     var dataRow1 = [];
	     var dataRow2 = [];
	     var dataRow3 = [];
	     var dataRow4 = [];
	     
	     jQuery.ajax({
	 	    type:"POST",
	 	    url:"/selectMyBsMeasureTrandView.do",
	 	    data: { LAST_DAY:val},
	 	    dataType:"JSON", // 옵션이므로 JSON으로 받을게 아니면 안써도 됨
	 	    async:false,
	 	    success : function(chartData) {
	 			for(var i = 0; i < chartData.length; i++){
	 				
	 				var day = [];
	 				
	 				day = chartData[i].COMM_DT.split('-');
	 				var a = parseInt(chartData[i].AA);
	 				var a_min = parseInt('70');
	 				var a_max = parseInt('100');
	 				
	 				var b = parseInt(chartData[i].BB);
	 				var b_min = parseInt('70');
	 				var b_max = parseInt('100');
	 				
	 				var c = parseInt(chartData[i].CC);
	 				var c_min = parseInt('80');
	 				var c_max = parseInt('140');
	 				
	 				var d = parseInt(chartData[i].DD);
	 				var d_min = parseInt('80');
	 				var d_max = parseInt('140');
	 				
	 				//dataRow = [new Date(day[0], day[1] -1, day[2]), a, b, c, d];
	 				dataRow1 = [new Date(day[0], day[1] -1, day[2]), a, a_min, a_max];
	 				dataRow2 = [new Date(day[0], day[1] -1, day[2]), b, b_min, b_max];
	 				dataRow3 = [new Date(day[0], day[1] -1, day[2]), c, c_min, c_max];
	 				dataRow4 = [new Date(day[0], day[1] -1, day[2]), d, d_min, d_max];
	 		       	
	 				data1.addRow(dataRow1);
	 				data2.addRow(dataRow2);
	 				data3.addRow(dataRow3);
	 				data4.addRow(dataRow4);
	 		   	}
	 	    },
	 	    complete : function(chartData) {
	 	    },
	 	    error : function(xhr, status, error) {
	 	    	//CommonJs.alertErrorStatus(xhr.status, error);
	 	    }
	 	}); 
	    
	   //튤팁 날짜포멧 셋팅
		var formatter = new google.visualization.DateFormat({pattern: 'MM d, y'});
		formatter.format(data1, 0);
		formatter.format(data2, 0);
		formatter.format(data3, 0);
		formatter.format(data4, 0);

		var 	options1 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#09b6ee', '#797979', '#797979'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: [5,1,1], /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options2 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#fdc82e', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options3 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#f14555', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};
		
		var 	options4 = {
				curveType: 'function',
				height: 250,
				legend: { /* 범례 위치 */
				position: 'top',
				alignment: 'end', 
				textStyle: {
				color: "#7b7b7b"
				},
				//height: 900,
				//chartArea: {position: 'absolute', left: '10%', top: 0, width: "100%", height: 300},
			},
			//colors: ['#09b6ee', '#fdc82e', '#f14555', '#ff8f29'], /* 라인 색상 */
			
			series : {
				0 : {lineWidth:2, pointSize:0, color:'#09b6ee', pointShape:'circle', pointsVisible:false},
				1 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false},
				2 : {lineWidth:2, pointSize:0, color:'#37d376', pointShape:'circle', pointsVisible:false, visibleInLegend: false}
			},
			
			//colors: ['#ff8f29', '#fdc82e', '#f14555'], /* 라인 색상 */
			//fontSize: '9',
			//pointSize: 1, /* 포인트 크기 */
			//pointShape: 'circle', /* 포인트 모양 */
			
			vAxis: {		/* y축 */
				slantedText: false, /* rotate 0 */
				textStyle: {
					color: "#5f5f5f"
				},
				viewWindow: { /*Y축 최소,최대값 정의 min, max*/
		              min:0
		            }
			},
			hAxis: {		/* x축 */
				slantedText: false, /* rotate 0 */
				format: chartDateformat,  /*MM월dd일 x축 날짜 포멧 셋팅*/
				gridlines: {count: 8},
				textStyle: {
					color: "#5f5f5f",
				},
			},
			chartArea: {
				left: "10%",					/* y축 레이블 말줄임 방지 */
				width: '85%',
				backgroundColor: '#fff' /* 차트 배경*/,
			},
		};

		var chart1 = new google.visualization.LineChart(document.getElementById('chart1'));
		chart1.draw(data1, options1);
		var chart2 = new google.visualization.LineChart(document.getElementById('chart2'));
		chart2.draw(data2, options2);
		var chart3 = new google.visualization.LineChart(document.getElementById('chart3'));
		chart3.draw(data3, options3);
		var chart4 = new google.visualization.LineChart(document.getElementById('chart4'));
		chart4.draw(data4, options4);
		
		loadingEnd();
	}
	
	function loadingStart(){
		$("body").after("<div class='over_bg'></div><div class='square'><div class='spin'></div></div>");
	}

	function loadingEnd(){
		$(".over_bg, .square").hide();
	}
</script>
<body>
	<!--==================== 전체 영역 시작 ====================-->
	<div id="wrap" class="act_trend">
		<!--==================== 헤더 영역 시작 ====================-->
		<header id="header">
			<div class="area">
				<div>
					<button type="button" class="btn_style2 btn_menu" onClick="menuBtn();">메뉴</button>
					<h1 class="tit">활동리포트</h1>
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
		<section id="content">
			<div class="tab clear" id="tab2">
				<div class="tab_btn_bg">
					<ul class="tab_btn area clear">
						<li><a href="#" onClick="activityTimeView()"><spring:message code="timeLine"/><!-- 타임라인 --></a></li>
						<li class="on"><a href="#" onClick="activityTrandView()"><spring:message code="trends"/><!-- 트랜드 --></a></li>
					</ul>
				</div>
				<div class="tab clear" id="tab3">	
					<div class="tab_btn area clear">
						<ul>
							<li class="on"><a href="" onclick="changeInfo(8)"><spring:message code="week1"/><!--  1주--></a></li>
							<li><a href="" onclick="changeInfo(31)"><spring:message code="month1"/><!--1개월--></a></li>
							<li><a href="" onclick="changeInfo(91)"><spring:message code="month3"/><!--3개월--></a></li>
						</ul>
					</div>
					<div class="tab_cnt">
						<div class="cnt1">
							<h2 class="tit">시간 그래프</h2>
							<div id="chart1"><!-- 시간 그래프 영역 --></div>
							<h2 class="tit">거리 그래프</h2>
							<div id="chart2"><!-- 거리 그래프 영역 --></div>
							<h2 class="tit">걸음수 그래프</h2>
							<div id="chart3"><!-- 걸음수 그래프 영역 --></div>			
							<h2 class="tit">칼로리 그래프</h2>
							<div id="chart4"><!-- 칼로리 그래프 영역 --></div>															
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