<%@page import="com.cinema.exceptions.FilmException"%>
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
<title>Informacion Pelicula</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
</head>
<body>
<%@include file="../nav.jsp" %>
<%

//En este jps haremos algo similar a listFilm, con la diferencia de que mostraremos la informacion de la pelicula seleccionada
List<Film> result = new ArrayList();
Film show = null;

try{
	
	result = FilmRepository.getFilms();
	//Una vez tenemos la lista de peliculas, recuperamos la pelicula seleccionada en el boton
	show = FilmRepository.getFilm(request.getParameter("id"));
	
}catch(FilmException e){
	e.getMessage();	
}


%>
<h1><h1>Lista de peliculas</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Film name</th>
    </tr>
  </thead>
  <tbody>
  <%for(Film f: result) {
	  //Comprobamos si la pelicula que estamos listando corresponde a la que hemos pulsado para mostrar sus datos
	  //Si es esa mostraremos todos los datos de la peliculas ademas de cambiar su boton de Show Film a Film para ocultar los datos
	  if(f.getId().equals(show.getId())){%>
    <tr>
      <td>
	     ID: <%=show.getId()%><br>
	     Nombre: <%=f.getName() %><br>
	     Año: <%=show.getYear() %><br>
	     Nacionalidad: <%=show.getNacionality() %><br>
	     Nombre secundario: <%=show.getSecundaryName() %><br>
	     Presupuesto: <%=show.getPresupuesto() %><br>
	     Duracion: <%=show.getDuration() %>
      <td>
      <form action="listFilm.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId()%>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Titulo</button>
		  </div>
		</div>
      </form>
      </td>
       <td>
      <form action="editFilm.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId() %>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Editar</button>
		  </div>
		</div>
      </form>
      </td>
      <td>
      <form action="deleteFilm.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId() %>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Borrar</button>
		  </div>
		</div>
      </form>
      </td>
      <td>
      <form action="../listJobs.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId() %>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Actores</button>
		  </div>
		</div>
      </form>
      </td>
    </tr>
    <%//Si no es nuestra pelicula simplemente mostramos su nombre y la posibilidad de poder mostrar sus datos
    }else{%>
     <tr>
      <td><%=f.getName() %></td>
      <td>
      <form action="showFilm.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=f.getId()%>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Ver</button>
		  </div>
		</div>
      </form>
      </td>
    </tr>
    
    <%}}%>
  </tbody>
</table>
</body>
</html>
</body>
</html>