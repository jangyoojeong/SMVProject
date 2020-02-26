<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%
	int fail = Integer.parseInt(request.getParameter("fail"));

	if (fail == 0) {
		response.sendRedirect("main.jpg");
	} else if (fail == 1) {
		alert("아이디 혹은 비밀번호가 잘못되었습니다");
		f1.id.focus();
		
	}


%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<script src = "js/jquery-1.4.4.min.js"></script>
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="login.css" rel = "stylesheet">
<script>
   
/*  	function login() {
	   
	   $.ajax({
			url: "login.do",
			data: {			
				id: $('#id'),
				pw: $('#pw'),
			},
			dataType:"text",
			type:"post",
			dataType:"text",
			
			success : function(data) {

 				if (data == 0) {
 					alert("로그인 성공");
 					response.sendRedirect("main.jpg");
				} else if (data == 1) {
					alert("아이디 혹은 비밀번호가 잘못되었습니다");
					$("#id").focus();
				}

			}, error : function() {
				console.log("실패");
			}
	});
}  */
</script>
</head>
<body>
<header>
<%@ include file="head.jsp" %>
</header>

<div class = "main">
	<div class = "loginbox">
		<nav>
			<ul>
				<li><a href="#" class="current">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>
			</ul>
		</nav>
		<div class = "mainlogin">
			<form name = "f1" action="login.do" method="post">
				<table align = "center">
					<tbody class = "loginbtn">
						<tr>
							<td><input type="text" name="id" id = "id" placeholder="아이디"  autofocus required><td>
							<td rowspan="2"><input type="submit" name = "login" value="login"></td>
							<!-- <td rowspan="2"><input type="button" name = "login" value="login" onclick = "login()"></td> -->
						</tr>
						<tr>
							<td><input type="password" name="pw" placeholder="비밀번호" required><td>
						</tr>
					</tbody>
					<tfoot align = "left">
						<tr>
							<td colspan="2"><input type="checkbox" name="cookie" value="true">아이디 저장<td>
						</tr>
					</tfoot>
				</table>
			</form>
			<div class = "foot">
				<a href = "#">아이디 혹은 비밀번호를 잊으셨나요?</a>
			</div>
		</div>	
	</div>
</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>