package it.betacom.bean;

import java.util.Date;

public class Utente {
	
	private int idU;
	private String email;
	private String nome;
	private String cognome;
	private String nazione;
	private String citta;
	private String indirizzo;
	private String password;
	private Date dataNascita;
	private String sesso;
	

	public int getIdU() {
		return idU;
	}

	public void setIdU(int idU) {
		this.idU = idU;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getSesso() {
		return sesso;
	}

	public void setSesso(String sesso) {
		this.sesso = sesso;
	}

	@Override
	public String toString() {
		return "Utente [idU=" + idU + ", email=" + email + ", nome=" + nome + ", cognome=" + cognome + ", nazione="
				+ nazione + ", citta=" + citta + ", indirizzo=" + indirizzo + ", password=" + password
				+ ", dataNascita=" + dataNascita + ", sesso=" + sesso + "]";
	}
	

}
