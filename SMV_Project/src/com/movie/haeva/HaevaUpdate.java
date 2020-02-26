package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaUpdate implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		MovieDAO mdao = null;
		MovieVO mvo = null;
		
		String r_title = request.getParameter("r_title");
		String r_replay = request.getParameter("r_replay");
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		mdao = new MovieDAO();
		mdao.update_review(r_title, r_replay, r_num);
		
		
		
		
	}
}
