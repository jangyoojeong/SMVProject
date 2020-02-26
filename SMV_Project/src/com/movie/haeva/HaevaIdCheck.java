package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;

public class HaevaIdCheck implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		MovieDAO mdao = new MovieDAO();
		String id = request.getParameter("user_id");
		int cnt;
		
		if (id == "") {
			cnt = 3;
			request.setAttribute("data", cnt);
		} else {
			cnt = mdao.checkOverId(id);
			request.setAttribute("data", cnt);
		}
		System.out.println(cnt);
		
	}

}
