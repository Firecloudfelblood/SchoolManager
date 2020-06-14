package net.tecgurus.schoolmanager.service;

import java.sql.SQLException;
import java.util.List;

import net.tecgurus.schoolmanager.dao.AlumnoDao;
import net.tecgurus.schoolmanager.model.Alumno;

public class AlumnoService {
	
	private final AlumnoDao alumnoDao = new AlumnoDao();
	
	public List<Alumno> listar() throws SQLException, ClassNotFoundException {
		return alumnoDao.listar();
		
	}

}
