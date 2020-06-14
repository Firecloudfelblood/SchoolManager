<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>School Manager</title>
	</head>
	<body>
		<h1>Alumnos</h1>
		<% String nombre= "Gyovanny"; %>
		<p><%=nombre %></p>
		<% String alumno= (String)request.getAttribute("alumno"); %>
		<p>Alumno: <%=alumno %></p>
		<% String curso= (String)request.getAttribute("curso"); %>
		<p>Curso: <%=curso %></p>
		
		<p><%=request.getAttribute("alumno") %></p>
		<p><%=request.getAttribute("curso") %></p>
		
		<form action="AlumnoController" method="post">

				<lable for="nombre">	Nombre: </lable><br/>
				<input id="nombre" type="text" name="nombre" />
			<br /><br />
				<label for="email">Email: </label><br />
				<input id="email" type="email" name="email" />
			<br /><br />
				<button type="submit">Enviar</button>
			
			
		</form>
	</body>
</html>