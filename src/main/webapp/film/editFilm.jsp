<%@page import="com.cinema.exceptions.FilmException"%>
<%@page import="com.cinema.repository.FilmRepository"%>
<%@page import="com.cinema.model.Film"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar Pelicula</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
</head>
<body>
<%@include file="../nav.jsp" %>
<%

//Variables donde almacenamos: 
Film f = null; //La pelicula que queremos editar
Film newFilm = null;//La nueva pelicula editada
String answer = "";//La respuesta
String code ="";

try{
	
	//Capturamos la pelicula
	f = FilmRepository.getFilm(request.getParameter("id"));		
	//Si pulsamos el boton de modificar
	if(request.getParameter("mod")!=null){
		//Comprobamos que los parametros requeridos no son nulos
		if( request.getParameter("id")!=null && request.getParameter("title")!=null && request.getParameter("year")!=null){
			//Creamos la nueva pelicula con los nuevos parametros introducidos
			newFilm = new Film (request.getParameter("id"),request.getParameter("title"),request.getParameter("year"), request.getParameter("st"), request.getParameter("nacionality"), request.getParameter("cost"), request.getParameter("duration"));
			//La modificamos
			FilmRepository.modifyFilm(newFilm);
			answer ="Se ha editado correctamente";
		}else{
			answer ="Rellena los campos obligatorios";
		}
		
		//Por codigo de inyeccion introducimos los datos de la pelicla que hemos editado  en un despleglable
		code = String.format("<details close><summary>Detalles de la pelicula editada</summary><label>Id: %s, <br>Nombre: %s,  <br>Año: %s,<br>Titulo Secundario: %s,  <br>Nacionalidad: %s, <br> Presupuesto: %s, <br> Duracion: %s</label></details>", newFilm.getId(), newFilm.getName(), newFilm.getYear(), newFilm.getSecundaryName(), newFilm.getNacionality(), newFilm.getPresupuesto(), newFilm.getDuration());
	}
	
}catch(FilmException e){
	answer =e.getMessage();
	
	
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
<h2>Editar Pelicula</h2>
	
<%if(request.getParameter("mod")!=null){
	//Cuando pulsemos el boton de editar aparecera nuestro depleglable para poder ver los detalles
	out.print(code);
}
 %>
<form>
<div class="form-group row">
    <label for="title" class="col-4 col-form-label">Id</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-address-card"></i>
          </div>
        </div> 
        <input id="id" name="id" type="text" class="form-control"  required="required" readonly="readonly" value ='<%=f.getId()%>'>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="title" class="col-4 col-form-label">Titulo</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-address-card"></i>
          </div>
        </div> 
        <input id="title" name="title" type="text" class="form-control"  required="required" value ='<%=f.getName()%>'>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="year" class="col-4 col-form-label">Año de produccion</label> 
    <div class="col-8">
      <input id="year" name="year" type="text" class="form-control"  required="required" value ='<%=f.getYear()%>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="st" class="col-4 col-form-label">Titulo secundario</label> 
    <div class="col-8">
      <input id="st" name="st" type="text" class="form-control" value ='<%=f.getSecundaryName()%>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="nacionality" class="col-4 col-form-label">Nacionalidad</label> 
    <div class="col-8">
      <input id="nacionality" name="nacionality" type="text" class="form-control" value ='<%=f.getNacionality()%>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="cost" class="col-4 col-form-label">Presupuesto</label> 
    <div class="col-8">
      <input id="cost" name="cost" type="text" class="form-control" value ='<%=f.getPresupuesto()%>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="duration" class="col-4 col-form-label">Duracion</label> 
    <div class="col-8">
      <input id="duration" name="duration" type="text" class="form-control" value ='<%=f.getDuration()%>'>
    </div>
  </div> 
   <div class="form-group row">
    <label for="respuesta" class="col-4 col-form-label"><%=answer %></label> 
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="mod" type="submit" class="btn btn-primary">Editar</button>
    </div>
  </div>
</form>
<!-- Boton para volver a ver todas las peliculas y comprobar que se ha modificado -->
 <form action="listFilm.jsp">
		<div class="form-group row">
		  <div class="offset-4 col-8">
		    <button name="submit" type="submit" class="btn btn-primary">Ver peliculas</button>
		  </div>
		</div>
      </form>
</body>
</html>