<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="movieVO.MovieVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
	<title></title>
	<link href="head.css" rel = "stylesheet">
</head>
<body>

<div class = "wrap">
	<div class = "header" role = "banner">
		<div class = "special_bg">
			<div class = "header_logo">
				<a href = "main.jsp">
					<h1 class="logo">SMV</h1>
				</a>
				<div class="search">
					<form action="Movie_sub.do" method="post">
						<input type="text" name="mov_name" placeholder="조커"><input type="submit" value="검색">
					</form>
				</div>
			</div>	
		</div>
	</div>
	
	<!-- 네비게이션 -->
	<nav>
		<ul>
			<li class="contact">
				<a href="javascript:void(0)" class = "dropbtn"><img src = "images/menu.jpg">전체메뉴</a>
			    <div class="dropdown-content">
			      <a href="movie_all.do">영화소개</a>
			      <a href="location.jsp">찾아오는 길</a>
			      <a href="#">회사소개</a>
			    </div>
			</li>
<!-- 			<li class="contact">
				<a href="#">
					<svg viewBox="0 0 24 24" preserveAspectRatio = "xMidYMidmeet" focusable = "false" class = "icon-style" style = "pointer-events:none; display:block; width:100%; height:100%">
						<g class = "icon-style">
							<path d = "M3 18h18v-2H3v2zm0-5h18v-2h3v2zm0-7v2h18V6H3z" class = "icon-style"></path>
						</g>
					</svg>
				</a>
			</li> -->
			<li><a href="login.jsp">로그인 </a></li>
			<li><a>|</a></li>
			<li><a href="join.jsp">회원가입</a></li>
		</ul>
	</nav>	
</div>

</body>
</html>