<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<link href="my.css" rel = "stylesheet">
<style>
.star-rating { width:100px; }
.star-rating,.star-rating span { display:inline-block; height:19.5px; overflow:hidden; background:url(./star.png)no-repeat; background-size: 100px}
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
<script src="js/jquery-2.2.4.min.js"></script>
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
			<div class = "keepList_title">
				<h2>영화소개</h2>
			</div>
			<div class = "keeplist_main">
				<table align = "center">
					
					<c:forEach var = "mo1" items="${movie_allview }">
						<tr>
							<td>
								<table  class = "mov_table">
										<tr>
											<td rowspan = "5"><a href = "Movie_sub.do?mov_name=${mo1.mov_name}"><img src = "images/poster/${mo1.p_image}"></a></td>
											<th colspan = "2"><h>${mo1.mov_name}</h><subname>${mo1.sub_name}</subname></th>
										</tr>
<%-- 										<tr>
											<td><subname>평점: </subname></td>
											<td><%@ include file="star.jsp" %></td>
										</tr> --%>
										<tr>
											<td><subname>감독: </subname></td>
											<td>${mo1.p_dir}</td>
										</tr>
										<tr>
											<td><subname>배우: </subname></td>
											<td> ${mo1.p_app} </td>
										</tr>
										<tr>
											<td><subname>장르: </subname></td>
											<td>${mo1.p_content}</td>
										</tr>
										<tr>
											<td><subname>기본: </subname></td>
											<td>${mo1.p_grade}</td>
										</tr>
								</table>
							</td>
						</tr>
					</c:forEach>	
								
				</table>
			</div>
		</div>
	</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>