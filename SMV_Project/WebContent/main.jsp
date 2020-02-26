<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movieVO.MovieVO"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<link rel="stylesheet" href="css/jquery.bxslider.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/owl.theme.default.css">	

    <style>
      header {
      	/* position:fixed; */
     	 width:100%;
      }
      footer {
      	/* position:fixed; */
		width:100%;
      }
        #wrapper {
          width:700px;
          margin:0 auto;
        }
        #wrapper2 {
        	width:1000px;
        	margin:0 auto;
        }
    </style>
    <script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/jquery.bxslider.js"></script>
    <script src="js/owl.carousel.js"></script>
    <script src="js/owl.autoplay.js"></script>
	<script src="js/owl.navigation.js"></script>

    <script>
        $(function() {
          $('.bxslider').bxSlider({
						slideWidth:700,
            captions:true,
            auto:true,	/* 자동 실행 */
            autoControls:true,	/* 컨트롤버튼(재생/정지) 표시 */
            stopAutoOnclick:true,	/* 클릭해서 자동 실행 멈출 수 있도록 */
            touchEnabled:false,
            autoHover:true,
          });
        });
		$(function() {
			$('.owl-carousel').owlCarousel({
				items:5,
				margin:10,
				loop:true,
      nav:true,
      navText:['이전','다음'],					
				autoplay:true,
      autoplayTimeout:3000,
      autoplayHoverPause:false
			});
		});
    </script>
</head>
<body>

<header>
<c:if test = "${!empty user_data }"> 
	<%@ include file="login_head.jsp" %>
</c:if>
<c:if test = "${empty user_data }"> 
	<%@ include file="head.jsp" %>
</c:if>
</header>
<div class = "body">
    <div id="wrapper" align = "center">
      <div class="bxslider">
        <div>
          <a href = "Movie_sub.do?mov_name=돈"><img src="images/main2.jpg"></a> 
        </div>
        <div>
          <a href = "Movie_sub.do?mov_name=사자"><img src="images/main3.jpg"></a> 
        </div>       
        <div>
          <a href = "Movie_sub.do?mov_name=1987"><img src="images/main4.jpg"></a> 
        </div>
        <div>
          <a href = "Movie_sub.do?mov_name=엑시트"><img src="images/main6.jpg"></a> 
        </div>
        <div>
          <a href = "Movie_sub.do?mov_name=신과함께-죄와 벌"><img src="images/main7.jpg"></a> 
        </div>  
        <div>
          <a href = "Movie_sub.do?mov_name=내안의 그놈"><img src="images/main8.jpg"></a> 
        </div>     
      </div>
 	</div>
</div>
	<div id="wrapper2" align = "center">
      <div class="owl-carousel owl-theme">
		<div class="item">
			<a href = "Movie_sub.do?mov_name=사자"><img src="images/poster/movie1.jpg"></a>
		</div>
		<div class="item">
			<a href = "Movie_sub.do?mov_name=엑시트"><img src="images/poster/movie2.jpg"></a>
		</div>
		<div class="item">
			<a href = "Movie_sub.do?mov_name=타짜:원 아이드잭"><img src="images/poster/movie3.jpg"></a>
		</div>         
		<div class="item">
			<a href = "Movie_sub.do?mov_name=극한직업"><img src="images/poster/movie4.jpg"></a>
		</div>
		<div class="item">
			<a href = "Movie_sub.do?mov_name=인랑"><img src="images/poster/movie5.jpg"></a>
		</div>
		<div class="item">
			<a href = "Movie_sub.do?mov_name=돈"><img src="images/poster/movie6.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=암수살인"><img src="images/poster/movie7.jpg"></a>
		</div> 
		<div class="item">
			<a href = "Movie_sub.do?mov_name=나쁜 녀석들: 더 무비"><img src="images/poster/movie8.jpg"></a>
		</div> 
		<div class="item">
			<a href = "Movie_sub.do?mov_name=장사리 : 잊혀진 영웅들"><img src="images/poster/movie9.jpg"></a>
		</div> 
		<div class="item">
			<a href = "Movie_sub.do?mov_name=레플리카"><img src="images/poster/movie10.jpg"></a>
		</div>       
		<div class="item">
			<a href = "Movie_sub.do?mov_name=조커"><img src="images/poster/movie11.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=데드풀"><img src="images/poster/movie12.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=스파이더맨: 파 프롬 홈"><img src="images/poster/movie13.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=수어사이드 스쿼드"><img src="images/poster/movie14.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=캡틴 아메리카: 시빌 워"><img src="images/poster/movie15.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=내안의 그놈"><img src="images/poster/movie16.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=청년경찰"><img src="images/poster/movie17.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=신과함께-죄와 벌"><img src="images/poster/movie18.jpg"></a>
		</div>   
		<div class="item">
			<a href = "Movie_sub.do?mov_name=1987"><img src="images/poster/movie19.jpg"></a>
		</div>  
		<div class="item">
			<a href = "Movie_sub.do?mov_name=가장 보통의 연애"><img src="images/poster/movie20.jpg"></a>
		</div>   
	  </div>
	</div>     
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>