package net.tecgurus.schoolmanager.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tecgurus.schoolmanager.model.Alumno;
import net.tecgurus.schoolmanager.service.AlumnoService;

/**
 * Servlet implementation class AlumnoController
 */
@WebServlet("/AlumnoController")
public class AlumnoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final AlumnoService alumnoService = new AlumnoService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlumnoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Alumno> alumnos = new ArrayList<Alumno>();
		try {
			alumnos = alumnoService.listar();
		}catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} 
		System.out.println("Alumnos: "+ alumnos.toString());
		request.setAttribute("alumnos", alumnos);
		request.getRequestDispatcher("jsp/alumnos.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		System.out.println("Nombre: "+ nombre);
		System.out.println("Email: " + email);
	}

}
