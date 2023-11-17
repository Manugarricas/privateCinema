<%@page import="com.cinema.repository.CharacterRepository"%>
<%@page import="com.cinema.model.Character"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Characters delete</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

</head>
<body>



<%
Character c = null;


	//Pasamos un personaje al objeto c
	c = CharacterRepository.getCharacter(request.getParameter("characterDelete"));
	
	String name = "";
	String nationality = "";
	String sex = "";
	
	//Controlamos que el objeto c no sea nulo
	try{
	if(c != null){
		name = c.getName();
		nationality = c.getNationality();
		sex = c.getSex();
	}
	}catch(Exception e){
		
	}
	%>


<!-- //Creamos la cabecera y el formulario -->

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
<!-- Creamos el formulario con sus respectivos campos de la tabla personaje -->

<form>
<br>
  <div class="form-group row">
  
    <label for="name" class="col-4 col-form-label">Name</label> 
    <div class="col-8">
      <input id="name" name="name" type="text" class="form-control" value='<%=name%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="nationality" class="col-4 col-form-label">Nacionality</label> 
    <div class="col-8">
      <input id="nationality" name="nationality" type="text" class="form-control" value='<%=nationality%>' readonly="readonly">
    </div>
  </div>
  <div class="form-group row">
    <label for="sex" class="col-4 col-form-label">Sex</label> 
    <div class="col-8">
      <input id="sex" name="sex" type="text" class="form-control" value='<%=sex%>' readonly="readonly">
    </div>
  </div>
  <p align="center">Deseas continuar con los cambios realizados</p>
  <div class="form-group row">
    <div class="offset-4 col-8">
    <button name="cancel" name="cancel" type="submit" class="btn btn-primary">Cancel</button>
      <button name="submit" name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>

<%
	if(request.getParameter("submit") != null){
		CharacterRepository.deleteCharacter(request.getParameter("name"));
		response.sendRedirect("characterList.jsp");
	
}

	if(request.getParameter("cancel") != null){
		response.sendRedirect("characterList.jsp");
	}
%>
</body>
</html>