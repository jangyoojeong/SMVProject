package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaMemUpdate implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		MovieDAO mdao = new MovieDAO();
		MovieVO mvo = new MovieVO();
		
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthd = request.getParameter("birthd");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		
		mdao.memUpdate(id, password, name, birthd, email, tel);

		mvo = mdao.login(id, password);
		request.getSession().setAttribute("user_data", mvo);
		
	}

}
