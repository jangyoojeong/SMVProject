<%@page import="movieDAO.MovieDAO"%>
<%@page import="movieVO.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="review_layout.css" rel ="stylesheet">
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

	<div align="center">
		<h1>영화리뷰 작성 페이지</h1>
		<br><br>
		
		<form name="f1" action="rInsert.do" method="post">
			<table class="type_review2">
				<tr>
					<th>영화이름</th>
					<td>
						${ mov_name }
						<input type="hidden" name="mov_name" value="${ mov_name }">
						<!-- <input type="text" name="mov_name" size="10"> -->
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${sessionScope.user_data.getName()}
						<input type="hidden" name="id" size="10" value ="${ sessionScope.user_data.getId() }" >
						<input type="hidden" name="r_name" size="10" value ="${ sessionScope.user_data.getName() }" > 
						<!-- <input type="hidden" name="r_name" size="10" value ="" autofocus required>  -->
					</td>
				</tr>
				<tr>
					<th>리뷰 제목</th>
					<td>
						<input type="text" name="r_title" required>
					</td>
				</tr>
				<tr>
					<th>영화 평점</th>
					<td>
						<%@ include file="star_select.jsp" %>
					</td>
				</tr>
				<tr>
					<th>리뷰 내용</th>
					<td>
						<textarea rows="10" style="width: 95%;" name="r_replay" required></textarea>
					</td>
				</tr>
			</table>
			
			<div align="center">
				<input type="submit" value="작성 완료" onclick="return confirm('글작성을 완료하시겠습니까?')">
				<!-- <input type="reset" value="취소"> -->
				<a href="Movie_sub.do?mov_name=${ mov_name }"><input type="button" value="목록"></a>         
			</div>
			
		</form>
		
	</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>