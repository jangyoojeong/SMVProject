package com.movie.haeva;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HaevarMovname implements HaevaImpl{

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mov_name = request.getParameter("mov_name");
		
		request.setAttribute("mov_name", mov_name);
		
	}

}
