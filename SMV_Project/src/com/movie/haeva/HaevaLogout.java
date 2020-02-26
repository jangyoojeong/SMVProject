package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HaevaLogout implements HaevaImpl{

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      
      HttpSession session = request.getSession(false);
      if(session != null) {
    	  session.removeAttribute("user_data");
      }

   }

}