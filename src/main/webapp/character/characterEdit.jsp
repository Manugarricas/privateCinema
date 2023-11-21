<%@page import="com.cinema.repository.CharacterRepository"%>
<%@page import="com.cinema.model.Character"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Characters edit</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

</head>
<body>
<%@include file="../nav.jsp" %>
<%
String nation = "";
String gender = "";
Character c = null;

//Pasamos un personaje al objeto c
	c = CharacterRepository.getCharacter(request.getParameter("characterEdit"));
	
	String name = "";
	//Controlamos que el objeto c no sea nulo
	if(c != null){
		name = c.getName();
		nation = c.getNationality();
		gender = c.getSex();
		
	}
	%>
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
      <input id="nationality" name="nationality" type="text" class="form-control" required="required" value="<%=nation %>">
    </div>
  </div>
  <div class="form-group row">
    <label for="sex" class="col-4 col-form-label">Sex</label> 
    <div class="col-8">
      <input id="sex" name="sex" type="text" class="form-control" required="required" value="<%=gender %>">
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
//Aqui especificamos que si pulsan el boton con name submit nos edite el personaje y despues nos devuelta al lista de personajes
		if(request.getParameter("submit") != null){
			Character c2 = new Character(request.getParameter("name"),request.getParameter("nationality"),request.getParameter("sex"));
			CharacterRepository.editCharacter(c2);
			response.sendRedirect("characterList.jsp");
		}
//Si se pulsa el boton cancelar nos devuelve a la lista de personajes
		if(request.getParameter("cancel") != null){
			response.sendRedirect("characterList.jsp");
		}

		%>
		


</body>
</html>