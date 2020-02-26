package com.movie.haeva;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movieDAO.MovieDAO;

public class HaevaJoin implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO mdao = new MovieDAO();
		
		String id = request.getParameter("id");
		String password = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthd = request.getParameter("birthd");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		//System.out.println(id +"/"+ password +"/"+ name +"/"+ birthd +"/"+ email +"/"+ tel);
		mdao.join(id, password, name, birthd, email, tel);
		
		System.out.println(id + "/" + password+ "/" + name+ "/" + birthd+ "/" + email+ "/" + tel);
		
		request.setAttribute("name", name);
		System.out.println(name);
	
	}

}
