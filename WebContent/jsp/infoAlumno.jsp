<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="net.tecgurus.schoolmanager.model.Alumno" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <!-- Compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="css/styles.css" />
    <title>Alumnos</title>
  </head>
  <body>
    <!-- Header -  menú -->
    <div>
      <nav class="teal">
        <div class="nav-wrapper container">
          <a href="#" class="brand-logo">SchoolManager</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li class="active">
              <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
              <form action="/" method="">
                <a><button class="btn-flat menu-button">Alumnos</button></a>
              </form>
            </li>
            <li>
              <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
              <form action="/" method="">
                <a><button class="btn-flat menu-button">Cursos</button></a>
              </form>
            </li>
          </ul>
        </div>
      </nav>
    </div>
	
    <% Alumno alumno =(Alumno) request.getAttribute("alumno"); %>
    <!-- OBTEN EL LA INFORMACIÓN DEL ALUMNO CONSULTADA DE LA BASE DE DATOS -->

    <!-- Controles -->
    <div class="container acciones">
      <!-- AGREGA EL NOMBRE DEL USUARIO ENTRE LAS ETIQUETAS <p></p> -->
      <p class="flow-text"><%= alumno.getName() %></p>
      <div>
        <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
        <form action="/" method="">
          <button
            class="waves-effect teal waves-light btn btn-large btn-floating"
          >
            <i class="material-icons">arrow_back</i>
          </button>
        </form>
        <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
        <form action="AlumnoController" method="get">
          <button
            class="waves-effect teal waves-light btn btn-large btn-floating"
          >
            <i class="material-icons">create</i>
          </button>
          <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
          <input type="hidden" name="accion" value="redirectEditarAlumno" />
          <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("idAlumno") -->
          <!--AGREGA EL ID DEL ALUMNO EN EL CAMPO value-->
          <input type="hidden" name="idAlumno" value="<%=alumno.getId() %>" />
        </form>
      </div>
    </div>

    <!-- Información  del usuario-->
    <div class="container principal">
      <div class="row">
        <!-- Info. personal -->
        <div style="background-color: rgba(242, 242, 242, 0.5);" class="col s4">
          <p><strong style="color: #00897b;">Datos Personales</strong></p>
          <div>
            <div class="row">
              <div class="col s12">
                <label for="name">Nombre</label>
                <!-- AGREGA EL NOMBRE DEL USUARIO ENTRE LAS ETIQUETAS <p></p> -->
                <p id="name"><%=alumno.getName() %></p>
              </div>
            </div>
            <div class="row">
              <div class="col s12">
                <label for="email">Email</label>
                <!-- AGREGA EL EMAIL DEL USUARIO ENTRE LAS ETIQUETAS <p></p> -->
                <p id="email"><%=alumno.getEmail() %></p>
              </div>
            </div>
            <div class="row">
              <div class="col s12">
                <label for="age">Edad</label>
                <!-- AGREGA LA EDAD DEL USUARIO ENTRE LAS ETIQUETAS <p></p> -->
                <p id="age"><%=alumno.getEdad() %></p>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col s12">
              <label for="gender">Genero</label>
              <!-- USA EL CAMPO genero DEL USUARIO PARA MOSTRAR hombre o mujer SEGUN  SEA EL CASO -->
              <%if(alumno.getGenero() == 'm'){ %>
              	<p id="gender">Hombre</p>
              <% } else{ %>
              	<p id="gender">Mujer</p>
              	<%} %>
            </div>
          </div>
        </div>

        <!-- Cursos -->
        <div class="col s7 offset-s1">
          <!-- Cursos disponibles -->
          <p><strong style="color: #00897b;">Inscribirme a curso</strong></p>
          <div class="row">
            <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
            <form class="col s12" action="/" method="">
              <div class="row">
                <div class="input-field col s11">
                  <select name="idCurso">
                    <!-- OBTEN LOS CURSOS DISPONIBLES CONSULTADDO  LA BASE DE DATOS -->
                    <!-- CREA UNA ETIQUETA option  POR CADA CURSO DISPONIBLE -->
                    <!-- AGREGA EL id DEL CURSO EN EL CAMPO value -->
                    <!-- AGREGA EL nombre DEL CURSO ENTRE LAS ETIQUETAS option -->
                    <option value="1">Java desde Cero</option>
                  </select>
                </div>
                <div class="input-field col s1">
                  <button
                    class="btn waves-effect waves-light text-center"
                    type="submit"
                    name="action"
                  >
                    <i class="material-icons">send</i>
                  </button>
                </div>
                <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
                <input type="hidden" name="accion" value="" />
                <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("idAlumno") -->
                <!--AGREGA EL ID DEL ALUMNO EN EL CAMPO value-->
                <input type="hidden" name="idAlumno" value="" />
              </div>
            </form>
          </div>

          <!-- Cursos asignados -->
          <p><strong style="color: #00897b;">Cursos Asignados</strong></p>
          <table class="striped">
            <thead>
              <tr>
                <th>Nombre</th>
                <th>Acciones</th>
              </tr>
            </thead>

            <tbody>
              <!-- OBTEN LAS INSCRIPCIONES DEL ALUMNO LA BASE DE DATOS -->
              <tr>
                <!-- AGREGA EL NOMBRE DEL CADA  CURSO  ENTRE LAS ETIQUETAS <td></td>  -->
                <td>Java dede Cero</td>
                <td>
                  <div class="acciones-renglon">
                    <form action="/inscripciones" method="post">
                      <button class="waves-effect waves-light btn btn-floating">
                        <i class="material-icons">delete</i>
                      </button>
                      <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
                      <input
                        type="hidden"
                        name="accion"
                        value="eliminarInscripcion"
                      />
                      <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("idInscripcion") -->
                      <!--AGREGA EL ID DEL LA INSCRIPCION EN EL CAMPO value-->
                      <input type="hidden" name="idInscripcion" value="" />
                      <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("idAlumno") -->
                      <!--AGREGA EL ID DEL ALUMNO EN EL CAMPO value-->
                      <input type="hidden" name="idAlumno" value="" />
                    </form>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="js/script.js"></script>
  </body>
</html>
