<%@page import="movieVO.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<title>SMV 즐거운 영화의 시작</title>
<!-- <link href="style_backno.css" rel="stylesheet" type="text/css">
<link rel ="stylesheet" href="style-login.css"> -->
<link href="review_layout.css" rel ="stylesheet">
<link href="my.css" rel = "stylesheet">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	<div class = "main" align="center">
	
		<div class = "keepList_title">
			<h2>영화 상세</h2>
		</div>
		<div class = "keeplist_main">
		<table class="type03">
			<tr>
				<th width="20%">글 번호</th>
				<td width="30%">${mvo.r_num }</td>
				
				<th width="20%">조회수</th>
				<td width="30%">${mvo.r_hit }</td>
			</tr>
			<tr>
				<th width="20%">작성자</th>
				<td width="30%">${mvo.r_name}</td>
				<th width="20%">작성일</th>
				<td width="30%">${mvo.r_date }</td>
				<%-- <td width="30%"><fmt:formatDate value="${mvo.r_date }" pattern="yyyy-MM-dd a HH:mm:ss"/></td> --%>
			</tr>
			
			<tr>
				<th width="20%">제목</th>
				<td colspan="3" width="30%">${mvo.r_title }</td>
			</tr>
			<tr>
				<th width="20%">내용</th>
				<td colspan="3" width="30%" height="120px">${mvo.r_replay }</td>
			</tr>
			

		</table>
		
		<div align="center">	
		<c:if test = "${empty user_data or !user_data.getName() eq r_name}" > 
				<a href="Movie_sub.do?mov_name=${mvo.mov_name }">
				<input type="button" value="목록"></a>
				<input type="hidden" name="r_num" value="${mvo.r_num}">
				<input type="hidden" name="mov_name" value="${mvo.mov_name}">
		</c:if>
		<c:if test = "${!empty user_data or user_data.getName() eq r_name}" > 
			<form action= "rDelete.do" method="post">
				<a href="rSearchOneU.do?r_num=${mvo.r_num }">
				<input type="button" value="수정"></a>
				<input type="submit" value="삭제" onclick="return confirm('글을 삭제하시겠습니까?')">
				<a href="Movie_sub.do?mov_name=${mvo.mov_name }">
				<input type="button" value="목록"></a>
				<input type="hidden" name="r_num" value="${mvo.r_num}">
				<input type="hidden" name="mov_name" value="${mvo.mov_name}">
			</form>
		</c:if>						<%-- <a href="rDelete.do?r_num=${mvo.r_num }"><input type="button" value="삭제" onclick="return confirm('글을 삭제하시겠습니까?')"></a>&nbsp;&nbsp; --%>
		</div>
	
		</div>
	</div>
</div>
</body>
</html>