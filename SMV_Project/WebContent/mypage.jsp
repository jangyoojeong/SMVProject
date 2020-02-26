<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<link href="my.css" rel = "stylesheet">
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
	
	<div class = "My_body">
		<div class = "main">
			<div class = "mypage">
				<div class = "mypage_title">
					<h2>MyPage</h2>
				</div>
				<div class = "mypage_mid">
					<table>
						<tr>
							<td rowspan="2"><img src = "images/user.jpg"></td>
							<th>${sessionScope.user_data.getName()}</th>
						</tr>
						<tr>
							<td>${sessionScope.user_data.getId()}</td>
						</tr>
					</table>
				</div>
				<div class = "mypage_bottom">
					<form action="MemUpdate.jsp" method = "post">
						<table>
							<tr>
								<th>고객명</th>
								<td>${sessionScope.user_data.getName()}</td>
								<td rowspan = "4"><input type="submit" value="회원정보 수정"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${sessionScope.user_data.getEmail()}</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>${sessionScope.user_data.getBirthd()}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${sessionScope.user_data.getTel()}</td>
								
							</tr>
						</table>
					</form>
				</div>
				
				<div class = "keepList_title">
					<h2>Keep List</h2>
				</div>
				<div class = "keeplist_main">
					<table align="center">

							<tr>
								<td rowspan = "7"><img src = "images/poster/movie1.jpg"></td>
								<th colspan = "2"><h>조커</h><subname>Joker, 2019</subname></th>
							</tr>
							<tr>
								<td><subname>평점: </subname></td>
								<td>7점</td>
							</tr>
							<tr>
								<td><subname>감독: </subname></td>
								<td>토드 필립스</td>
							</tr>
							<tr>
								<td><subname>배우: </subname></td>
								<td>호야킨 피닉스, 재지 비츠, 로버트 드 니로</td>
							</tr>
							<tr>
								<td><subname>장르: </subname></td>
								<td>액션, 드라마, 스릴러</td>
							</tr>
							<tr>
								<td><subname>기본: </subname></td>
								<td>미국 | 123분</td>
							</tr>
							<tr>
								<td><subname>개봉: </subname></td>
								<td>2019.10.02</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>