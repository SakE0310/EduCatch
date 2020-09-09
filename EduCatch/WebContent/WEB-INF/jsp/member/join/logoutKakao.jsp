<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// init 부분의 key값은 kakao developer에서 발급받아 변경
	Kakao.init('6b4dabec7bbdb2661fd8591e728271ce');
	Kakao.isInitialized();
	// SDK 초기화 여부를 판단합니다.
	//console.log(Kakao.isInitialized());
	// @breif 카카오 로그인 버튼을 생성합니다.
</script>
<script type="text/javascript">
window.onload = function(){
	if (!Kakao.Auth.getAccessToken()) {
	      console.log('Not logged in.');
	      return
	  }
	 Kakao.Auth.logout(function() {
	      console.log('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
	  })
	  location.href="logoutk.ec";
}
</script>
</head>
<body>

</body>
</html>