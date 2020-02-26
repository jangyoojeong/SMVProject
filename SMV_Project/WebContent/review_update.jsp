<%@page import="movieDAO.MovieDAO"%>
<%@page import="movieVO.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	MovieVO mv = (MovieVO)session.getAttribute("smvo");
	String id = (String) mv.getId();
	System.out.println(id + "여기도? 세션 잘 유지되넹 ㅎㅎ");
%> --%>
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
		<h1>영화리뷰 수정 페이지</h1>
		<br><br>
	
		
		<form action="rUpdate.do" method="post">
			
			<table class="type_review2">
				
				<tr>
					<th>글 번호</th>
					<td>
						${mvo.r_num }
					</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>
						${mvo.r_name }
					</td>
				</tr>
				<tr>
					<th>글 제목</th>
					<td>
						<input type="text" name="r_title" value="${mvo.r_title }" required>
					</td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td>
						<textarea rows="10" style="width: 95%;" name="r_replay" required>${mvo.r_replay } 
						</textarea>
					</td>
				</tr>

				
			</table>
			
				
				
				
			<div align="center">
				<input type="submit" value="수정 하기" onclick="return confirm('글수정을 완료하시겠습니까?')">
				<input type="hidden" name="r_num" value="${mvo.r_num }">
				<input type="hidden" name="mov_name" value="${mvo.mov_name }">   
				<a href="Movie_sub.do?mov_name=${mvo.mov_name }"><input type="submit" value="목록"></a>         
			</div>
			</form>
		
		
	</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>