<%@page import="com.cinema.repository.CharacterRepository"%>
<%@page import="com.cinema.model.Character"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <a href="${pageContext.request.servletContext.contextPath}/character/addCharacter.jsp"><button type="button">Añadir Personaje</button></a>
        <a href="${pageContext.request.servletContext.contextPath}/character/characterList.jsp"><button type="button">Lista de Personaje</button></a>  
          
    </header>


<!-- Creamos las variables y objeto que usaremos para llamar a los datos del comentario  -->
<%
String answer = "Add required fields";
String name ="";
String nationality ="";
String sex ="";
String details = "No character has been created";
Character c = null;

try{
	if(request.getParameter("submit") != null){
		name = request.getParameter("name");
		nationality = request.getParameter("nationality");
		sex = request.getParameter("sex");
// 		Controlamos que las excepciones del campo sexo se cumplan
	if(sex.equals("H") || sex.equals("M") || sex.equals("O")){
	c = new Character(name, nationality, sex);
	CharacterRepository.addCharacter(c);
	answer = "Add Character correctly";
	details = String.format("El ultimo personaje creado tiene de nombre: %s , nacionalidad: %s y sexo: %s." , name, nationality, sex);
	}
	}
}catch(Exception e){
	e.getMessage();
}
%>

<!-- Creamos el formulario con sus respectivos campos de la tabla personaje -->
<form action="addCharacter.jsp">
  <div class="form-group row">
    <label for="name" class="col-4 col-form-label">Name</label> 
    <div class="col-8">
      <input id="name" name="name" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="nationality" class="col-4 col-form-label">Nacionality</label> 
    <div class="col-8">
      <input id="nationality" name="nationality" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="sex" class="col-4 col-form-label">Sex</label> 
    <div class="col-8">
      <input id="sex" name="sex" type="text" class="form-control" required="required">
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