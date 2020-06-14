package net.tecgurus.schoolmanager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.tecgurus.schoolmanager.db.ConnectionFactory;
import net.tecgurus.schoolmanager.model.Alumno;

public class AlumnoDao {
	private final ConnectionFactory connectionFactory = new ConnectionFactory();
	
	public List<Alumno> listar() throws SQLException, ClassNotFoundException  {
		Connection connection =  connectionFactory.conectar();
		List<Alumno> alumnos = new ArrayList<>();
		if(connection != null) {
			String query = "SELECT * FROM alumnos;";
			PreparedStatement select = connection.prepareStatement(query);
			ResultSet rs =select.executeQuery();
			
			if(rs != null) {
				while(rs.next()) {
					Alumno alumno = new Alumno();
					alumno.setId(rs.getInt("id"));
					alumno.setName(rs.getString("nombre"));
					alumno.setEmail(rs.getString("email"));
					alumno.setEdad(rs.getInt("edad"));
					alumno.setGenero(rs.getString("genero") != null ? rs.getString("genero").charAt(0): null);
					
					alumnos.add(alumno);
				}
				rs.close();
			}
			select.close();
			connection.close();
		}
		
		return alumnos;
	}

}
