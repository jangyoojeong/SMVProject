package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;

public  class HaevaInsert implements HaevaImpl{

		
	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String r_name = request.getParameter("r_name");
		String r_title = request.getParameter("r_title");
		String r_replay = request.getParameter("r_replay");
		String mov_name = request.getParameter("mov_name");
		int r_star =  Integer.parseInt(request.getParameter("star-input"));
		MovieDAO mdao = new MovieDAO();
		
		boolean result = mdao.insert_review(id, r_name, r_title, r_replay, mov_name, r_star);
		
		request.setAttribute("mov_name", mov_name);
	}
}
	


