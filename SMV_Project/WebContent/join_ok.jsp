<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<link href="login.css" rel = "stylesheet">
</head>
<body>
<header>
<%@ include file="head.jsp" %>
</header>

<div class = "main">
	<div class = "loginbox">
		<nav>
			<ul>
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="#" class="current">회원가입</a></li>
			</ul>
		</nav>
		<div class = "mainlogin">
			<form action="login.jsp" method="post">
				<div class = "join_ok">
					${name }님 회원가입을 축하드립니다
				</div><br>
				<div class = "join">
					<input type="button" name = "cancle" value = "돌아가기" onClick = "location.href='main.jsp'">
					<input type="submit" name = "join" value = "로그인하러가기">
				</div>			
			</form>

		</div>	
	</div>
</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>