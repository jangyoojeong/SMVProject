package com.movie.haeva;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaSearchOne implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO mdao = new MovieDAO();
		MovieVO mvo = null;
		
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		mvo =  mdao.serchOneReview(r_num);
		mdao.hit_update(r_num);
		System.out.println(mvo.getR_num());
		
		request.setAttribute("mvo", mvo);
		
		
		
	}

}
