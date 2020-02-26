<%@page import="movieVO.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SMV 즐거운 영화의 시작</title>
<link href="my.css" rel = "stylesheet">
<link href="review_layout.css" rel ="stylesheet">
<link rel="stylesheet" href="css/jquery.bxslider.css">	
<!-- <link href="review_layout.css" rel ="stylesheet"> -->
<style>
.star-rating { width:100px; }
.star-rating,.star-rating span { display:inline-block; height:19.5px; overflow:hidden; background:url(./star.png)no-repeat; background-size: 100px}
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
</style>
	<script src="js/jquery-2.2.4.min.js"></script>
    <script src="js/jquery.bxslider.js"></script>

	<script>
    $(function() {
        $('.bxslider').bxSlider({
						slideWidth:500,
          captions:true,
          auto:true,	/* 자동 실행 */
          autoControls:false,	/* 컨트롤버튼(재생/정지) 표시 */
          stopAutoOnclick:true,	/* 클릭해서 자동 실행 멈출 수 있도록 */
          touchEnabled:false,
          autoHover:true,
        });
      });
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

	<div class = "My_body">
		<div class = "main">
			<div class = "keepList_title">
				<h2>영화 상세</h2>
			</div>
			<div class = "keeplist_main">
				<table align="center" class = "mov_table">

							<tr>
								<td rowspan = "6"><img src = "images/poster/${ sessionScope.smovie1.getP_image()}"></td>
								<th colspan = "2"><h>${ sessionScope.smovie1.getMov_name()}</h><subname>${ sessionScope.smovie1.getSub_name()}</subname></th>
							</tr>
							<tr>
								<td><subname>평점: </subname></td>
								<td><%@ include file="star.jsp" %></td>
							</tr>
							<tr>
								<td><subname>감독: </subname></td>
								<td>${ sessionScope.smovie1.getP_dir()}</td>
							</tr>
							<tr>
								<td><subname>배우: </subname></td>
								<td> ${ sessionScope.smovie1.getP_app()} </td>
							</tr>
							<tr>
								<td><subname>장르: </subname></td>
								<td>${ sessionScope.smovie1.getP_content()}</td>
							</tr>
							<tr>
								<td><subname>기본: </subname></td>
								<td>${ sessionScope.smovie1.getP_grade()}</td>
							</tr>
					</table>
					<div class = story>
						 ${ sessionScope.smovie1.getP_summary()}
					
					</div>
					
				</div>	
			<div class = "keepList_title">
				<h2>트레일러</h2>
			</div>
			
			<div class = "bxslider_view">
				<div class = "tra">
					<iframe width="600" height="400" src="${ sessionScope.smovie1.getP_trailer()}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				
				
				</div>
			
			
			</div>
		
			<div class = "wrapper" align = "center">
				<div class = "keepList_title">
					<h2>포토</h2>
				</div>
	
			    <div class = "bxslider_view">
			      <div class="bxslider">
			        <div>
			          <a><img src="images/photh/${ sessionScope.smovie1.getP_photo1()}"></a> 
			        </div>
			        <div>
			          <a><img src="images/photh/${ sessionScope.smovie1.getP_photo2()}"></a> 
			        </div>
			        <div>
			          <a><img src="images/photh/${ sessionScope.smovie1.getP_photo3()}"></a> 
			        </div>       
			        
			      </div>
			      
			    </div>
		 	
		 	</div>	
		
			<div class = "keepList_title">
				<h2>리뷰</h2>
			</div>
		<div class = "review">	
		<table class="type_review">
         <thead>
		      <tr class = "head">         
		             <td colspan="3" align="left">
		                <c:if test = "${empty user_data }">
		                <div class = "button"><input type="button" value="글 작성" onclick="press(this)"></div>
		                <Script>
		                   function press() {
		                         alert("로그인 후 이용가능합니다.")
		                         location.href = "login.jsp";
		                   }
		                </Script>
		                     
		                </c:if>
		                <c:if test = "${!empty user_data }">
		                <form action="rMovname.do" method="post"> 
		                   <div class = "button"><input type="submit" value="글 작성"></div>
		                   <input type="hidden" name="mov_name" value="${ sessionScope.smovie1.getMov_name()}">
		                        
		                </form>
		                </c:if>           
		             </td>
		             <td colspan="4" align="right">
		                <form action="Movie_sub.do" method="post">
		                   <div class = "button2"><input type="text" name="r_search" placeholder="제목검색"><input type="submit" value="검색"></div>
		                   <input type="hidden" name="mov_name" value="${ sessionScope.smovie1.getMov_name()}">
		                </form>
		             </td>               
		       </tr>
            <tr>
               <th>조회수</th>
               <th>아이디</th>
               <th>작성자</th>
               <th>제목</th>
               <th>작성일</th>
               <th>영화이름</th>
               <th>평점</th>
               
            </tr>
         </thead>
         
         <tbody>   
            <c:if test="${review_page.hasNoArticles()}">
               <tr>
                  <td colspan="7" align="center">게시글이 없습니다.</td>
               </tr>
            </c:if>
          <c:forEach var="re1" items="${review_page.mvo}" > <!-- ListServiceImpl.java페이지에서 저장한 board_list이용 -->
               <tr>
                  <td>${re1.r_hit }</td>
                  <td>${re1.id }</td> 
                  <td>${re1.r_name }</td>
                  <td>
                     <a href="rSearchOne.do?r_num=${re1.r_num }&&r_name=${re1.r_name}">
                        ${re1.r_title }
                     </a> 
                  </td>
                  <td>${re1.r_date }</td>
                  <%-- <td><fmt:formatDate value="${re1.r_date }" pattern="yyyy-MM-dd a HH:mm:ss"/></td> --%>
                  <td>${re1.mov_name }</td>
                  
                  <td>
                     <span class='star-rating'>
                     	<span style ="width:${re1.r_star }%"></span>
                     </span>
                     <span style = "vertical-align:top"></span> 
                  </td>
                  
               </tr>
            </c:forEach>
<%--             <c:if test="${review_page.hasArticles()}">
               <tr>
                  <td colspan="6">
                     <c:if test="${review_page.startPage > 5}">
                        <a href="Movie_sub.do?pageNo=${review_page.startPage - 5 }&mov_name=${ sessionScope.smovie1.getMov_name()}">[이전]</a>
                        
                     </c:if>
                     <c:forEach var = "pNo" begin = "${review_page.startPage}" end="${review_page.endPage }">
                        <a href = "Movie_sub.do?pageNo=${pNo}&mov_name=${ sessionScope.smovie1.getMov_name()}">[${pNo}]</a>
            
                     </c:forEach>
                     <c:if test="${review_page.endPage < review_page.totalPages }">
                        <a href = "Movie_sub.do?pageNo=${review_page.startPage + 5}&mov_name=${ sessionScope.smovie1.getMov_name()}">[다음]</a>
                     </c:if>
                  </td>
               </tr>
            </c:if> --%>
         </tbody>
		<tfoot>
            <c:if test="${review_page.hasArticles()}">
                  <tr>
                     <td colspan="7">
                        <c:if test="${review_page.startPage > 5}">
                           <a href="Movie_sub.do?pageNo=${review_page.startPage - 5 }&mov_name=${ sessionScope.smovie1.getMov_name()}">[이전]</a>
                           
                        </c:if>
                        <c:forEach var = "pNo" begin = "${review_page.startPage}" end="${review_page.endPage }">
                           <a href = "Movie_sub.do?pageNo=${pNo}&mov_name=${ sessionScope.smovie1.getMov_name()}">[${pNo}]</a>
               
                        </c:forEach>
                        <c:if test="${review_page.endPage < review_page.totalPages }">
                           <a href = "Movie_sub.do?pageNo=${review_page.startPage + 5}&mov_name=${ sessionScope.smovie1.getMov_name()}">[다음]</a>
                        </c:if>
                     </td>
                  </tr>
            </c:if>
		</tfoot>
      </table>
	</div>
   </div>
</div>
<footer>
<%@ include file="foot.jsp" %>
</footer>
</body>
</html>