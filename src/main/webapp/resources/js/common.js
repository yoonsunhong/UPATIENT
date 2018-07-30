$(document).ready(function (){
	// 탭
	$(".bg_trend .tab_btn > ul > li > a").on("click",function  () {
		var tabBtn = $(".tab_btn");
		var tabCnt = $(".tab_cnt");

		// 1) 버튼 on
		$(this).parent().addClass('on').siblings().removeClass('on');

		// 2) 콘텐츠 on
		tabCnt.find(' > div').eq($(this).parent().index()).show().siblings().hide();
		return false;
	});
	
	// 버튼 설정
	$(".btn_select button[type='button']").on("click",function  () {
		$(this).addClass("on").siblings().removeClass("on");
	}); 	
	
	// 모바일 os 구분
	var varUA = navigator.userAgent.toLowerCase(); //userAgent 값 얻기
	if (varUA.indexOf("iphone")>-1||varUA.indexOf("ipad")>-1||varUA.indexOf("ipod")>-1) { 
	    //IOS 일때 처리
		$('body').addClass('m_ios');
	}	
	
	/* input focus placeholder remove */
	$("#content .figure_input input:not(.readonly)").on({ 
	  "click" : function(){$(this).attr('placeholder','');},
	  "blur" : function(){$(this).attr('placeholder','0');} 
	});
	
	$("#content .figure_input input.readonly, #content .goal_cnt input.readonly").on('click', function () {
		$(this).blur();
	});	
});



