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
	
	public Alumno traerPorId(int id) throws ClassNotFoundException, SQLException {
		return alumnoDao.listaAlumno(id);
	}
	
	public void agregarAlumno(Alumno alumno) throws ClassNotFoundException, SQLException {
		 alumnoDao.agregar(alumno);
	}
	
	public void  eliminar(int id) throws ClassNotFoundException, SQLException {
		alumnoDao.eliminar(id);
	}
	
	public void actualizar(Alumno alumno) throws ClassNotFoundException, SQLException {
		alumnoDao.actualizar(alumno);
	}

}
