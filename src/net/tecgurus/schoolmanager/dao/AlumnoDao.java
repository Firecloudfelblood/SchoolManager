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
	private Connection connection;
	
	public List<Alumno> listar() throws SQLException, ClassNotFoundException  {
		connection =  connectionFactory.conectar();
		List<Alumno> alumnos = new ArrayList<>();
		String query = "SELECT * FROM alumnos;";
		if(connection != null) {
			
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
	
	public Alumno listaAlumno(int id) throws ClassNotFoundException, SQLException {
		Alumno alumno = new Alumno();
		connection = connectionFactory.conectar();
		if(connection != null) {
			String query = "SELECT * FROM alumnos where id = ?";
			PreparedStatement select = connection.prepareStatement(query);
			select.setInt(1,id);
			ResultSet rs = select.executeQuery();
			if(rs != null) {
				
				while(rs.next()) {
					alumno.setId(rs.getInt("id"));
					alumno.setName(rs.getString("nombre"));
					alumno.setEmail(rs.getString("email"));
					alumno.setEdad(rs.getInt("edad"));
					alumno.setGenero(rs.getString("genero") != null? rs.getString("genero").charAt(0): null);	
				}
				
				
				rs.close();
			}
			
			select.close();
			connection.close();
		}
		return alumno;
	}
	
	public void agregar(Alumno alumno) throws ClassNotFoundException, SQLException {
		connection = connectionFactory.conectar();
		String query = "insert into alumnos(id, nombre, email, edad, genero) values(?, ?, ?, ?, ?);";
		
		if(connection != null) {
			PreparedStatement insert = connection.prepareStatement(query);
			insert.setInt(1, alumno.getId());
			insert.setString(2, alumno.getName());
			insert.setString(3, alumno.getEmail());
			insert.setInt(4, alumno.getEdad());
			insert.setString(5, Character.toString(alumno.getGenero()));
			
			insert.executeLargeUpdate();
			insert.close();
			connection.close();
		}
		
	}
	
	public void eliminar(int id) throws ClassNotFoundException, SQLException {
		connection = connectionFactory.conectar();
		String query ="DELETE FROM alumnos WHERE id = ? "; 
		
		if(connection != null) {
			PreparedStatement delete = connection.prepareStatement(query);
			delete.setInt(1, id);
						
			delete.executeLargeUpdate();
			delete.close();
			connection.close();
		}
	}
	
	public void actualizar(Alumno alumno) throws ClassNotFoundException, SQLException {
		connection = connectionFactory.conectar();
		String query = "UPDATE alumnos SET nombre = ?, email = ?, edad = ?, genero = ? where id = ?;";
		
		if(connection != null) {
			PreparedStatement update = connection.prepareStatement(query);
			update.setString(1, alumno.getName());
			update.setString(2, alumno.getEmail());
			update.setInt(3, alumno.getEdad());
			update.setString(4, Character.toString(alumno.getGenero()));
			update.setInt(5, alumno.getId());
			
			update.executeUpdate();
			update.close();
			connection.close();
		}
	}
}
