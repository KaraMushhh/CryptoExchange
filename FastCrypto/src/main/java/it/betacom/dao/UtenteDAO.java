package it.betacom.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import it.betacom.bean.Login;
import it.betacom.bean.Utente;

public class UtenteDAO {
	
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
	
	public int validate(Login login) {
    	
        int valid=0;
        try {
        	Connection connection=getConnection();

            PreparedStatement ps = connection.prepareStatement("select * from utente where email = ? and password = ?"); 
            ps.setString(1, login.getUsername());
            ps.setString(2, login.getPassword());

            System.out.println(ps);
            ResultSet rs = ps.executeQuery();  
            if (rs.next()) {
            	valid=1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }
	
	public static Utente getRecordByUsername(String username){
		Utente u=null;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("select * from utente where email=?");
			ps.setString(1,username);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				u=new Utente();
				u.setIdU(rs.getInt("id"));
				u.setEmail(rs.getString("email"));
				u.setNome(rs.getString("nome"));
				u.setCognome(rs.getString("cognome"));
				u.setNazione(rs.getString("nazione"));
				u.setIndirizzo(rs.getString("indirizzo"));
				u.setCitta(rs.getString("città"));
				u.setPassword(rs.getString("password"));
				u.setDataNascita(rs.getDate("dataNascita"));
				u.setSesso(rs.getString("sesso"));
				
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public static int save(Utente u){
		
		int status=0;
		try{
			Connection connection=getConnection();
			PreparedStatement ps=connection.prepareStatement("insert into utente(email,nome,cognome,nazione,indirizzo,città,password,dataNascita,sesso) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getNome());
			ps.setString(3, u.getCognome());
			ps.setString(4, u.getNazione());
			ps.setString(5, u.getIndirizzo());
			ps.setString(6, u.getCitta());
			ps.setString(7, u.getPassword());
			ps.setDate(8, new java.sql.Date(u.getDataNascita().getTime()));
			ps.setString(9, u.getSesso());
			status=ps.executeUpdate();
			
			String query="select id from utente where email=?";
			PreparedStatement ps1=connection.prepareStatement(query);
			ps1.setString(1, u.getEmail());
			ResultSet rs=ps1.executeQuery();
			int codiceU=0;
			while (rs.next()) codiceU=rs.getInt("id");
			
			PreparedStatement ps2=connection.prepareStatement("insert into conto(idUtente,euro,bitcoin,ethereum,ripple) values(?,10000,0,0,0)");
			if (codiceU!=0) {
				ps2.setInt(1, codiceU);
				ps2.executeUpdate();
			}
			
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
