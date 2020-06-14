package net.tecgurus.schoolmanager.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	
	public Connection conectar() throws SQLException, ClassNotFoundException {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String url = "jdbc:mysql://localhost:3306/SchoolManager?usetTimezone=true&serverTimezone=UTC";
		String user = "root";
		String password = "12345678";
		return DriverManager.getConnection(url, user, password);
	}

}
