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
              <!-- AGREGA  LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
              <form action="/" method="">
                <a><button class="btn-flat menu-button">Alumnos</button></a>
              </form>
            </li>
            <li>
              <!-- AGREGA  LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
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
      <p class="flow-text">Agregar Alumnos</p>
      <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
      <form action="/" method="">
        <button
          class="waves-effect teal waves-light btn btn-large btn-floating"
        >
          <i class="material-icons">arrow_back</i>
        </button>
      </form>
    </div>

    <!-- Formulario -->
    <div class="container principal">
      <div class="row principal-form">
        <!-- AGREGA LA URL DE TU SERVLET EN EL CAMPO ACTTION -->
        <form class="col s12" action="/" method="">
          <div class="row">
            <div class="input-field col s12">
              <!-- RECUPERAS EL VALOR DE ESTE CAMPO USANDO request.getParameter("nombre") EN TU SERVLET -->
              <input id="name" type="text" name="nombre" />
              <label for="name">Nombre</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s12">
              <!-- RECUPERAS EL VALOR DE ESTE CAMPO USANDO request.getParameter("email") EN TU SERVLET -->
              <input id="email" type="email" name="email" />
              <label for="email">Email</label>
            </div>
          </div>
          <div class="row">
            <div class="input-field col s6">
              <!-- RECUPERAS EL VALOR DE ESTE CAMPO USANDO request.getParameter("email") EN TU SERVLET -->
              <input id="edad" type="number" name="edad" />
              <label for="edad">Edad</label>
            </div>

            <div class="input-field col s6">
              <!-- RECUPERAS EL VALOR DE ESTE CAMPO USANDO request.getParameter("email") EN TU SERVLET -->
              <select name="genero">
                <option value="f">Mujer</option>
                <option value="m">Hombre</option>
              </select>
              <label>Genero</label>
            </div>
          </div>
          <div class="row">
            <div class="col s12">
              <button
                style="width: 100%;"
                class="btn waves-effect waves-light"
                type="submit"
                name="action"
              >
                Guardar
                <i class="material-icons right">send</i>
              </button>
            </div>
          </div>
          <!--ESTE ES UN ATRIBUTO OCULTO, LO RECUPERAS EN TU SERVLET CON request.getParameter("accion") -->
          <input type="hidden" name="accion" value="agregarAlumno" />
        </form>
      </div>
    </div>

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="../js/script.js"></script>
  </body>
</html>
