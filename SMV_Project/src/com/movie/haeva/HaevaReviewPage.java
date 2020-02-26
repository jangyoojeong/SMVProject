package com.movie.haeva;

import java.util.ArrayList;


import movieVO.MovieVO;

public class HaevaReviewPage {
   private int total;   //서칭된 게시글 수
   private int currentPage;   //현재 페이지
   private ArrayList<MovieVO> mvo;   //화면에 출력할 게시글 목록
   private int totalPages;   //전체 페이지 개수
   private int startPage;   //시작 페이지 번호
   private int endPage;   //끝 페이지 번호
   

      
      //size : 한 페이지에 보여줄 게시글 개수 즉, 개시글 개수를 size로 나눈 값을 페이지 개수로 사용함.
      public HaevaReviewPage(int total, int currentPage, int size, ArrayList<MovieVO> mvo) {
         this.total = total;
         this.currentPage = currentPage;
         this.mvo = mvo;
         if(total == 0) {   //서칭된 게시글이 없을때, 모두 0으로 할당
            totalPages = 0;
            startPage = 0;
            endPage = 0;
         } else {         //서칭된 게시글이 있을떄
            totalPages = total / size;
            if(total % size>0) {
               totalPages++;
            }
            int modVal = currentPage % 5;
            startPage = currentPage / 5 * 5 + 1;
            if(modVal == 0) {
               startPage -=5;
            }
            
            endPage = startPage + 4;
            if(endPage > totalPages) {
               endPage = totalPages;
            }
         }
         
      }
      

   public int getTotal() {
      return total;
   }

   public boolean hasNoArticles() {
      return total == 0;
   }
   
   public boolean hasArticles() {
      return total > 0;
   }

   public int getCurrentPage() {
      return currentPage;
   }

   public int getTotalPages() {
      return totalPages;
   }
   
   public ArrayList<MovieVO> getMvo() {
      return mvo;
   }
   
   public int getStartPage() {
      return startPage;
   }
   
   public int getEndPage() {
      return endPage;
   }


}