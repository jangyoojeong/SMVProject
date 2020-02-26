package com.movie.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie.haeva.HaevaDelete;
import com.movie.haeva.HaevaIdCheck;
import com.movie.haeva.HaevaImpl;
import com.movie.haeva.HaevaInsert;
import com.movie.haeva.HaevaJoin;
import com.movie.haeva.HaevaLogin;
import com.movie.haeva.HaevaLogout;
import com.movie.haeva.HaevaMemUpdate;
import com.movie.haeva.HaevaMovie_All;
import com.movie.haeva.HaevaSearchOne;
import com.movie.haeva.HaevaUpdate;
import com.movie.haeva.HaevarMovname;
import com.movie.haeva.MoviegetInfo;



/**
 * Servlet implementation class MovieFrontController
 */
@WebServlet("*.do")

public class MovieFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String 		c 	= request.getRequestURI().substring(request.getContextPath().length());
		String 		str = null;
		HaevaImpl 	hi  = null;
		
		switch(c) {			
		case "/Movie_sub.do":
		/*case "/paging.do":*/
			hi = new MoviegetInfo();			
				try {								
					hi.haeva(request,response);
					str = "movie_view.jsp";
				} catch (Exception e) {
					e.printStackTrace();
					str = "movie_view.jsp";
				}
				
				break;
				
	    case "/logout.do":
	        hi = new HaevaLogout();
	        try {
	           hi.haeva(request, response);   
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        str = "main.jsp";
	        break;
	        
	    case "/movie_all.do":
	        hi = new HaevaMovie_All();
	        try {
	           hi.haeva(request, response);   
	        } catch (Exception e) {
	           e.printStackTrace();
	        }
	        str = "movie_allview.jsp";
	        
	        break;
	    case "/rSearchOne.do":
			hi = new HaevaSearchOne();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "review_view.jsp";
			break;
		case "/rInsert.do":
			hi = new HaevaInsert();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/Movie_sub.do";
			//str = "review_form.jsp";
			break;
		case "/rUpdate.do":
			hi = new HaevaUpdate();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/Movie_sub.do";
			break;
		case "/rDelete.do":
			hi = new HaevaDelete();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/Movie_sub.do";
			break;	

		}
		
			
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String 		c 	= request.getRequestURI().substring(request.getContextPath().length());
		String 		str = null;
		HaevaImpl 	hi  = null;
		System.out.println(c);
		
		switch(c) {
		case "/login.do":
			hi = new HaevaLogin();
				try {
					hi.haeva(request,response);
					//str = "req_login.jsp";
					str = "main.jsp";
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
			break;
		
		case "/idCheck.do":
			hi = new HaevaIdCheck();
				try {
					hi.haeva(request,response);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				str = "req_idcheck.jsp";
				
			break;
			
		case "/join.do":
			hi = new HaevaJoin();
				try {
					hi.haeva(request,response);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				str = "join_ok.jsp";
				
			break;
		
		case "/rMovname.do":
			hi = new HaevarMovname();
			try {
				hi.haeva(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "review_insert.jsp";
			break;
		case "/rSearchOne.do":
			hi = new HaevaSearchOne();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "review_view.jsp";
			break;
		case "/rInsert.do":
			hi = new HaevaInsert();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			//System.out.println("insert.do 占쏙옙占쏙옙");
			str = "/Movie_sub.do";
			//str = "review_form.jsp";
			break;
		case "/rUpdate.do":
			hi = new HaevaUpdate();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/Movie_sub.do";
			break;
		case "/rDelete.do":
			hi = new HaevaDelete();
			try {
				hi.haeva(request, response);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			str = "/Movie_sub.do";
			break;	
			
			
		case "/Movie_sub.do":
		/*case "/paging.do":*/
			hi = new MoviegetInfo();			
				try {								
					hi.haeva(request,response);
					str = "movie_view.jsp";
				} catch (Exception e) {
					e.printStackTrace();
					str = "movie_view.jsp";
				}
				
				break;
		case "/mem_update.do":
		/*case "/paging.do":*/
			hi = new HaevaMemUpdate();			
				try {								
					hi.haeva(request,response);
					str = "mypage.jsp";
				} catch (Exception e) {
					e.printStackTrace();
					str = "mypage.jsp";
				}
				
				break;
	          
	       }
		
		
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}
	
	

}
