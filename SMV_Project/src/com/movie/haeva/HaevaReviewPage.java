package com.movie.haeva;

import java.util.ArrayList;


import movieVO.MovieVO;

public class HaevaReviewPage {
   private int total;   //��Ī�� �Խñ� ��
   private int currentPage;   //���� ������
   private ArrayList<MovieVO> mvo;   //ȭ�鿡 ����� �Խñ� ���
   private int totalPages;   //��ü ������ ����
   private int startPage;   //���� ������ ��ȣ
   private int endPage;   //�� ������ ��ȣ
   

      
      //size : �� �������� ������ �Խñ� ���� ��, ���ñ� ������ size�� ���� ���� ������ ������ �����.
      public HaevaReviewPage(int total, int currentPage, int size, ArrayList<MovieVO> mvo) {
         this.total = total;
         this.currentPage = currentPage;
         this.mvo = mvo;
         if(total == 0) {   //��Ī�� �Խñ��� ������, ��� 0���� �Ҵ�
            totalPages = 0;
            startPage = 0;
            endPage = 0;
         } else {         //��Ī�� �Խñ��� ������
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