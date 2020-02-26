package com.movie.haeva;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaLogin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO mdao = new MovieDAO();
		MovieVO mvo = new MovieVO();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String d = request.getParameter("cookie");
		
		mvo = mdao.login(id, pw);
		
		if (mvo != null){
/*			request.setAttribute("user_data", mvo);
			request.setAttribute("id", id);*/
			request.setAttribute("fail", 0);
			request.getSession().setAttribute("user_data", mvo);
			//request.getSession().setAttribute("id", id);
			
			if (d != null) {
				Cookie c = new Cookie("id", d);
				c.setMaxAge(60*100);
				c.setPath("/");
				response.addCookie(c);
				System.out.println(c);
			}
		} else if (mvo == null){
			request.setAttribute("fail", 1);
			//throw new LoginFailException();
		}
	}

}
