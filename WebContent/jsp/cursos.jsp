<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

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
    <link rel="stylesheet" href="../css/styles.css" />
    <title>Curso</title>
  </head>
  <body>
    <!-- Header -  menú -->
    <div>
      <nav class="teal">
        <div class="nav-wrapper container">
          <a href="#" class="brand-logo">SchoolManager</a>
          <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li>
              <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
              <form action="/" method="">
                <a><button class="btn-flat menu-button">Alumnos</button></a>
              </form>
            </li>
            <li class="active">
              <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
              <form action="/" method="">
                <a><button class="btn-flat menu-button">Cursos</button></a>
              </form>
            </li>
          </ul>
        </div>
      </nav>
    </div>

    <!-- Controles -->
    <div class="container acciones">
      <p class="flow-text">Cursos</p>
      <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
      <form action="/" method="">
        <button
          class="waves-effect teal waves-light btn btn-large btn-floating"
        >
          <i class="material-icons">add</i>
        </button>
        <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
        <input type="hidden" name="accion" value="" />
      </form>
    </div>

    <!-- Tabla de alumnos -->
    <div class="container principal">
      <table class="striped">
        <thead>
          <tr>
            <th>#</th>
            <th>Nombre</th>
            <th style="width: 85px;">Acciones</th>
          </tr>
        </thead>

        <tbody>
          <!-- ITERA LOS CURSOS OBTENIDOS DE LA BASE DE DATOS Y CREA UN RENGLON NUEVO POR CADA REGISTRO -->
          <tr>
            <td>1</td>
            <td>Java desde Cero</td>
            <td>
              <div class="acciones-renglon">
                <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
                <form action="/" method="">
                  <button class="waves-effect waves-light btn btn-floating">
                    <i class="material-icons">delete</i>
                  </button>
                  <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
                  <input type="hidden" name="accion" value="" />
                  <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("idCurso") -->
                  <!--AGREGA EL ID DEL ALUMNO EN EL CAMPO value-->
                  <input type="hidden" name="idCurso" value="" />
                </form>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../js/script.js"></script>
  </body>
</html>
