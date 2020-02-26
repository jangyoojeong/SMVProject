<%@page import="java.util.ArrayList"%>
<%@page import="movieDAO.MovieDAO"%>
<%@page import="movieVO.MovieVO"%>
<%@page import="javax.xml.bind.ParseConversionEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%   
   MovieVO mvo = (MovieVO) session.getAttribute("smovie1");

   String mov_name = (String) mvo.getMov_name();
   
   
   int star = 0; double star_all, jumsu;
   
   MovieDAO mvdao1 = new MovieDAO();
   
   ArrayList<MovieVO> serchReview = new ArrayList<MovieVO>();
   serchReview = mvdao1.serchReview(mov_name);
   int person = serchReview.size();
   
   for(int i=0; i<serchReview.size(); i++)
      star += serchReview.get(i).getR_star();
   
   if(star == 0) {
      star_all = 0.0;
      jumsu = 0.0;
   } else {
      star_all = (double)(star / person);
      jumsu = (double)star_all / 10;
      System.out.println("몇점?" + star_all);
      
   }
   
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.star-rating { width:100px; }
.star-rating,.star-rating span { display:inline-block; height:19.5px; overflow:hidden; background:url(./star.png)no-repeat; background-size: 100px}
.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }

</style>
</head>
<body>
<span class='star-rating'>
<span style ="width:<%=star_all%>%"></span>
</span>
<span style = "vertical-align:top"><b><%=jumsu%></b>점 | (<%=person%>)명 참여</span> 
  </body>
</html>