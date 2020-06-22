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

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		accion = accion == null ? "" : accion;

		switch (accion) {
		case "redirectAgregarAlumno": {
			request.getRequestDispatcher("jsp/agregarAlumno.jsp").forward(request, response);
		}
			break;

		case "redirectInfoAlumno": {
			String idAlumno = request.getParameter("idAlumno");
			int id = 0;
			if (idAlumno != null) {
				id = Integer.parseInt(idAlumno);
			}

			Alumno alumno = null;
			try {
				alumno = alumnoService.traerPorId(id);
				System.out.println("alumnos: " + alumno);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("alumno", alumno);
			request.getRequestDispatcher("jsp/infoAlumno.jsp").forward(request, response);

		}
			break;

		case "redirectEditarAlumno": {
			String idAlumno = request.getParameter("idAlumno");
			int id = 0;
			if (idAlumno != null) {
				id = Integer.parseInt(idAlumno);
			}

			Alumno alumno = null;
			try {
				alumno = alumnoService.traerPorId(id);
				System.out.println("alumnos: " + alumno);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("alumno", alumno);
			request.getRequestDispatcher("jsp/editarAlumno.jsp").forward(request, response);
		}
			break;

		default: {
			List<Alumno> alumnos = new ArrayList<Alumno>();
			try {
				alumnos = alumnoService.listar();
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			System.out.println("Alumnos: " + alumnos.toString());
			request.setAttribute("alumnos", alumnos);
			request.getRequestDispatcher("jsp/alumnos.jsp").forward(request, response);
		}
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accion = request.getParameter("accion");
		accion = accion == null ? "" : accion;

		switch (accion) {
		case "agregarAlumno": {
			String nombre = request.getParameter("nombre");
			String email = request.getParameter("email");
			String edad = request.getParameter("edad");
			String genero = request.getParameter("genero");
			System.out.println("Nombre: " + nombre);
			System.out.println("Email: " + email);
			System.out.println("Edad: " + edad);
			System.out.println("Genero: " + genero);

			Alumno alumno = new Alumno();
			alumno.setName(nombre);
			alumno.setEmail(email);
			alumno.setEdad(edad != null ? Integer.parseInt(edad) : 0);
			alumno.setGenero(genero != null ? genero.charAt(0) : ' ');

			try {
				alumnoService.agregarAlumno(alumno);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			doGet(request, response);
		}
			break;
		case "editarAlumno": {
			String id = request.getParameter("idAlumno");
			String nombre = request.getParameter("nombre");
			String email = request.getParameter("email");
			String edad = request.getParameter("edad");
			String genero = request.getParameter("genero");
				
			Alumno alumno = new Alumno();
			alumno.setId(Integer.parseInt(id));
			alumno.setName(nombre);
			alumno.setEmail(email);
			alumno.setEdad(edad != null ? Integer.parseInt(edad) : 0);
			alumno.setGenero(genero != null ? genero.charAt(0) : ' ');
			
			System.out.println("Alumno: " + alumno);
			try {
				alumnoService.actualizar(alumno);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("alumno", alumno);
			request.getRequestDispatcher("jsp/infoAlumno.jsp").forward(request, response);
		}
			break;
			
		case "eliminarAlumno": {
			String idAlumno = request.getParameter("idAlumno");
			int id = Integer.parseInt(idAlumno);
			try {
				alumnoService.eliminar(id);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			doGet(request,response);
		}break;
		}
	}

}
