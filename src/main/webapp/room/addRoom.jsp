<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.cinema.model.Room" %>
    <%@ page import="com.cinema.model.Cinema" %>
    <%@ page import="com.cinema.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add room</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<%@ include file="../nav.jsp" %>
	<%
	//creamos algunas variables y recogemos datos
	String button = request.getParameter("submit");
	String message = "";
	Room room = null;
	
	if (button != null) {
		if (button != "") {
			try {
				Cinema cinema = DbRepository.find(Cinema.class ,request.getParameter("cinema"));
				int idRoom = Integer.parseInt(request.getParameter("idRoom"));
				int capacity = Integer.parseInt(request.getParameter("capacity"));
				room = new Room(cinema, idRoom, capacity);
				
				if (DbRepository.find(room) == null) {//comprobamos si la sala ya existe
					DbRepository.add(Room.class, room);//si no existe, la creamos y añadimos a la base de datos
					message = "Sala creada correctamente.";
				}
				else {//si ya existe se lo decimos al usuario
					message = "Esta sala ya existe, ingresa un id de sala diferente.";
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				message = "Ha habido un error al crear la sala.";
			}
		}
	}
	
	%>

<form action="./addRoom.jsp" method="post">
  <div class="form-group row">
    <label for="cinema" class="col-4 col-form-label">Cinema</label> 
    <div class="col-8">
      <select id="cinema" name="cinema" class="custom-select" required="required">
      	<%
      	ArrayList<Cinema> cinemas = null; 
      	try {
      		cinemas = (ArrayList<Cinema>)DbRepository.findAll(Cinema.class);
      	} catch (Exception e) {
      		response.sendRedirect("../error.jsp?msg="+e.getMessage());
    		return;
      	}
      	for (Cinema c : cinemas) {
      	%>
      	<option value='<%= c.getCinema() %>'><%= c.getCinema() %></option>
      	<%}%>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="room" class="col-4 col-form-label">idRoom</label> 
    <div class="col-8">
      <input id="idRoom" name="idRoom" type="number" class="form-control" required="required" max="99">
    </div>
  </div>
  <div class="form-group row">
    <label for="capacity" class="col-4 col-form-label">Capacity</label> 
    <div class="col-8">
      <input id="capacity" name="capacity" type="number" class="form-control" required="required" max="9999">
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" value="add" type="submit" class="btn btn-primary">Add</button>
    </div>
  </div>
</form>
<%= message %>
</body>
</html>