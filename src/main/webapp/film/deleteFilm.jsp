<%@page import="com.cinema.exceptions.FilmException"%>
<%@page import="com.cinema.repository.FilmRepository"%>
<%@page import="com.cinema.model.Film"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Borrar Pelicula</title>
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
String code=""; //Codigo de inyeccion

try{
	
	
	
	//Capturamos la pelicula
	f = FilmRepository.getFilm(request.getParameter("id"));	
	//Creamos el boton de borrar que cambiara por el de confirmacion cuando lo pulsemos
	code = String.format("<div class='form-group row'><div class='offset-4 col-8'><button name='del' class='btn btn-primary'>Borrar</button></div></div>");

	
	//Si pulsamos el boton de modificar
	if(request.getParameter("del")!=null){
		//Aparece la confirmacion de borrar
		code = String.format("<div class='form-group row'><label>¿Estas segudo que deseas borrar esta pelicula?</label><div class='offset-4 col-8'><button name='yn' type='submit' class='btn btn-primary' value='si'>Si</button><button name='yn' type='submit' class='btn btn-primary' value='no'>No</button></div></div>");	
	}
	
	//Si pulsamos a que estamos seguro
	if(request.getParameter("yn")!=null && request.getParameter("yn").equals("si")){
			//La borramos
			FilmRepository.deleteFilm(f);
			answer ="Se ha eliminado correctamente";
			//Por codigo de inyeccion desabilitamos el boton
			code = String.format("<div class='form-group row'><div class='offset-4 col-8'><button name='del' class='btn btn-primary' disabled>Borrar</button></div></div>");
		
			//Si elegimos que no estamos seguros
		}else if(request.getParameter("yn")!=null && request.getParameter("yn").equals("no")){
			//No la borramos y aparece otra vez el boton de borrar
			code = String.format("<div class='form-group row'><div class='offset-4 col-8'><button name='del' class='btn btn-primary'>Borrar</button></div></div>");
			
		}

}catch(FilmException e){
	answer = e.getMessage();
	
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
        <a href="${pageContext.request.servletContext.contextPath}/film/listFilm.jsp"><button type="button">Lista de Pelicula</button></a>  
          
    </header>

<h2>Borrar Pelicula</h2><br>
<h3>¿Deseas borrar esta pelicula?</h3>	<br>
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
    <label for="title" class="col-4 col-form-label">Title</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-address-card"></i>
          </div>
        </div> 
        <input id="title" name="title" type="text" class="form-control"  required="required" value ='<%=f.getName()%>' readonly="readonly">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="year" class="col-4 col-form-label">Production year</label> 
    <div class="col-8">
      <input id="year" name="year" type="text" class="form-control"  required="required" value ='<%=f.getYear()%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="st" class="col-4 col-form-label">Secundary title</label> 
    <div class="col-8">
      <input id="st" name="st" type="text" class="form-control" value ='<%=f.getSecundaryName()%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="nacionality" class="col-4 col-form-label">Nacionality</label> 
    <div class="col-8">
      <input id="nacionality" name="nacionality" type="text" class="form-control" value ='<%=f.getNacionality()%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="cost" class="col-4 col-form-label">Cost</label> 
    <div class="col-8">
      <input id="cost" name="cost" type="text" class="form-control" value ='<%=f.getPresupuesto()%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="duration" class="col-4 col-form-label">Duration</label> 
    <div class="col-8">
      <input id="duration" name="duration" type="text" class="form-control" value ='<%=f.getDuration()%>' readonly="readonly">
    </div>
  </div> 
   <div class="form-group row">
    <label for="respuesta" class="col-4 col-form-label"><%=answer %></label> 
  </div>   
  
  <%//Aqui apareceran las ventanas de confirmacion de borrar y los botones
  out.print(code); %>
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