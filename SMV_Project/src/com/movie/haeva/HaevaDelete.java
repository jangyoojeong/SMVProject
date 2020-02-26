package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaDelete implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO modao = new MovieDAO();
		MovieVO mvo = new MovieVO();
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		modao.delete_review(r_num);
		
		
	}

}
