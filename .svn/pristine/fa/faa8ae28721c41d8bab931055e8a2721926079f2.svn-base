<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="retail.common.BaseEnv"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 
 <!DOCTYPE html>
<html lang="ko">
 <head>
  <meta charset="utf-8" />
  <title>리테일 JAVA 프레임워크</title>
  <link rel="stylesheet" href="/resources/css/main.css" />
  <script type="text/javascript" src="/resources/js/jquery-1.7.1.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="/resources/js/jquery.cookie.js" charset="utf-8"></script>    
 </head>


	<script type="text/javascript">
		
		//IE9 버전을 체크하여, 9버전일경우 새로고침
		function getInternetExplorerVersion() {    
	         var rv = -1; // Return value assumes failure.    
	         if (navigator.appName == 'Microsoft Internet Explorer') {        
	              var ua = navigator.userAgent;        
	              var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
	              if (re.exec(ua) != null)            
	                  rv = parseFloat(RegExp.$1);    
	             }    
	         return rv; 
	    }
		if(getInternetExplorerVersion() == 9){
			 var loc = location.search.split("=");
			  if(!(loc[0].substring(1) && loc[1] == 'yes')){
			   document.write("<meta id='refresh' http-equiv='refresh' content='0.1; URL=login.do?loop=yes'>");
			  } 
		}
		
		//로그인 요청 시작
		function login(){
			   
			if( $("#USER_ID").val()  == "" )
			{
				alert("아이디를 입력하세요.");
				 $("#USER_ID").focus();
				return;
			}
			if( $("#PASSWD_NO").val()  == "" )
			{
				alert("암호를 입력하세요.");
				 $("#PASSWD_NO").focus();
				return;
			}
			
			<!--로그인 정보 확인-->
			var form = document.getElementById("form1");
			$.ajax({
				url:"/login.do" ,
				type:"POST",
				datatype:"json",
				data:{ user_id: $("#USER_ID").val()   ,  passwd_no :$("#PASSWD_NO").val() },
				beforeSend : function(xhr) {} ,
				success:function(data,textStatus){  
					if(data.records == "0" ) { 
						alert("아이디 암호를 확인하세요.");
						location.replace("/"); 
					} else {
						location.replace("/main.do"); 
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

		//팝업을 위한 쿠키 (추후 사용)
		function getCookie(cname) 
		{   var name = cname + "=";
		    var ca = document.cookie.split(';');
		    for(var i=0; i<ca.length; i++) {
		        var c = ca[i];
		        while (c.charAt(0)==' ') c = c.substring(1);
		        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
		    } 
		    return "";
		}

		
	</script>
	
	
 <body>
	<!-- ========== header ========== -->
	<header id="header">
		<h1 class="logo f_l"><img src="/resources/img/ruckus/logo.png" width="82" height="25" alt="루커스 로고"></h1>
		<h2 class="title f_l">리테일테크 JAVA 프레임워크</h2>
	</header>
	<!-- ========== //header ========== -->

	<!-- ========== content ========== -->
	<article id="content">
		<div class="main_img">
			<div class="login p_a">
				<h3><img src="/resources/img/ruckus/manager_login.jpg" width="101" height="17" alt="관리자 로그인"></h3>
				<table>
					<caption>관리자 로그인 영역</caption>
					<colgroup>
						<col width="20px">
						<col width="140px">
						<col width="160px">
						<col width="93px">
					</colgroup>
					<form name="form1" id="form1"    > 
					<tbody>
						<tr>
							<th><img src="/resources/img/ruckus/id.gif" width="20" height="24" alt="아이디  "></th>
							<td><label for="">아이디</label></td>
							<td><input type=text name="USER_ID" id = "USER_ID"   maxlength="15"  tabindex="1" value="PA001"></td>
							<td rowspan="2"><input type="button"   onClick="login();"  tabindex="3" /></td>
						</tr>
						<tr>
							<th><img src="/resources/img/ruckus/pwd.gif" width="20" height="24" alt="비밀번호 "></th>
							<td><label for="">비밀번호</label></td>
							<td><input type=password name="PASSWD_NO" id="PASSWD_NO"   tabindex="2" maxlength="15" onKeyDown="javascript:if (event.keyCode == 13) search_check();" value="smart!@#$"></td>
						</tr>
					</tbody>
					</form>	
				</table>
			</div>
		</div>
	</article>
	<!-- ========== //content ========== -->

	<!-- ========== footer ========== -->
	<footer id="footer">
		<address>Copyrights 2016 RetailTech. All Rights Reserved.</address>
	</footer>
	<!-- ========== //footer ========== -->
 </body>
</html>
