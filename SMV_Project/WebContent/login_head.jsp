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
						<input type="text" name="search" placeholder="조커"><input type="submit" value="검색">
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
			<li><a href="logout.do">로그아웃 </a></li>
			<li><a>|</a></li>
			<li><a href="mypage.jsp">Mypage</a></li>
		</ul>
	</nav>	
</div>

</body>
</html>