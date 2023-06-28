package it.betacom.bean;

import java.text.DecimalFormat;

public class Conto {
	
	private static final DecimalFormat df = new DecimalFormat("0.00");
	private int idC;
	private int idUtente;
	private double euro;
	private double bitcoin;
	private double ethereum;
	private double ripple;
	

	public int getIdC() {
		return idC;
	}

	public void setIdC(int idC) {
		this.idC = idC;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public double getEuro() {
		return euro;
	}

	public void setEuro(double euro) {
		this.euro = euro;
	}

	public double getBitcoin() {
		return bitcoin;
	}

	public void setBitcoin(double bitcoin) {
		this.bitcoin = bitcoin;
	}

	public double getEthereum() {
		return ethereum;
	}

	public void setEthereum(double ethereum) {
		this.ethereum = ethereum;
	}

	public double getRipple() {
		return ripple;
	}

	public void setRipple(double ripple) {
		this.ripple = ripple;
	}

	@Override
	public String toString() {
		return "Conto [idC=" + idC + ", idUtente=" + idUtente + ", euro=" + euro + ", bitcoin=" + bitcoin
				+ ", ethereum=" + ethereum + ", ripple=" + ripple + "]";
	}
	
	

}
