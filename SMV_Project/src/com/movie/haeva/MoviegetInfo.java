package com.movie.haeva;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class MoviegetInfo implements HaevaImpl {
   
   private int size = 5;
   /*private HaevaReviewListPage_ listService = new HaevaReviewListPage_();*/
   
   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      
      String mov_name = request.getParameter("mov_name");
      //String test = request.getParameter("test");
      String r_search = request.getParameter("r_search");
      
      
      System.out.println("나 영화이름"+mov_name);
      
      MovieDAO mdao = new MovieDAO();
      ArrayList<MovieVO> mvo = null;
      
      MovieVO mvo2 = mdao.mov_getInfo(mov_name);///////////////////
      
      
      /*mvo =  mdao.serchReview(mov_name);*/
      /*mvo2 = mdao.getInfo(mov_name);*/
  


      /*request.setAttribute("mvo", mvo);*/
      //request.setAttribute("movie1", mvo2);
      request.getSession().setAttribute("smovie1", mvo2);
      
   /*   request.setAttribute("mov_name", mov_name);*/
      
      ///////////////////////////////////////////////////   
      
      String pageNoVal = request.getParameter("pageNo");
      /*System.out.println(pageNoVal);*/
      int pageNo = 1;
      if(pageNoVal != null) {
         pageNo = Integer.parseInt(pageNoVal);
      }
      
      int total = 0;      
      
      
      if(r_search == null) {
         total = mdao.r_count(mov_name);
         /*System.out.println(total);*/
         mvo = mdao.paging(mov_name,(pageNo-1) * size, ((pageNo-1) * size)+size);   
         HaevaReviewPage review_page = new HaevaReviewPage(total, pageNo, size, mvo);
         
/*         System.out.println(review_page);*/
         request.setAttribute("review_page", review_page);
         
         
      } else {
         total = mdao.search_r_count(r_search, mov_name);
         /*mvo1 = mdao.title_search(r_search, mov_name);*/
         
         
         mvo = mdao.title_searchpaging(r_search, mov_name,(pageNo-1) * size, ((pageNo-1) * size)+size);   
         HaevaReviewPage review_page = new HaevaReviewPage(total, pageNo, size, mvo);
         
/*         System.out.println(review_page);*/
         request.setAttribute("review_page", review_page);
         
         
      }

      
   }
   
}