package it.betacom.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.betacom.bean.Login;
import it.betacom.dao.UtenteDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 5284667188786893699L;
	private UtenteDAO utenteDAO;
	
	public void init() {
	    utenteDAO = new UtenteDAO();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			
		    String username = request.getParameter("username");
		    String password = request.getParameter("password");
		    Login login = new Login();
		    login.setUsername(username);
		    login.setPassword(password);
		    int valid=utenteDAO.validate(login);
		    
		    if (valid!=0) {
				   HttpSession session = request.getSession();
				   session.setAttribute("username",username);
				   response.sendRedirect("conto.jsp");
		    } else {	  
	            response.sendRedirect("loginfailed.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
