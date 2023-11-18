<%@page import="com.cinema.repository.DbRepository"%>
<%@page import="com.cinema.model.Cinema"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Characters</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">
</head>
<body>
<header>
        <nav>
            <div class="menu">
            <a href="${pageContext.request.servletContext.contextPath}/film/listFilm.jsp">Peliculas</a>
            <a href="${pageContext.request.servletContext.contextPath}/character/characterList.jsp">Personajes</a>
            <a href="${pageContext.request.servletContext.contextPath}/tasks/listTask.jsp">Tareas</a>
            </div>
        </nav>
        <a href="${pageContext.request.servletContext.contextPath}/cinema/addCinema.jsp"><button type="button">A�adir Cine</button></a>
        <a href="${pageContext.request.servletContext.contextPath}/cinema/listCinema.jsp"><button type="button">Lista de Cines</button></a>  
    </header>


<!-- Creamos las variables y objeto que usaremos para llamar a los datos del comentario  -->
<%
String answer = "Add required fields";
String cinema ="";
String city ="";
String management ="";
String details = "No character has been created";
Cinema c = null;

try{
	if(request.getParameter("submit") != null){
		cinema = request.getParameter("cinema");
		city = request.getParameter("city");
		management = request.getParameter("management");
// 		Controlamos que las excepciones del campo sexo se cumplan
	if(!cinema.trim().isEmpty() || !city.trim().isEmpty()){
	c = new Cinema(cinema, city, management);
	if(DbRepository.find(Cinema.class, c.getCinema())==null){
		DbRepository.add(Cinema.class, c);
		answer = "Add Character correctly";
		details = String.format("El ultimo cine creado se llama : %s , se encuentra en la ciudad : %s y su director es : %s." , cinema, city, management);
	}else{
		answer = "Cinema already exists";
		
	}
	
	}
	}
}catch(Exception e){
	e.getMessage();
}
%>

<!-- Creamos el formulario con sus respectivos campos de la tabla personaje -->
<form action="addCinema.jsp">
  <div class="form-group row">
    <label for="name" class="col-4 col-form-label">Nombre del Cine</label> 
    <div class="col-8">
      <input id="cinema" name="cinema" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="city" class="col-4 col-form-label">Ciudad del cine</label> 
    <div class="col-8">
      <input id="city" name="city" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="sex" class="col-4 col-form-label">Director</label> 
    <div class="col-8">
      <input id="management" name="management" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="respuesta" class="col-4 col-form-label"><%=answer %></label> 
  </div>  
   <div class="form-group row">
    <label for="respuesta" class="col-4 col-form-label"><%=details %></label> 
  </div>  
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
</body>
</html>