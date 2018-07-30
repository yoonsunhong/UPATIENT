var GoogleApp = {
     auth2: {},
     // 초기화
     init: function() {
          gapi.load('auth2', function() {
               GoogleApp.auth2 = gapi.auth2.init({
                    client_id: '407310271718-68c2bclm9ntl5gg7li8aksf0gboncvmd.apps.googleusercontent.com',
                    cookiepolicy: 'single_host_origin',
               });
 
               // 특정 노드에 구글 로그인 버튼 연동
               GoogleApp.attachSignin(document.getElementById('google_join_btn'));
          });
     },
     // 특정 노드에 구글 로그인 연동
     attachSignin: function(element) {
          // 버튼 노드, ?, 로그인 성공시 콜백함수, 로그인 실패시 콜백함수
          GoogleApp.auth2.attachClickHandler(element, {}, GoogleApp.signinCallback, GoogleApp.signinFailure);
     },
     // 로그인 성공시 콜백함수
     signinCallback: function(googleUser) {
          var id = googleUser.getBasicProfile().getId();
          var memberName = googleUser.getBasicProfile().getName();
          var email = googleUser.getBasicProfile().getEmail();
          var token = googleUser.getAuthResponse().access_token;
 
          // 실행할 코드
     },
     // 로그인 실패시 콜백함수
     signinFailure: function(error) {
          console.log(JSON.stringify(error, undefined, 2));
     }
};
// 초기화 실행
GoogleApp.init();