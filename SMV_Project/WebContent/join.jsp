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
   
	function checkID() {

	   var user_id = $('#user_id').val();
	   
	   $.ajax({
			url: "idCheck.do",
			data: {			
				user_id: user_id,
			},
			dataType:"text",
			type:"post",
			dataType:"text",
			
			success : function(data) {


 				if (data == 1) {
					$("#id_check").text("사용중인 아이디입니다 :p");
					//user_id.value = "";
					//$("#id_check").text(data);
						$("#id_check").css("color", "red");
						/* $("#reg_submit").attr("disabled", true); */
					} else if (data == 0) {
						
						$("#id_check").text(user_id+"는 사용가능합니다");
						//$("#id_check").text(user_id+data);
						$("#id_check").css("color", "blue");
						
					} else if (data == 3) {
						$("#id_check").text("아이디를 입력해주세요");
						//$("#id_check").text(user_id+data);
						$("#id_check").css("color", "red");
	 				  }
								
			}, error : function() {
				console.log("실패");
			}
	});
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
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="#" class="current">회원가입</a></li>
			</ul>
		</nav>
		<div class = "mainlogin">
			<form name = "f1" action="join.do" method="post">
				<table align = "center">
					<tbody class = "table01">
						<tr>		
							<td>아이디</td>
							<td><input type="text" name = "id" id = "user_id" autofocus required></td>
							<td><input type="button" name = "idcheck" id = "idcheck" value = "ID중복확인" onclick= "checkID()"></td>
							<%-- <input type="button" name = "idcheck", id = "idcheck" onclick="checkID(this)> --%>
							<%-- <td><input type="text" name = "id" autofocus><input type="submit" name = "idcheck" value = "id중복확인"></td> --%>
						</tr>
						<tr>
							<td></td>
							<td><div class = "check_font" id = "id_check"></div></td><!-- 경고문이 들어올곳 -->
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name = "pw" required></td>
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
							<td><input type="text" name = "name" required></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="date" name = "birthd" required></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name = "email" required placeholder = " 예) smv1234@seemovie.com"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="tel" name = "tel" required placeholder = " '-' 없이 번호만 입력해주세요"></td>
						</tr>
					</tbody>
		
				
					<tfoot>
						<tr>
							<td colspan = "3">
								<input type="button" name = "cancle" value = "취소" onClick = "location.href='main.jsp'">
								<input type="submit" name = "join" value = "가입하기" onclick="return confirm('회원가입을 완료하시겠습니까?')">
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