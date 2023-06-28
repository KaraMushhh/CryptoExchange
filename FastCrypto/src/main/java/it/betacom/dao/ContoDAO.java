package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import it.betacom.bean.Conto;
import it.betacom.bean.Utente;

public class ContoDAO {
	
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crypto","root","Ciccio1968");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static Conto getRecordByUsername(String username){
		Conto c=null;
		try{
			Connection connection=getConnection();
			Utente u=UtenteDAO.getRecordByUsername(username);
			PreparedStatement ps=connection.prepareStatement("select * from conto where idUtente=?");
			ps.setInt(1,u.getIdU());
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				c=new Conto();
				c.setIdC(rs.getInt("id"));
				c.setIdUtente(rs.getInt("idUtente"));
				c.setEuro(rs.getDouble("euro"));
				c.setBitcoin(rs.getDouble("bitcoin"));
				c.setEthereum(rs.getDouble("ethereum"));
				c.setRipple(rs.getDouble("ripple"));
				
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return c;
	}
	
	public static int update(Conto c){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("update conto set euro=?, bitcoin=?, ethereum=?, ripple=? where id=?");
			ps.setDouble(1,c.getEuro());
			ps.setDouble(2,c.getBitcoin());
			ps.setDouble(3,c.getEthereum());
			ps.setDouble(4,c.getRipple());
			ps.setInt(5,c.getIdC());
			status=ps.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static void addBitcoin (String mail, double euro, double bitcoin) {
		
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()-euro);
		c.setBitcoin(c.getBitcoin()+bitcoin);
		ContoDAO.update(c);
			
	}
	
	public static void addEthereum (String mail, double euro, double ethereum) {
		
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()-euro);
		c.setEthereum(c.getEthereum()+ethereum);
		ContoDAO.update(c);
		
	}
	
	public static void addRipple (String mail, double euro, double ripple) {
		
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()-euro);
		c.setRipple(c.getRipple()+ripple);
		ContoDAO.update(c);
		
	}
	
	public static void subBitcoin (String mail, double euro, double bitcoin) {
		
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()+euro);
		c.setBitcoin(c.getBitcoin()-bitcoin);
		ContoDAO.update(c);
		
	}

	public static void subEthereum (String mail, double euro, double ethereum) {
	
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()+euro);
		c.setEthereum(c.getEthereum()-ethereum);
		ContoDAO.update(c);
	
	}

	public static void subRipple (String mail, double euro, double ripple) {
		
		System.out.println(mail);
		Conto c=ContoDAO.getRecordByUsername(mail);
		c.setEuro(c.getEuro()+euro);
		c.setRipple(c.getRipple()-ripple);
		ContoDAO.update(c);
	
	}

}
