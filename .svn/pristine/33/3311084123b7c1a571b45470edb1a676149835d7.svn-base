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
<body>
		<!-- 왼쪽 메뉴 시작 -->
		<div id="gnb">
			<div class="user_info">
				<div class="clear area">
					<p class="f_l"><img src="/resources/images/icon/user.png"><span><%=getEnv().getUSER_NM() %></span></p>
					<button type="button" class="close_btn f_r" onClick="closeBtn1()">메뉴 영역 닫기</button>				
				</div>
			</div>
			<div class="home area"><a href="#" onClick="goMain()"><spring:message code="home"/><!-- 메인으로 --></a></div>
			<nav>
				<ul>
					<li class="depth1">
						<p><spring:message code="bloodGlucose"/><!-- 혈당 --></p>
						<ul class="depth2">
							<li><a href="#" onClick="goBtBloodGlucoseMst()"><spring:message code="measurement"/><!-- 측정 --></a></li>
							<li><a href="#" onClick="bloodGlucoseMst()"><spring:message code="manuallyMeasurement"/><!-- 수동 입력 --></a></li>
							<li><a href="#" onClick="bloodGlucoseTimeView()"><spring:message code="report"/><!-- 리포트 --></a></li>
						</ul>					
					</li>
					<li class="depth1">
						<p><spring:message code="bloodPressure"/><!-- 혈압 --></p>
						<ul class="depth2">
							<li><a href="#" onclick="goBtBloodPressureMst()"><spring:message code="measurement"/><!-- 측정 --></a></li>
							<li><a href="#" onclick="bloodPressureMst()"><spring:message code="manuallyMeasurement"/><!-- 수동 입력 --></a></li>
							<li><a href="#" onclick="bloodPressureTimeView()"><spring:message code="report"/><!-- 리포트 --></a></li>
						</ul>					
					</li>
					<li class="depth1">
						<p><spring:message code="bmi"/><!-- BMI --></p>
						<ul class="depth2">
							<li><a href="#" onclick="goBtBodyMassIndexMst()"><spring:message code="measurement"/><!-- 측정 --></a></li>
							<li><a href="#" onclick="bodyMassIndexMst()"><spring:message code="manuallyMeasurement"/><!-- 수동 입력 --></a></li>
							<li><a href="#" onclick="bodyMassIndexTimeView()"><spring:message code="report"/><!-- 리포트 --></a></li>
						</ul>					
					</li>
					<li class="depth1">
						<p><spring:message code="activity"/><!-- 활동 --></p>
						<ul class="depth2">
							<li><a href="#" onclick="activityTimeView()"><spring:message code="report"/><!-- 리포트 --></a></li>
							<li></li>
							<li></li>
						</ul>					
					</li>					
					<li class="depth1">
						<p><spring:message code="comprehensiveAnalysis"/><!-- 종합분석 --></p>
						<ul class="depth2">
							<li><a href="#" onclick="comprehensiveAnalysis()"><spring:message code="comprehensiveAnalysis"/><!-- 종합분석 --></a></li>
							<li></li>
							<li></li>
						</ul>					
					</li>		
				</ul>
			</nav>
		</div>
		<!-- 왼쪽 메뉴 끝 -->
</body>