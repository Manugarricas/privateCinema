<%@page import="com.cinema.repository.FilmRepository"%>
<%@page import="com.cinema.model.Film"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Peliculas</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
</head>
<body>
<%@include file="../nav.jsp" %>
<%
//Variable donde almacenaremos todas las peliculas
List<Film> result = new ArrayList();
try{
	//Utilizamos el metodo getFilms() para traerlas de nuestra base de datos
	result = FilmRepository.getFilms();
}catch(Exception e){
	e.getMessage();
}%>
<h1>Lista de peliculas</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Titulo</th>
    </tr>
  </thead>
  <tbody>
  <!-- Recorremos toda la lista para crear una fila por cada una de ellas y un boton para mostrar toda la informacion -->
  <%for(Film f: result) { %>
    <tr>
      <td><%=f.getName() %></td>
      <td>
      <form action="showFilm.jsp">
      <!-- Le proporcionamos al boton al cual llamara al showFilm.jsp, el valor del id de la pelicula en especifico en 
      la que ha pulsado -->
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId()%>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Ver</button>
		  </div>
		</div>
      </form>
      </td>
    </tr>
    <%} %>
  </tbody>
</table>
</body>
</html>
</body>
</html>