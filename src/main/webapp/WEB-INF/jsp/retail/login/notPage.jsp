<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>  
<!-- 다국어 프로퍼티 변수와 스프링 메세지 사용을 위한  스크립트 전역 변수와의 맵핑을 위한 include -->
<%@include file="/WEB-INF/jsp/retail/inc_language/inc_language.jsp" %>
<div style="margin: 0 auto; width: 550px;" >
죄송합니다. <br/>
요청하신 페이지를 찾을 수 없습니다.<br/>
방문하시려는 페이지의 주소가 잘못 입력되었거나,<br/>
페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br/>

입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.<br/><br/> 

<a href="#" onclick="goLogin()">로그인페이지로 이동</a>
</div>
<script>
function goLogin(){
	parent.document.location = 'login.do';
}
</script>

                