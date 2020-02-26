<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<script src = "js/jquery-1.4.4.min.js"></script>
<script type = "text/javascript" src = "https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="login.css" rel = "stylesheet">
<script>
   
    function pwCheck() {
       
       if(f1.pw.value == "" && f1.pw2.value != "") {
          document.getElementById("pw_check").innerHTML="비밀번호를 먼저 입력해주세요";
          f1.pw2.value="";
       }
       else if(f1.pw2.value == "") {
          document.getElementById("pw_check").innerHTML="";
       }
       else if(f1.pw.value == f1.pw2.value) {
          document.getElementById("pw_check").innerHTML="비밀번호가 일치합니다";
    	}
       else {
          document.getElementById("pw_check").innerHTML="비밀번호가 일치하지않습니다";
          f1.pw2.focus();
       }   
    } 
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

<div class = "main">
	<div class = "loginbox">
		<nav>
			<ul>
				<li><a href="#" class="current">회원정보 수정</a></li>
			</ul>
		</nav>
		<div class = "mainlogin">
			<form name = "f1" action="mem_update.do" method="post">
				<table align = "center">
					<tbody class = "table01">
						<tr>		
							<td>아이디</td>
							<td><input type="text" name = "id" value = "${ sessionScope.user_data.getId()}" required readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name = "pw" autofocus required></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<!-- <td><input type="password" name = "pw2" ></td> -->
							<td><input type="password" name = "pw2" required onkeyup = "pwCheck();"></td>
							
						</tr>
						<tr>
							<td></td>
							<td><div class = "check_font" id = "pw_check"></div></td><!-- 경고문이 들어올곳 -->
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name = "name" required placeholder = "${ sessionScope.user_data.getName()}"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name = "birthd" required placeholder = "${ sessionScope.user_data.getBirthd()}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name = "email" required placeholder = "${ sessionScope.user_data.getEmail()}"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="tel" name = "tel" required placeholder = "${ sessionScope.user_data.getTel()}"></td>
						</tr>
					</tbody>
		
				
					<tfoot>
						<tr>
							<td colspan = "3">
								<input type="button" name = "cancle" value = "취소" onClick = "location.href='main.jsp'">
								<input type="submit" name = "update" value = "수정완료" onclick="return confirm('수정을 완료하시겠습니까?')">
							</td>
							
						</tr>
					</tfoot>
		
				</table>
			</form>

		</div>	
	</div>
</div>

<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>