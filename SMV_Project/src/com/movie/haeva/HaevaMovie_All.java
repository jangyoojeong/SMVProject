package com.movie.haeva;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;
import movieVO.MovieVO;

public class HaevaMovie_All implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO mdao = new MovieDAO();
		ArrayList<MovieVO> mvo = null;
		
		mvo = mdao.Movie_All();
		
		request.setAttribute("movie_allview", mvo);
		
	}

}
