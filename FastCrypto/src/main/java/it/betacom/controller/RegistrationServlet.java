package it.betacom.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.betacom.bean.Utente;
import it.betacom.dao.UtenteDAO;

@WebServlet("/registration")
public class RegistrationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 5284667188786893699L;
	private UtenteDAO utenteDAO;
	
	public void init() {
	    utenteDAO = new UtenteDAO();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			String email = request.getParameter("email");
		    String nome = request.getParameter("nome");
		    String cognome = request.getParameter("cognome");
		    String nazione = request.getParameter("nazione");
		    String indirizzo = request.getParameter("indirizzo");
		    String citta = request.getParameter("citta");
		    String password = request.getParameter("password");
		    String data = request.getParameter("dataNascita");
		    Date dataNascita=null;
			
			dataNascita = new SimpleDateFormat("yyyy-mm-dd").parse(data);
		    String sesso = request.getParameter("sesso");
		    Utente utente = new Utente();
		    utente.setEmail(email);
		    utente.setNome(nome);
		    utente.setCognome(cognome);
		    utente.setNazione(nazione);
		    utente.setIndirizzo(indirizzo);
		    utente.setCitta(citta);
		    utente.setPassword(password);
		    utente.setDataNascita(dataNascita);
		    utente.setSesso(sesso);
		    int success=utenteDAO.save(utente);
		    if (success>0) {
		    	response.sendRedirect("registrationsuccess.jsp");
		    } else {
		    	response.sendRedirect("registrationfail.jsp");
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}  
	}
}
