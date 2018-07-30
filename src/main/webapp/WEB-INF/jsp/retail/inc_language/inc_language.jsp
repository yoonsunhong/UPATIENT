<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 스프링 메세지 테그사용 :: 다국어 -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%--
    파일명: inc_language.jsp
    설명:  공통으로 include 할 language 용 tag 맵핑
    author  : 문희훈
    since   : 2018.03.08
    version : 1.0
    guide : 
    1. JSP와 JS를 분리하여 개발을 하기 때문에, 프로퍼티 언어별 메세지 셋팅을 자바스크립트 전역변수에 담아 사용 
    2. JS에서 사용되는 alert, 멘트, innerHtml, grid등에 한글이 사용되는 곳은 전역변수에 담아 사용
    3. JSP에서 멘트 및 한글을 사용할경우에는 <spring:message code="프로퍼티변수"/> 해당 코드 바로 사용 가능
    4. 공통 메세지 또는 언어가 추가 되었을 시 다른 개발자에게 공유 및 배포 SVN 처리
--%>
<!-- 다국어를 위한 전역변수 js에서 alert, 한글태그 등에 사용-->
<script type="text/javascript" charset="utf-8">
var lang = "en";

/**공통 알림 메세지**/
var msgSaveConfirm = '<spring:message code="msgSaveConfirm"/>'; //저장하시겠습니까?
var msgSave= '<spring:message code="msgSave"/>'; //저장되었습니다.
var msgSaveError= '<spring:message code="msgSaveError"/>'; //저장 중 오류가 발생했습니다. 관리자에게 문의하세요
var msgModifyConfirm= '<spring:message code="msgModifyConfirm"/>'; //수정 하시겠습니까?
var msgModify= '<spring:message code="msgModify"/>'; //수정되었습니다.
var msgDeleteConfirm= '<spring:message code="msgDeleteConfirm"/>'; //삭제 하시겠습니까?
var msgDelete= '<spring:message code="msgDelete"/>'; //삭제되었습니다.


/**공통 버튼**/
var btnNew='<spring:message code="btnNew"/>'; //신규
var btnSave='<spring:message code="btnSave"/>'; //저장
var btnDel='<spring:message code="btnDel"/>'; //삭제
var btnSearch='<spring:message code="btnSearch"/>'; //조회

/**그리드 or TEXT**/
var korean='<spring:message code="korean"/>'; //한글
var english='<spring:message code="english"/>'; //영어
var czechia='<spring:message code="czechia"/>'; //체코
var langSetting='<spring:message code="langSetting"/>'; //언어설정

var customerCode='<spring:message code="customerCode"/>'; //고객코드
var passWord='<spring:message code="passWord"/>'; //비밀번호
var autoLogin='<spring:message code="autoLogin"/>'; //자동로그인
var settingLang='<spring:message code="settingLang"/>'; //언어설정
var login='<spring:message code="login"/>'; //로그인
var findPass='<spring:message code="findPass"/>'; //비밀번호 찾기
var signUp='<spring:message code="signUp"/>'; //회원가입
var maximum='<spring:message code="maximum"/>'; //최고
var minimum='<spring:message code="minimum"/>'; //최저
var average='<spring:message code="average"/>'; //평균
var totalMeasured='<spring:message code="totalMeasured"/>'; //총측정수
var veryHighs='<spring:message code="veryHighs"/>'; //매우 높음
var highs='<spring:message code="highs"/>'; //높음
var normal='<spring:message code="normal"/>'; //정상
var nows='<spring:message code="nows"/>'; //낮음


/**메세지 (장문)**/
var msgLogin1='<spring:message code="msgLogin1"/>'; //비밀번호를 분실하셨나요?
var msgLogin2='<spring:message code="msgLogin2"/>'; //처음이신가요?
var msgLogin3='<spring:message code="msgLogin3"/>'; //아이디를 입력하세요.
var msgLogin4='<spring:message code="msgLogin4"/>'; //암호를 입력하세요.
var msgLogin5='<spring:message code="msgLogin5"/>'; //아이디 암호를 확인하세요.

/**메인화면 TEXT*/
var msgMain1='<spring:message code="msgMain1"/>'; //최근 측정 정보
var msgMain2='<spring:message code="msgMain2"/>'; //최근 7일 정보

/**혈당수동입력*/
var glucoseLevel='<spring:message code="glucoseLevel"/>'; //혈당수치
var timePeriod='<spring:message code="timePeriod"/>'; //측정시기
var bsInputAlert1='<spring:message code="bsInputAlert1"/>'; //혈당수치를 입력하세요.
var bsInputAlert2='<spring:message code="bsInputAlert2"/>'; //측정일자를 입력하세요
var bsInputAlert3='<spring:message code="bsInputAlert3"/>'; //측정시간을 입력하세요
var bsInputAlert4='<spring:message code="bsInputAlert4"/>'; //측정시기를  선택하세요
var bsInputAlert5='<spring:message code="bsInputAlert5"/>'; //혈당수동입력이 완료되었습니다
var bsInputAlert6='<spring:message code="bsInputAlert6"/>'; //혈당수동입력중 오류가 발생했습니다. 관리자에게 문의하세요
var bsInputAlert7='<spring:message code="bsInputAlert7"/>'; //혈당수정이 완료되었습니다
var bsInputAlert8='<spring:message code="bsInputAlert8"/>'; //혈당수정중 오류가 발생했습니다. 관리자에게 문의하세요

/**혈당리포트*/
var bloodGlucoseReport='<spring:message code="bloodGlucoseReport"/>'; //혈당리포트 
var timeLine='<spring:message code="timeLine"/>'; //타임라인
var trends='<spring:message code="trends"/>'; //트랜드
var dateReverseSort='<spring:message code="dateReverseSort"/>'; //일자역순
var dateforwardsort='<spring:message code="dateforwardsort"/>'; //일자정순
var bsTimeLineAlert1='<spring:message code="bsTimeLineAlert1"/>'; //최대 조회기간 범위는 30일 입니다.조회일자를 다시 선택하여 주시기 바랍니다.
var fasting='<spring:message code="fasting"/>';//공복
var beforeMeal='<spring:message code="beforeMeal"/>';//식전
var afterMeal='<spring:message code="afterMeal"/>';//식후
var beforeSleeping='<spring:message code="beforeSleeping"/>';//취침전
var week1='<spring:message code="week1"/>';//1주
var month1='<spring:message code="month1"/>';//1개월
var month3='<spring:message code="month3"/>';//3개월
var normalMin='<spring:message code="normalMin"/>';//정상min
var normalMax='<spring:message code="normalMax"/>';//정상max
var normal='<spring:message code="normal"/>';//정상범위

/**혈압리포트*/
 var systole='<spring:message code="systole"/>';//수축기
 var diastole='<spring:message code="diastole"/>';//이완기
 var heartRate='<spring:message code="heartRate"/>';//심박수
 var bpInputAlert1='<spring:message code="bpInputAlert1"/>';//수축기를 입력하세요
 var bpInputAlert2='<spring:message code="bpInputAlert2"/>';//이완기를 입력하세요
 var bpInputAlert3='<spring:message code="bpInputAlert3"/>';//심박수를 입력하세요
 var bsInputAlert4='<spring:message code="bsInputAlert4"/>'; //혈압수동입력이 완료되었습니다
 var bsInputAlert5='<spring:message code="bsInputAlert5"/>'; //혈압수동입력중 오류가 발생했습니다. 관리자에게 문의하세요
 var bsInputAlert6='<spring:message code="bsInputAlert6"/>'; //혈압수정이 완료되었습니다
 var bsInputAlert7='<spring:message code="bsInputAlert7"/>'; //혈압수정중 오류가 발생했습니다. 관리자에게 문의하세요
 
 /**BMI수동입력*/
  var height='<spring:message code="height"/>';//height
  var weight='<spring:message code="weight"/>';//weight
  var muscle='<spring:message code="muscle"/>';//muscle
  var fat='<spring:message code="fat"/>';//fat
  var bone='<spring:message code="bone"/>';//bone
  var moisture='<spring:message code="moisture"/>';//moisture
  var VisceralFat='<spring:message code="VisceralFat"/>';//VisceralFat
  var bmiInputAlert1='<spring:message code="bmiInputAlert1"/>';//Please enter your weight
  var bmiInputAlert2='<spring:message code="bmiInputAlert2"/>';//Please enter your muscle
  var bmiInputAlert3='<spring:message code="bmiInputAlert3"/>';//Please enter your fat
  var bmiInputAlert4='<spring:message code="bmiInputAlert4"/>';//Please enter your bone
  var bmiInputAlert5='<spring:message code="bmiInputAlert5"/>';//Please enter your moisture
  var bmiInputAlert6='<spring:message code="bmiInputAlert6"/>';//Please enter your VisceralFat
  var bmiInputAlert7='<spring:message code="bmiInputAlert7"/>';//Manual BMI input was completed.
  var bsInputAlert8='<spring:message code="bsInputAlert8"/>';//An error occurred during manual BMI input. Contact your manager.
  var bsInputAlert9='<spring:message code="bsInputAlert9"/>';//BMI modification is complete.
  var bsInputAlert10='<spring:message code="bsInputAlert10"/>';//An erroe occurred in modifying your BMI. Contact your manager
 
/**설정(좌측메뉴)*/
var home='<spring:message code="home"/>'; //홈
var bloodGlucose='<spring:message code="bloodGlucose"/>'; //혈당
var measurement='<spring:message code="measurement"/>'; //측정
var manuallyMeasurement='<spring:message code="manuallyMeasurement"/>'; //수동입력
var report='<spring:message code="report"/>'; //혈당리포트
var bloodPressure='<spring:message code="bloodPressure"/>'; //혈압
var bmi='<spring:message code="bmi"/>'; //bmi
var activity='<spring:message code="activity"/>'; //활동
var comprehensiveAnalysis='<spring:message code="comprehensiveAnalysis"/>'; //종합분ㅅ걱


/**설정(우측메뉴)*/
 var settings='<spring:message code="settings"/>'; //설정
 var userProfile='<spring:message code="userProfile"/>'; //사용자 정보
 var physicalInformation='<spring:message code="physicalInformation"/>'; //건강 정보
 var goalSetting='<spring:message code="goalSetting"/>'; //목표 설정
 var devices='<spring:message code="devices"/>'; //측정기 연결
 var alarm='<spring:message code="alarm"/>'; //알람
 var language='<spring:message code="language"/>'; //언어
 var privacyStatement='<spring:message code="privacyStatement"/>'; //개인정보취급방침
 var version='<spring:message code="version"/>'; //버전
 var changePassword='<spring:message code="changePassword"/>'; //비밀번호 변경
 var logout='<spring:message code="logout"/>'; //로그아웃

 /**건강정보*/
 var physicalInfoAlert1='<spring:message code="physicalInfoAlert1"/>'; //키를 입력하세요.
 var physicalInfoAlert2='<spring:message code="physicalInfoAlert2"/>'; //체중를 입력하세요
 var physicalInfoAlert3='<spring:message code="physicalInfoAlert3"/>'; //건강정보가 등록되었습니다.
 var physicalInfoAlert4='<spring:message code="physicalInfoAlert4"/>'; //건강정보 수정 중 오류가 발생했습니다. 관리자에게 문의하세요.
 var male='<spring:message code="male"/>'; //남자
 var female='<spring:message code="female"/>'; //여자
 var height='<spring:message code="height"/>'; //키
 var weight='<spring:message code="weight"/>'; //체중
 

 /**사용자등록 & 사용자 정보*/
 var userInfoAlert1='<spring:message code="userInfoAlert1"/>';//이름을 입력해 주세요
 var userInfoAlert2='<spring:message code="userInfoAlert2"/>';//병원을 선택해 주세요
 var userInfoAlert3='<spring:message code="userInfoAlert3"/>';//고객코드(ID)를 입력해 주세요
 var userInfoAlert4='<spring:message code="userInfoAlert4"/>';//비밀번호를 입력해 주세요
 var userInfoAlert5='<spring:message code="userInfoAlert5"/>';//비밀번호 확인을 입력해 주세요
 var userInfoAlert6='<spring:message code="userInfoAlert6"/>';//비밀번호와 비밀번호 확인이 틀립니다
 var userInfoAlert7='<spring:message code="userInfoAlert7"/>';//비밀번호를 확인하세요.(영문,숫자를 혼합하여 6~20자 이내)
 var userInfoAlert8='<spring:message code="userInfoAlert8"/>';//생년월일을 입력해 주세요
 var userInfoAlert9='<spring:message code="userInfoAlert9"/>';//이메일을 입력해 주세요
 var userInfoAlert10='<spring:message code="userInfoAlert10"/>';//이메일 형식이 올바르지 않습니다
 var userInfoAlert11='<spring:message code="userInfoAlert11"/>';//연락처를 입력해 주세요.
 var userInfoAlert12='<spring:message code="userInfoAlert12"/>';//연락처는 숫자만 입력하실 수 있습니다!
 var userInfoAlert13='<spring:message code="userInfoAlert13"/>';//동일한 고객코드(ID)가 있습니다.
 var userInfoAlert14='<spring:message code="userInfoAlert14"/>';//사용자 등록이 완료되었습니다. 로그인 후 이용 가능합니다.
 var userInfoAlert15='<spring:message code="userInfoAlert15"/>';//사용자 등록중 오류가 발생했습니다. 관리자에게 문의하세요
 var userInfoAlert16='<spring:message code="userInfoAlert16"/>';//수정되었습니다
 var userInfoAlert17='<spring:message code="userInfoAlert17"/>';//오류가 발생했습니다. 관리자에게 문의하세요
 var userInfoAlert18='<spring:message code="userInfoAlert18"/>';//해당항목은 필수항목이며, 숫자만 입력하실 수 있습니다!
 var name='<spring:message code="name"/>';//이름
 var hospital='<spring:message code="hospital"/>';//병원
 var userInfoMsg1='<spring:message code="userInfoMsg1"/>';//병원에서 발급된 고객코드를 입력하세요.
 var userInfoMsg2='<spring:message code="userInfoMsg2"/>';//6~10자리로 입력해주세요
 var confirmPassWord='<spring:message code="confirmPassWord"/>';//비밀번호 확인
 var birthday='<spring:message code="birthday"/>';//생년월일
 var email='<spring:message code="email"/>';//이메일
 var mobileNumber='<spring:message code="mobileNumber"/>';//연락처
 var numberOnly='<spring:message code="numberOnly"/>';//-제외 숫자만
 var userInfoMsg3='<spring:message code="userInfoMsg3"/>';//병원과 고객코드(ID)는 수정 할 수 없습니다.
 
 /**목표설정*/
 var bsGoalAlert1='<spring:message code="bsGoalAlert1"/>';//식사전 목표값을 입력하세요
 var bsGoalAlert2='<spring:message code="bsGoalAlert2"/>';//식사후 목표값을 입력하세요
 
 </script>







