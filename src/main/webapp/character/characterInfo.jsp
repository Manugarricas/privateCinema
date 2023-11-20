<%@page import="com.cinema.repository.DbRepository"%>
<%@page import="com.cinema.exceptions.FilmException"%>
<%@page import="com.cinema.repository.FilmRepository"%>
<%@page import="com.cinema.model.Character"%>
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

<%

//En este jps haremos algo similar a listFilm, con la diferencia de que mostraremos la informacion de la pelicula seleccionada
List<Character> result = new ArrayList();
Character show = null;

try{
	
	result = DbRepository.findAll(Character.class);
	//Una vez tenemos la lista de peliculas, recuperamos la pelicula seleccionada en el boton
	show = DbRepository.find(Character.class, request.getParameter("idCharacter"));
	
}catch(FilmException e){
	response.sendRedirect("../error?msg=Error al encontrar al personaje");
}


%>
<header>
        <nav>
            <div class="menu">
            <a href="${pageContext.request.servletContext.contextPath}/film/listFilm.jsp">Peliculas</a>
            <a href="${pageContext.request.servletContext.contextPath}/character/characterList.jsp">Personajes</a>
            <a href="${pageContext.request.servletContext.contextPath}/tasks/listTask.jsp">Tareas</a>
            </div>
        </nav>
        <a href="${pageContext.request.servletContext.contextPath}/film/addFilm.jsp"><button type="button">Añadir Pelicula</button></a>
        <a href="${pageContext.request.servletContext.contextPath}/film/listFilm.jsp"><button type="button">Lista de Peliculas</button></a>  
          
    </header>
<h1><h1>Lista de Peliculas</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Nombre del personaje</th>
    </tr>
  </thead>
  <tbody>
  <%for(Character character: result) {
	  //Comprobamos si la pelicula que estamos listando corresponde a la que hemos pulsado para mostrar sus datos
	  //Si es esa mostraremos todos los datos de la peliculas ademas de cambiar su boton de Show Film a Film para ocultar los datos
	  if(character.getName().equals(show.getName())){%>
    <tr>
      <td>
	     Nombre de la persona: <%=show.getName()%><br>
	     Nacionalidad: <%=show.getNationality() %><br>
	     Genero: <%=show.getSex() %><br>
      <td>
      <form action="listCharacters.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=show.getName()%>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Titulo</button>
		  </div>
		</div>
      </form>
      </td>
       <td>
      <form action="characterEdit.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=show.getName() %>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Editar</button>
		  </div>
		</div>
      </form>
      </td>
      <td>
      <form action="characterDelete.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=show.getName() %>' hidden>
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Borrar</button>
		  </div>
		</div>
      </form>
      </td>
      <td>
      <form action="../jobs/infoJobs.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=show.getName() %>' hidden>
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
      <td><%=character.getName() %></td>
      <td>
      <form action="characterInfo.jsp">
      <input id="id" name="id" type="text" class="form-control" value= '<%=character.getName()%>' hidden>
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