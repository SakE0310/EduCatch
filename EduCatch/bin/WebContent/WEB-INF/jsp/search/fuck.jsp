<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('.starRev span').click(function(){
			  $(this).parent().children('span').removeClass('on');
			  $(this).addClass('on').prevAll('span').addClass('on');
			  return false;
			});
	});
	</script>
	
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>

</head>

<body>
<div class="starRev">
  <span class="starR1 on">별1_왼쪽</span>
  <span class="starR2">별1_오른쪽</span>
  <span class="starR1">별2_왼쪽</span>
  <span class="starR2">별2_오른쪽</span>
  <span class="starR1">별3_왼쪽</span>
  <span class="starR2">별3_오른쪽</span>
  <span class="starR1">별4_왼쪽</span>
  <span class="starR2">별4_오른쪽</span>
  <span class="starR1">별5_왼쪽</span>
  <span class="starR2">별5_오른쪽</span>
</div>
</body>
</html>